package kr.ph.peach.controller;

import java.io.IOException;
import java.util.List;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.CopyOnWriteArrayList;
import java.util.function.Consumer;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.ph.peach.service.ChatService;
import kr.ph.peach.util.ChatEmitter;
import kr.ph.peach.vo.ChatVO;

@RestController
public class SSEController {

    @Autowired
    private ChatService chatService;

    private final ConcurrentHashMap<Integer, List<ChatEmitter>> chatEmitters = new ConcurrentHashMap<>();

    private static final Logger logger = LoggerFactory.getLogger(SSEController.class);

    // 사용자가 연결되면 호출되는 메서드입니다.
    @GetMapping(value = "/connect", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public ResponseEntity<SseEmitter> connect(@RequestParam("userId") Integer userId) {
        if (userId == null) {
            return ResponseEntity.badRequest().build();
        }

        SseEmitter emitter = new SseEmitter(Long.MAX_VALUE);
        List<ChatVO> chatList = chatService.selectAllChat(userId);

        // 채팅이 없는 경우, 바로 SseEmitter를 반환합니다.
        if (chatList.isEmpty()) {
            return ResponseEntity.ok(emitter);
        }

        chatList.forEach(chat -> registerEmitterForUser(userId, chat.getCh_num(), emitter));

        // 사용자에게 연결 이벤트를 보냅니다.
        sendConnectEventToUser(userId, emitter);

        return ResponseEntity.ok(emitter);
    }

    // 사용자에게 메시지를 보낼 때 사용하는 Emitter를 등록하는 메서드입니다.
    private void registerEmitterForUser(Integer userId, Integer roomId, SseEmitter emitter) {
        chatEmitters.computeIfAbsent(roomId, k -> new CopyOnWriteArrayList<>())
                    .add(new ChatEmitter(userId, emitter));
    }

    // 사용자에게 연결 이벤트를 보내는 메서드입니다.
    private void sendConnectEventToUser(Integer userId, SseEmitter emitter) {
        ChatEmitter chatEmitter = new ChatEmitter(userId, emitter);
        try {
            chatEmitter.sendConnectEvent(userId);
        } catch (IOException e) {
            logger.error("사용자 {} 에게 초기 연결 이벤트를 보내는 중 오류가 발생했습니다", userId, e);
            throw new RuntimeException("연결 이벤트를 보낼 수 없습니다", e);
        }
    }

    // 특정 방의 모든 Emitter에 알림을 보내는 메서드입니다.
    private void notifyEmitters(Integer roomId, Consumer<ChatEmitter> action) {
        List<ChatEmitter> emitters = chatEmitters.get(roomId);
        if (emitters != null) {
            for (ChatEmitter emitter : emitters) {
                action.accept(emitter);
            }
        }
    }

    // 새 메시지가 있을 때 호출되는 메서드입니다.
    @GetMapping(value = "/newmessage", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public void newMessage(@RequestParam("ch_num") Integer roomId) {
        notifyEmitters(roomId, emitter -> emitter.sendNewMessage(roomId));
    }

    // 메시지를 읽었을 때 호출되는 메서드입니다.
    @GetMapping(value = "/read", produces = MediaType.TEXT_EVENT_STREAM_VALUE)
    public void read(@RequestParam("ch_num") Integer roomId) {
        notifyEmitters(roomId, emitter -> emitter.read(roomId));
    }
}
