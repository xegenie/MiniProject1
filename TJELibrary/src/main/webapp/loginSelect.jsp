<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<style>
	.div,
.div * {
  box-sizing: border-box;
}
.div {
  background: #ffffff;
  height: 1213px;
  position: relative;
  overflow: hidden;
}
.frame-32 {
  width: 1869px;
  height: 1213px;
  position: absolute;
  left: 0px;
  top: 0px;
  overflow: hidden;
}
.frame-45 {
  background: #eeeeee;
  width: 1388px;
  height: 824px;
  position: absolute;
  left: 240px;
  top: 195px;
  overflow: hidden;
}
.frame-30 {
  width: 901px;
  height: 216px;
  position: absolute;
  left: 244px;
  top: 27px;
  overflow: hidden;
  align-items: center;
}
.link-logo.png {
  width: 118.96px;
  height: 84.89px;
  position: absolute;
  left: 190px;
  top: 131.56px;
/*   box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25); */
  transform-origin: 0 0;
  transform: rotate(-0.1deg) scale(1, 1);
  overflow: hidden;
  justify-content: end;
/*   object-fit: cover; */
}
.frame-29 {
  width: 1380px;
  height: 559px;
  position: absolute;
  left: 78px;
  top: 265px;
  overflow: hidden;
}
.rectangle-4 {
  border-radius: 0px;
  width: 352px;
  height: 398px;
  position: absolute;
  left: 760px;
  top: 94px;
  overflow: visible;
}
.frame-44 {
  background: #947d69;
  border-radius: 20px;
  width: 349px;
  height: 398px;
  position: absolute;
  left: 101px;
  top: 94px;
  overflow: hidden;
}
.frame-25 {
  width: 451px;
  height: 147px;
  position: absolute;
  left: -51px;
  top: 223px;
  overflow: hidden;
}
.div2 {
  color: #ffffff;
  text-align: center;
  font-family: "PalanquinDark-Bold", sans-serif;
  font-size: 40px;
  line-height: 18px;
  font-weight: 700;
  position: absolute;
  left: 79px;
  top: 40px;
  width: 296px;
  height: 74px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.frame-27 {
  width: 248px;
  height: 188px;
  position: absolute;
  left: 50px;
  top: 35px;
  overflow: visible;
}
.frame-33 {
  background: #EFB887;
  border-radius: 20px;
  width: 361px;
  height: 402px;
  position: absolute;
  left: 760px;
  top: 92px;
  overflow: hidden;
}
.frame-26 {
  width: 451px;
  height: 147px;
  position: absolute;
  left: -45px;
  top: 255px;
  overflow: hidden;
}
.div3 {
  color: #ffffff;
  text-align: center;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 40px;
  line-height: 18px;
  font-weight: 700;
  position: absolute;
  left: 79px;
  top: 10px;
  width: 296px;
  height: 74px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.frame-28 {
  width: 248px;
  height: 188px;
  position: absolute;
  left: 56px;
  top: 35px;
  overflow: visible;
}
	
	</style>
</head>
<body>
	<div class="div">
  <div class="frame-32">
    <div class="frame-45">
      <div class="frame-30" >
        <img class="link-logo.png" src="static/img/link-logo.png">
      </div>
      <div class="frame-29">
        <img class="rectangle-4" src="rectangle-40.svg" />
      <button type="submit" class="frame-44">
          <div class="frame-25">
            <div class="div2">관리자 로그인</div>
          </div>
          <img class="frame-27" src="frame-270.svg" />
        </button>
        <button class="frame-33">
          <div class="frame-26">
            <div class="div3">사용자 로그인</div>
          </div>
          <img class="frame-28" src="frame-280.svg" />
        </button>
      </div>
    </div>
  </div>
</div>
	
</body>
</html>