<%@ page import="tje.DAO.UserAuthDAO" %>
<%@ page import="tje.DTO.UserAuth" %>
<%@ page import="tje.DTO.User" %>
<%@ page import="tje.Service.UserServiceImpl" %>
<%@ page import="tje.Service.UserService" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<%
    String id = request.getParameter("id");
    String password = request.getParameter("password");

    UserService userService = new UserServiceImpl();
    User user = userService.select(id); // ID로 사용자 조회

    if (user == null) {
        out.println("<script>alert('존재하지 않는 사용자입니다.'); history.back();</script>");
        return;
    }

    UserAuthDAO userAuthDAO = new UserAuthDAO();
    UserAuth userAuth = userAuthDAO.select(user.getId()); // userId로 userAuth 조회

    if (userAuth == null) {
        out.println("<script>alert('사용자 권한 정보를 찾을 수 없습니다.'); history.back();</script>");
        return;
    }

    String userROLE = userAuth.getAuth(); // 유저 권한

    // 비밀번호 확인
    if (user.getPassword().equals(password)) {
        if (userROLE.equals("ROLE_ADMIN")) {
            session.setAttribute("user", user); // 세션에 사용자 정보 저장
            response.sendRedirect("admin/user/admin_user.jsp"); // 관리자 페이지로 이동
        } else {
            // 일반 회원일 경우 경고창 출력 후 로그인 페이지로 리다이렉트
            out.println("<script>");
            out.println("alert('사용자 회원으로 다시 로그인해주세요.');");
            out.println("location.href='login.jsp';");
            out.println("</script>");
        }
    } else {
        // 비밀번호가 틀린 경우 경고창 출력 후 이전 페이지로 이동
        out.println("<script>alert('로그인 실패. 아이디와 비밀번호를 확인하세요.'); history.back();</script>");
    }
%>
