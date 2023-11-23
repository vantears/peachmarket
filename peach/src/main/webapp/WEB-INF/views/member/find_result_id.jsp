<%@ page language="java" contentType="text/html; charset=UTF-8"   pageEncoding="UTF-8"%>                                    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>                                                            
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<meta charset="utf-8">                                                                                                  
	<meta http-equiv="X-UA-Compatible" content="IE=edge">                                                                   
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">                                  
	<meta name="description" content="">                                                                                    
	<meta name="author" content="">                                                                                         
	                                                                                            
	<title>SB Admin 2 - Register</title>
	<!-- Bootstrap core JavaScript-->                                                                                       
	<script src="vendor/jquery/jquery.min.js"></script>                                                                     
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>                                                     
	<!-- Core plugin JavaScript-->                                                                                          
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>                                                       
	<!-- Custom scripts for all pages-->                                                                                    
	<script src="js/sb-admin-2.min.js"></script>

</head>

<body class="bg-gradient-primary">                                                                                          
<div class="container">                                                                                                 
<!-- Outer Row -->                                                                                                  
<div class="row justify-content-center">                                                                            
                                                                                            
	<div class="col-xl-10 col-lg-12 col-md-9">                                                                      
	                                                                                            
	<div class="card o-hidden border-0 shadow-lg my-5">                                                         
	<div class="card-body p-0">                                                                             
	<!-- Nested Row within Card Body -->                                                                
	<div class="row">                                                                                   
	<div class="col-lg-6 d-none d-lg-block bg-password-image"><img style="width: 100%; margin-top: 100px" src="<c:url value='/img/피치.png'/>"></div>                                  
	<div class="col-lg-6">                                                                          
				<div class="p-5">                                                                           
							    <div class="text-center">                                                               
							        <h1 class="h4 text-gray-900 mb-2">해당 회원님의 아이디입니다.</h1><br><br>                 
							        <c:choose>                                                                          
							            <c:when test="${empty member}">                                                 
							                <p class="mb-4">조회결과가 없습니다.</p>
							                <p class="mb-4">이름 혹은 핸드폰 번호가 틀렸습니다.</p>                                        
							            </c:when>                                                                         
							            <c:otherwise>                                                                     
							                <p class="mb-4">${member.me_id}</p>                                              
							            </c:otherwise>                                                                    
							        </c:choose>                                                                         
							    </div>                                                                                  
							    <hr>                                                                                    
							    <div class="text-center">                                                               
							        <a class="small" href="<c:url value='/member/pw_find'/>">비밀번호 찾기</a>                      
							    </div>                                                                                  
							    <div class="text-center">                                                               
							        <a class="small" href="<c:url value='/member/signup'/>">회원 가입</a>                    
							    </div>                                                                                  
							    <div class="text-center">                                                               
							        <a class="small" href="<c:url value='/member/login'/>">로그인</a>          
							    </div>                                                                                  
							</div>                                                                                      
						</div>                                                                                          
					</div>                                                                                              
				</div>                                                                                                  
			 </div>                                                                                                      
				                                                                                            
		</div>                                                                                                          
				                                                                                            
	</div>                                                                                                              
			                                                                                            
</div>         

</body>
</html>