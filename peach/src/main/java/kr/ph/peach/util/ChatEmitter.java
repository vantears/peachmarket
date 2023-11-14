package kr.ph.peach.util;

import java.io.IOException;
import java.util.concurrent.ConcurrentHashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.mvc.method.annotation.SseEmitter;

import kr.ph.peach.controller.SSEController;

public class ChatEmitter {
    private final ConcurrentHashMap<Integer, SseEmitter> emitters = new ConcurrentHashMap<>();
    private final ConcurrentHashMap<Integer, Boolean> isEmitterComplete = new ConcurrentHashMap<>();
    private static final Logger logger = LoggerFactory.getLogger(SSEController.class);

    // 주 생성자에서 main sseEmitter 제거
    public ChatEmitter(Integer userId, SseEmitter emitter) {
        // 각 사용자의 emitter 초기화
        add(userId, emitter);
    }

    // 추가된 각 emitter를 구성하기 위해 add 메소드 업데이트
    public boolean add(Integer userId, SseEmitter emitter) {
        SseEmitter existingEmitter = emitters.putIfAbsent(userId, emitter);
        if (existingEmitter == null) {
            configureSseEmitter(userId); // 새 emitter 구성
            isEmitterComplete.put(userId, false); // 완료되지 않음으로 표시
            return true;
        }
        return false;
    }

    // 특정 사용자의 emitter에 연결 확인 이벤트 보내기
    public void sendConnectEvent(Integer userId) throws IOException {
        sendMessageToUser(userId, "connect", "Connected to user " + userId);
    }

    // 라이프사이클 이벤트를 위한 emitter 구성
    private void configureSseEmitter(Integer userId) {
        SseEmitter userEmitter = emitters.get(userId);
        if (userEmitter != null) {
            userEmitter.onCompletion(() -> complete(userId));
            userEmitter.onTimeout(() -> complete(userId));
            userEmitter.onError(e -> completeWithError(userId, e));
        }
    }

    // 특정 사용자의 emitter 완료
    private void complete(Integer userId) {
        SseEmitter userEmitter = emitters.remove(userId);
        if (userEmitter != null) {
            userEmitter.complete();
            isEmitterComplete.put(userId, true); // emitter를 완료로 표시
            logger.info("Emitter for user {} has been completed.", userId);
        }
    }

    // 특정 사용자에 대한 에러로 emitter 완료
    private void completeWithError(Integer userId, Throwable throwable) {
        logger.error("Emitter for user {} encountered an error: {}", userId, throwable.getMessage());
        complete(userId); // 에러 후 emitter 완료
    }

    // 주어진 사용자 ID에 대한 emitter 검색
    public SseEmitter get(Integer userId) {
        return emitters.get(userId);
    }
    
    // 모든 emitter 검색
    public ConcurrentHashMap<Integer, SseEmitter> getEmitters() {
        return emitters;
    }

    // 주어진 사용자 ID에 대한 emitter 제거 및 완료
    public void remove(Integer userId) {
        SseEmitter emitter = emitters.get(userId);
        if (emitter != null) {
            emitter.complete();
            emitters.remove(userId);
        }
    }

    // 새 메시지를 방에 있는 모든 사용자에게 전송
    public void sendNewMessage(Integer roomId) {
        emitters.forEach((userId, userEmitter) -> {
            if (!isEmitterComplete.getOrDefault(userId, false)) {
                sendMessageToUser(userId, "newMessage", roomId);
            }
        });
    }
    
    // 방에서 읽은 메시지를 모든 사용자에게 전송
    public void read(Integer roomId) {
        emitters.forEach((userId, userEmitter) -> {
            if (!isEmitterComplete.getOrDefault(userId, false)) {
                sendMessageToUser(userId, "read", roomId);
            }
        });
    }

    // 사용자에게 메시지 전송을 위한 중복 코드 리팩토링
    private void sendMessageToUser(Integer userId, String eventName, Object data) {
        SseEmitter emitter = emitters.get(userId);
        if (emitter != null && !isEmitterComplete.getOrDefault(userId, false)) {
            try {
                emitter.send(SseEmitter.event().name(eventName).data(data));
            } catch (IOException | IllegalStateException e) {
            	logger.error("Error sending event to user {}: {}", userId, e.getMessage());
                complete(userId);
            }
        }
    }
}
