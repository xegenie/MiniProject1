<%@page import="tje.DAO.UserAuthDAO"%>
<%@page import="tje.DTO.UserAuth"%>
<%@page import="java.util.UUID"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@page import="tje.DTO.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");
    String email = request.getParameter("email");
    String name = request.getParameter("name");
    String telNumber = request.getParameter("tel_Number");

    // 값 확인
    if (password == null || password.isEmpty()) {
        out.println("<script>alert('비밀번호를 입력하세요.'); history.back();</script>");
    } else {
        User user = new User();
        user.setId(id);
        user.setPassword(password);
        user.setEmail(email);
        user.setName(name);
        user.setTelNumber(telNumber);
        
        UserService userService = new UserServiceImpl();
        int result = userService.signUp(user); // 회원가입
        
        if (result > 0) {
        // 회원 권한 추가
        UserAuthDAO userAuthDAO = new UserAuthDAO();
        
        UserAuth userAuth = new UserAuth();
        userAuth.setUsername(user.getId());
        userAuth.setAuth("ROLE_USER");
        userAuthDAO.insert(userAuth);
        }
        
        if (result > 0) {
            session.setAttribute("user", user);
            out.println("<script>alert('회원가입 성공. 로그인 해주세요.'); location.href='login.jsp';</script>");
        } else {
            out.println("<script>alert('회원가입 실패. 다시 시도하세요.'); history.back();</script>");
        }
    }
%>