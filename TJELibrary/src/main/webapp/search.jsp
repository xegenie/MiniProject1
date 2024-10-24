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
	<title></title>
	<jsp:include page="/layout/meta.jsp" />
	<jsp:include page="/layout/link.jsp" />
	<style>
	._1920-w-light,
._1920-w-light * {
  box-sizing: border-box;
}
._1920-w-light {
  background: #ffffff;
  height: 1608px;
  position: relative;
}
.background {
  background: linear-gradient(
    87.47deg,
    rgba(129, 108, 91, 1) 0%,
    rgba(148, 125, 105, 1) 40.00000059604645%,
    rgba(238, 238, 238, 1) 80.0000011920929%
  );
  height: 85px;
  position: absolute;
  right: 0px;
  left: 0px;
  top: 116px;
}
.heading-2 {
  color: #ffffff;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 27.671875px;
  line-height: 85px;
  font-weight: 700;
  position: absolute;
  left: 375px;
  top: 0px;
  width: 102.12px;
  height: 85px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.list {
  width: 8.75%;
  height: 19.5px;
  position: absolute;
  right: 19.53%;
  left: 71.72%;
  top: 10px;
}
.item-link {
  width: 37.16px;
  height: 14px;
  position: absolute;
  left: 0px;
  top: 2px;
}
.home {
  color: #555555;
  text-align: left;
  font-family: "NotoSansKr-DemiLight", sans-serif;
  font-size: 13px;
  line-height: 19.5px;
  font-weight: 400;
  position: absolute;
  left: 0px;
  top: 0px;
  width: 37.36px;
  height: 14px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.item {
  height: 19.5px;
  position: absolute;
  right: 65.46px;
  left: 37.150001525878906px;
  top: 0px;
}
.div {
  color: #555555;
  text-align: left;
  font-family: "NotoSansKr-DemiLight", sans-serif;
  font-size: 13px;
  line-height: 19.5px;
  font-weight: 400;
  position: absolute;
  left: 5px;
  top: 2px;
  width: 8.33px;
  height: 14px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.link {
  width: 47.33px;
  height: 14px;
  position: absolute;
  left: 18.13px;
  top: 2px;
}
.div2 {
  color: #555555;
  text-align: left;
  font-family: "NotoSansKr-DemiLight", sans-serif;
  font-size: 12.8984375px;
  line-height: 19.5px;
  font-weight: 400;
  position: absolute;
  left: 0px;
  top: 0px;
  width: 47.53px;
  height: 14px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.item2 {
  height: 19.5px;
  position: absolute;
  right: 0px;
  left: 102.61000061035156px;
  top: 0px;
}
.link2 {
  width: 47.33px;
  height: 14px;
  position: absolute;
  left: 18.12px;
  top: 2px;
}
.horizontal-border {
  border-style: solid;
  border-color: #947d69;
  border-width: 0px 0px 1px 0px;
  height: 766px;
  position: absolute;
  right: 378.4px;
  left: 374.6044921875px;
  top: 221.12px;
  overflow: hidden;
}
.horizontal-border2 {
  border-style: solid;
  border-color: #bcbcbc;
  border-width: 0px 0px 1px 0px;
  width: 100%;
  height: 341.22px;
  position: absolute;
  right: 0.35%;
  left: -0.34%;
  top: 88px;
  overflow: hidden;
}
.container {
  height: 51.83px;
  position: absolute;
  right: 23.39px;
  left: 23.389999389648438px;
  top: 0px;
  overflow: hidden;
}
.heading-22 {
  height: 30px;
  position: absolute;
  right: 1022.11px;
  left: 0px;
  top: 16.22px;
}
.div3 {
  color: #323232;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 16.767969131469727px;
  line-height: 25.4px;
  font-weight: 700;
  position: absolute;
  left: 0px;
  top: 3px;
  width: 31.01px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.vertical-divider {
  background: #959595;
  width: 0.99%;
  height: 15px;
  position: absolute;
  right: 2%;
  left: 97.01%;
  top: 5px;
}
.div4 {
  color: #5a5a5a;
  text-align: left;
  font-family: "NotoSansKr-Medium", sans-serif;
  font-size: 13.600000381469727px;
  line-height: 17.61px;
  letter-spacing: 0.25px;
  font-weight: 500;
  position: absolute;
  left: 121.08px;
  top: 20.22px;
  width: 62.93px;
  height: 14px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.input {
  background: #ffffff;
  border-radius: 10px;
  border-style: solid;
  border-color: #a0a0a0;
  border-width: 1px;
  height: 30px;
  position: absolute;
  right: -502.41px;
  left: 951.68994140625px;
  top: 44.22px;
  box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
  transform-origin: 0 0;
  transform: rotate(-180deg) scale(1, 1);
  overflow: hidden;
}
.container2 {
  height: 51.83px;
  position: absolute;
  right: 23.39px;
  left: 23.389999389648438px;
  top: 51.82px;
  overflow: hidden;
}
.input2 {
  background: #ffffff;
  border-radius: 10px;
  border-style: solid;
  border-color: #a0a0a0;
  border-width: 1px;
  height: 30px;
  position: absolute;
  right: 168.5px;
  left: 280.7799987792969px;
  top: 14.22px;
  overflow: hidden;
}
.container3 {
  height: 51.83px;
  position: absolute;
  right: 23.39px;
  left: 23.389999389648438px;
  top: 103.65px;
  overflow: hidden;
}
.div5 {
  color: #323232;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 16.767969131469727px;
  line-height: 25.4px;
  font-weight: 700;
  position: absolute;
  left: 0px;
  top: 3px;
  width: 46.4px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.div6 {
  color: #5a5a5a;
  text-align: left;
  font-family: "NotoSansKr-Medium", sans-serif;
  font-size: 13.600000381469727px;
  line-height: 17.61px;
  letter-spacing: 0.25px;
  font-weight: 500;
  position: absolute;
  left: 121.08px;
  top: 20.22px;
  width: 88.09px;
  height: 14px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.container4 {
  height: 51.83px;
  position: absolute;
  right: 23.39px;
  left: 23.389999389648438px;
  top: 155.48px;
  overflow: hidden;
}
.isbn {
  color: #323232;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 16.239843368530273px;
  line-height: 25.4px;
  font-weight: 700;
  position: absolute;
  left: 0px;
  top: 3px;
  width: 33.84px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
._987654321234 {
  color: #5a5a5a;
  text-align: left;
  font-family: "NotoSansKr-Medium", sans-serif;
  font-size: 13.600000381469727px;
  line-height: 17.61px;
  letter-spacing: 0.25px;
  font-weight: 500;
  position: absolute;
  left: 121.08px;
  top: 20.22px;
  width: 125.73px;
  height: 14px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.container5 {
  height: 51.83px;
  position: absolute;
  right: 23.39px;
  left: 23.389999389648438px;
  top: 207.31px;
  overflow: hidden;
}
.div7 {
  color: #323232;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 16.767969131469727px;
  line-height: 25.4px;
  font-weight: 700;
  position: absolute;
  left: 0px;
  top: 3px;
  width: 61.81px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
._813-12 {
  color: #5a5a5a;
  text-align: left;
  font-family: "NotoSansKr-Medium", sans-serif;
  font-size: 13.600000381469727px;
  line-height: 17.61px;
  letter-spacing: 0.25px;
  font-weight: 500;
  position: absolute;
  left: 121.08px;
  top: 20.22px;
  width: 70.65px;
  height: 14px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.container6 {
  width: 277px;
  height: 40px;
  position: absolute;
  left: calc(50% - 138px);
  top: 677.53px;
  overflow: hidden;
}
.button {
  background: #e2e2e2;
  border-radius: 5px;
  width: 134px;
  height: 40px;
  position: absolute;
  left: 0px;
  top: 0px;
}
.div8 {
  color: #5a5a5a;
  text-align: center;
  font-family: "NotoSansKr-DemiLight", sans-serif;
  font-size: 16.767969131469727px;
  line-height: 25.4px;
  font-weight: 400;
  position: absolute;
  left: calc(50% - 38.5px);
  top: 10.3px;
  width: 77.2px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.button2 {
  background: #707070;
  border-radius: 5px;
  width: 134px;
  height: 40px;
  position: absolute;
  left: 143px;
  top: 0px;
}
.div9 {
  color: #ffffff;
  text-align: center;
  font-family: "NotoSansKr-DemiLight", sans-serif;
  font-size: 16.767969131469727px;
  line-height: 25.4px;
  font-weight: 400;
  position: absolute;
  left: calc(50% - 15.41px);
  top: 10.3px;
  width: 31.01px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.footer {
  background: #947d69;
  height: 259.06px;
  position: absolute;
  right: 2px;
  left: -2px;
  bottom: -0.06px;
}
.group {
  height: 1px;
  position: absolute;
  right: 894.92px;
  left: 894.9199829101562px;
  top: 30px;
}
.div10 {
  color: #ffffff;
  text-align: center;
  font-family: "NanumGothic-Regular", sans-serif;
  font-size: 12px;
  line-height: 19.2px;
  font-weight: 400;
  position: absolute;
  left: calc(50% - 41.09px);
  top: 69.75px;
  width: 82.5px;
  height: 17px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.div11 {
  color: #ffffff;
  text-align: center;
  font-family: "NanumGothic-Regular", sans-serif;
  font-size: 12px;
  line-height: 19.2px;
  font-weight: 400;
  position: absolute;
  left: calc(50% - 139.34px);
  top: 98.53px;
  width: 279.85px;
  height: 36.19px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.e-mail-joeun-gmail-com {
  color: #ffffff;
  text-align: center;
  font-family: "Poppins-Regular", sans-serif;
  font-size: 14px;
  line-height: 22.4px;
  font-weight: 400;
  position: absolute;
  left: calc(50% - 102px);
  top: 151px;
  width: 206px;
  height: 42px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.copyright-aloha-class-all-rights-reserved-alohaclass-kr {
  color: #ffffff;
  text-align: center;
  font-family: "Poppins-Regular", sans-serif;
  font-size: 12px;
  line-height: 19.2px;
  font-weight: 400;
  position: absolute;
  left: calc(50% - 187px);
  top: 220px;
  width: 373px;
  height: 17px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.copyright-aloha-class-all-rights-reserved-alohaclass-kr-span {
  color: #ffffff;
  font-family: "Poppins-Regular", sans-serif;
  font-size: 12px;
  line-height: 19.2px;
  font-weight: 400;
}
.copyright-aloha-class-all-rights-reserved-alohaclass-kr-span2 {
  color: #ffffff;
  font-family: "Poppins-Regular", sans-serif;
  font-size: 12px;
  line-height: 19.2px;
  font-weight: 400;
  text-decoration: underline;
}
.vector {
  width: 1.26%;
  height: 9.12%;
  position: absolute;
  right: 52.75%;
  left: 45.99%;
  bottom: 79.3%;
  top: 11.58%;
  overflow: visible;
}
.vector2 {
  width: 1.24%;
  height: 9.35%;
  position: absolute;
  right: 49.44%;
  left: 49.32%;
  bottom: 79.07%;
  top: 11.58%;
  overflow: visible;
}
.vector3 {
  width: 1.3%;
  height: 8.44%;
  position: absolute;
  right: 46.04%;
  left: 52.66%;
  bottom: 79.2%;
  top: 12.35%;
  overflow: visible;
}
.header {
  height: 116px;
  position: absolute;
  right: 0px;
  left: 0px;
  top: 0px;
}
.horizontal-border3 {
  border-style: solid;
  border-color: #d2d2d2;
  border-width: 0px 0px 1px 0px;
  height: 36px;
  position: absolute;
  right: 0px;
  left: 0px;
  top: 0px;
}
.link3 {
  width: 38.23px;
  height: 35px;
  position: absolute;
  right: 498.24px;
  top: 0px;
}
.div12 {
  color: #666666;
  text-align: right;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 13.890625px;
  line-height: 35px;
  font-weight: 700;
  position: absolute;
  right: -0.2px;
  top: 9px;
  width: 38.43px;
  height: 16px;
  display: flex;
  align-items: center;
  justify-content: flex-end;
}
.link4 {
  width: 38.23px;
  height: 35px;
  position: absolute;
  right: 435px;
  top: 0px;
}
.div13 {
  color: #666666;
  text-align: right;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 13.890625px;
  line-height: 35px;
  font-weight: 700;
  position: absolute;
  right: -6px;
  top: 9px;
  width: 44px;
  height: 16px;
  display: flex;
  align-items: center;
  justify-content: flex-end;
}
.div14 {
  color: #666666;
  text-align: right;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 13.890625px;
  line-height: 35px;
  font-weight: 700;
  position: absolute;
  right: 354px;
  top: 9px;
  width: 56px;
  height: 16px;
  display: flex;
  align-items: center;
  justify-content: flex-end;
}
.container7 {
  width: 1100px;
  height: 80px;
  position: absolute;
  left: calc(50% - 550px);
  top: 36px;
}
.heading-1 {
  height: 39px;
  position: absolute;
  right: 871.03px;
  left: 9.970000267028809px;
  top: 21.19px;
  transform-origin: 0 0;
  transform: rotate(-0.1deg) scale(1, 1);
  filter: blur(0.2px);
}
.background-border {
  background: rgba(148, 125, 105, 0.97);
  border-radius: 40px;
  border-style: solid;
  border-color: #947d69;
  border-width: 2px;
  width: 544px;
  height: 44px;
  position: absolute;
  left: 303px;
  top: 20px;
  box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
}
.input3 {
  background: #947d69;
  border-style: solid;
  border-color: transparent;
  border-width: 0px 1px 0px 1px;
  width: 340px;
  height: 24px;
  position: absolute;
  left: 25px;
  top: 10px;
  overflow: hidden;
}
.container8 {
  height: 16px;
  position: absolute;
  right: 6px;
  left: 11px;
  top: 3.5px;
  overflow: hidden;
}
.div15 {
  color: #ffffff;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 13.890625px;
  font-weight: 700;
  position: absolute;
  left: 0px;
  top: 0px;
  width: 105.62px;
  height: 16px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.button3 {
  width: 22px;
  height: 23px;
  position: absolute;
  left: 499px;
  top: calc(50% - 10.64px);
  object-fit: cover;
}
.link5 {
  background: #947d69;
  border-radius: 20px;
  width: 80px;
  height: 43px;
  position: absolute;
  left: 859px;
  top: 19px;
  box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
}
.div16 {
  color: #ffffff;
  text-align: center;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 15.875px;
  line-height: 24px;
  font-weight: 700;
  position: absolute;
  left: 10.88px;
  top: 12px;
  width: 58.45px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.link-logo-png {
  width: 258px;
  height: 69px;
  position: absolute;
  left: 28px;
  top: 7.45px;
  box-shadow: 0px 4px 4px 0px rgba(0, 0, 0, 0.25);
  transform-origin: 0 0;
  transform: rotate(-0.1deg) scale(1, 1);
  overflow: hidden;
  object-fit: cover;
}
	</style>
</head>
<body>
<jsp:include page="/layout/header.jsp" />
	<div class="_1920-w-light">
  <div class="background">
    <div class="heading-2">고급검색</div>
    <div class="list">
      <div class="item-link">
        <div class="home">HOME</div>
      </div>
      <div class="item">
        <div class="div">&gt;</div>
        <div class="link">
          <div class="div2">자료검색</div>
        </div>
      </div>
      <div class="item2">
        <div class="div">&gt;</div>
        <div class="link2">
          <div class="div2">고급검색</div>
        </div>
      </div>
    </div>
  </div>
  <div class="horizontal-border">
    <div class="horizontal-border2">
      <div class="container">
        <div class="heading-22">
          <div class="div3">제목</div>
          <div class="vertical-divider"></div>
        </div>
        <div class="div4">예 : 책제목</div>
        <div class="input"></div>
      </div>
      <div class="container2">
        <div class="heading-22">
          <div class="div3">저자</div>
          <div class="vertical-divider"></div>
        </div>
        <div class="div4">예 : 김조은</div>
        <div class="input2"></div>
      </div>
      <div class="container3">
        <div class="heading-22">
          <div class="div5">발행처</div>
          <div class="vertical-divider"></div>
        </div>
        <div class="div6">예 : 가나출판사</div>
        <div class="input2"></div>
      </div>
      <div class="container4">
        <div class="heading-22">
          <div class="isbn">isbn</div>
          <div class="vertical-divider"></div>
        </div>
        <div class="_987654321234">예 : 987654321234</div>
        <div class="input2"></div>
      </div>
      <div class="container5">
        <div class="heading-22">
          <div class="div7">분류번호</div>
          <div class="vertical-divider"></div>
        </div>
        <div class="_813-12">예 : 813.12</div>
        <div class="input2"></div>
      </div>
    </div>
    <div class="container6">
      <div class="button">
        <div class="div8">입력초기화</div>
      </div>
      <div class="button2">
        <div class="div9">검색</div>
      </div>
    </div>
  </div>
  <div class="footer">
    <div class="group"></div>
    <div class="div10">코딩 라이프!</div>
    <div class="div11">개발자를 위한 전자도서관 게시판!</div>
    <div class="e-mail-joeun-gmail-com">e-mail : joeun@gmail.com</div>
    <div class="copyright-aloha-class-all-rights-reserved-alohaclass-kr">
      <span>
        <span
          class="copyright-aloha-class-all-rights-reserved-alohaclass-kr-span"
        >
          Copyright ⓒ ALOHA CLASS. All Rights Reserved 
        </span>
        <span
          class="copyright-aloha-class-all-rights-reserved-alohaclass-kr-span2"
        >
          alohaclass.kr
        </span>
      </span>
    </div>
    <img class="vector" src="vector0.svg" />
    <img class="vector2" src="vector1.svg" />
    <img class="vector3" src="vector2.svg" />
  </div>
  <div class="header">
    <div class="horizontal-border3">
      <div class="link3">
        <div class="div12">로그인</div>
      </div>
      <div class="link4">
        <div class="div13">내서재</div>
      </div>
      <div class="div14">회원가입</div>
    </div>
    <div class="container7">
      <div class="heading-1"></div>
      <div class="background-border">
        <div class="input3">
          <div class="container8">
            <div class="div15">도서검색</div>
          </div>
        </div>
        <img class="button3" src="button2.png" />
      </div>
      <div class="link5">
        <div class="div16">고급검색</div>
      </div>
      <img class="link-logo.png" src="link-logo.png" />
    </div>
  </div>
</div>
	<jsp:include page="/layout/footer.jsp" />
	<jsp:include page="/layout/script.jsp" />
</body>
</html>