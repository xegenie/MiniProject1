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
	<style>
	.section,
.section * {
  box-sizing: border-box;
}
.section {
  height: 1144px;
  position: relative;
  overflow: auto;
}
.form {
  height: 256px;
  position: absolute;
  right: 732px;
  left: 732px;
  top: 360px;
}
.label {
  height: 68px;
  position: absolute;
  right: 0px;
  left: 0px;
  top: 0px;
}
.container {
  width: 32.38px;
  height: 20px;
  position: absolute;
  left: 0px;
  top: calc(50% - 34px);
  overflow: hidden;
}
.label2 {
  height: 68px;
  position: absolute;
  right: 0px;
  left: 0px;
  top: 76px;
}
.container2 {
  width: 59.19px;
  height: 20px;
  position: absolute;
  left: 0px;
  top: calc(50% - 34px);
  overflow: hidden;
}
.section2 {
  position: absolute;
  right: -732px;
  left: -732px;
  bottom: -528px;
  top: -360px;
  overflow: auto;
}
.heading-1-sign-in {
  color: #232427;
  text-align: center;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 26.6875px;
  line-height: 36px;
  font-weight: 700;
  position: absolute;
  left: calc(50% - 78px);
  top: 176px;
  width: 149px;
  height: 36px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.form2 {
  height: 256px;
  position: absolute;
  right: 742px;
  left: 722px;
  top: 324px;
}
.div {
  color: #232427;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 11.578125px;
  line-height: 20px;
  letter-spacing: 0.01px;
  font-weight: 700;
  position: absolute;
  left: 2px;
  top: 2px;
  width: 32.58px;
  height: 15px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.naver-com {
  color: #232427;
  text-align: center;
  font-family: "NotoSansKr-DemiLight", sans-serif;
  font-size: 16px;
  line-height: 20px;
  letter-spacing: 0.04px;
  font-weight: 400;
  position: absolute;
  left: calc(50% - -138px);
  top: 34px;
  width: 90px;
  height: 28px;
  display: flex;
  align-items: end;
  justify-content: end;
}
.vector {
  width: 13.47px;
  height: 7.23px;
  position: absolute;
  left: 347px;
  top: 55.23px;
  transform: translate(0px, -7.23px);
  overflow: visible;
}
.background-border-shadow {
  background: #ffffff;
  border-radius: 12px;
  height: 40px;
  position: absolute;
  right: 123px;
  left: 0px;
  top: calc(50% - 6px);
  box-shadow: 0px 0px 0px 2px rgba(188, 196, 216, 1);
  overflow: hidden;
}
.input {
  width: 420px;
  height: 24px;
  position: absolute;
  left: calc(50% - 209.5px);
  top: calc(50% - 12px);
  overflow: hidden;
}
.container3 {
  height: 18px;
  position: absolute;
  right: 0px;
  left: 0px;
  top: 3px;
  overflow: hidden;
}
.anna-gmail-com {
  color: #c0c4cf;
  text-align: left;
  font-family: "NotoSansKr-DemiLight", sans-serif;
  font-size: 14.296875px;
  letter-spacing: 0.02px;
  font-weight: 400;
  text-decoration: underline;
  position: absolute;
  left: 68px;
  top: 0px;
  width: 134.2px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.rectangle {
  border-radius: 12px;
  position: absolute;
  right: 0px;
  left: 0px;
  bottom: 0px;
  top: 0px;
}
.background {
  background: #ffffff;
  border-radius: 12px;
  height: 40px;
  position: absolute;
  right: 0px;
  left: 0px;
  top: calc(50% - 6px);
  overflow: hidden;
}
.input2 {
  width: 394px;
  height: 24px;
  position: absolute;
  left: calc(50% - 210px);
  top: calc(50% - 12px);
  overflow: hidden;
}
.div2 {
  color: #c0c4cf;
  text-align: left;
  font-family: "NotoSansKr-DemiLight", sans-serif;
  font-size: 15px;
  letter-spacing: 0.02px;
  font-weight: 400;
  position: absolute;
  left: 0px;
  top: 0px;
  width: 76.9px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.svg {
  width: 18px;
  height: 18px;
  position: absolute;
  left: 420px;
  top: 11px;
  overflow: visible;
}
.border {
  border-radius: 12px;
  border-style: solid;
  border-color: #c0c4cf;
  border-width: 1px;
  position: absolute;
  right: 0px;
  left: 0px;
  bottom: 0px;
  top: 0px;
}
.div3 {
  color: #232427;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 12.4921875px;
  line-height: 20px;
  letter-spacing: 0.01px;
  font-weight: 700;
  position: absolute;
  left: 0px;
  top: 5px;
  width: 59.39px;
  height: 15px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.background-border-shadow2 {
  background: #ffffff;
  border-radius: 12px;
  height: 40px;
  position: absolute;
  right: 0px;
  left: 0px;
  top: calc(50% - -47px);
  box-shadow: 0px 0px 0px 2px rgba(188, 196, 216, 1);
  overflow: hidden;
}
.input3 {
  width: 420px;
  height: 24px;
  position: absolute;
  left: calc(50% - 210px);
  top: calc(50% - 12px);
  overflow: hidden;
}
.div4 {
  color: #232427;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 12.4921875px;
  line-height: 20px;
  letter-spacing: 0.01px;
  font-weight: 700;
  position: absolute;
  left: 0px;
  top: 152px;
  width: 77px;
  height: 15px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.div5 {
  color: #232427;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 12.4921875px;
  line-height: 20px;
  letter-spacing: 0.01px;
  font-weight: 700;
  position: absolute;
  left: 0px;
  top: 223px;
  width: 59.39px;
  height: 15px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.background-border-shadow3 {
  background: #ffffff;
  border-radius: 12px;
  border-style: solid;
  border-color: #947d69;
  border-width: 2px;
  height: 40px;
  position: absolute;
  right: 0px;
  left: 0px;
  top: calc(50% - 184px);
  box-shadow: 0px 0px 0px 2px rgba(188, 196, 216, 1);
  overflow: hidden;
}
.kimjoeun {
  color: #c0c4cf;
  text-align: left;
  font-family: "NotoSansKr-DemiLight", sans-serif;
  font-size: 14.296875px;
  letter-spacing: 0.02px;
  font-weight: 400;
  position: absolute;
  left: 0px;
  top: 0px;
  width: 134.2px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.div6 {
  color: #232427;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 11.578125px;
  line-height: 20px;
  letter-spacing: 0.01px;
  font-weight: 700;
  position: absolute;
  left: 0px;
  top: -87px;
  width: 32.58px;
  height: 15px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.background2 {
  background: #ffffff;
  border-radius: 12px;
  height: 40px;
  position: absolute;
  right: 0px;
  left: 0px;
  top: calc(50% - -204px);
  overflow: hidden;
}
.svg2 {
  width: 18px;
  height: 18px;
  position: absolute;
  left: 420px;
  top: 11px;
}
._010 {
  color: #c0c4cf;
  text-align: left;
  font-family: "NotoSansKr-DemiLight", sans-serif;
  font-size: 14.296875px;
  letter-spacing: 0.02px;
  font-weight: 400;
  position: absolute;
  left: 16px;
  top: 8px;
  width: 134.2px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.div7 {
  color: #232427;
  text-align: left;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 12.4921875px;
  line-height: 20px;
  letter-spacing: 0.01px;
  font-weight: 700;
  position: absolute;
  left: 0px;
  top: 301px;
  width: 59.39px;
  height: 15px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.background-border-shadow4 {
  background: #ffffff;
  border-radius: 12px;
  height: 40px;
  position: absolute;
  right: 0px;
  left: 0px;
  top: calc(50% - -117px);
  box-shadow: 0px 0px 0px 2px rgba(188, 196, 216, 1);
  overflow: hidden;
}
.div8 {
  color: #c0c4cf;
  text-align: left;
  font-family: "NotoSansKr-DemiLight", sans-serif;
  font-size: 14.296875px;
  letter-spacing: 0.02px;
  font-weight: 400;
  position: absolute;
  left: 0px;
  top: 0px;
  width: 134.2px;
  height: 18px;
  display: flex;
  align-items: center;
  justify-content: flex-start;
}
.button {
  background: #d3bca8;
  border-radius: 12px;
  width: 456px;
  height: 40px;
  position: absolute;
  left: 722px;
  top: 788px;
}
.div9 {
  color: #ffffff;
  text-align: center;
  font-family: "NotoSansKr-Bold", sans-serif;
  font-size: 13.125px;
  line-height: 20px;
  font-weight: 700;
  position: absolute;
  left: calc(50% - 57.55px);
  top: 12px;
  width: 115.29px;
  height: 16px;
  display: flex;
  align-items: center;
  justify-content: center;
}
.button2 {
  background: #947d69;
  border-radius: 12px;
  width: 456px;
  height: 40px;
  position: absolute;
  left: 722px;
  top: 723px;
}
	
	</style>
</head>
<body>
	<div class="section">
  <div class="form">
    <div class="label">
      <div class="container"></div>
    </div>
    <div class="label2">
      <div class="container2"></div>
    </div>
    <div class="section2">
      <div class="heading-1-sign-in">
        Sign up
        <br />
      </div>
      <div class="form2">
        <div class="label">
          <div class="container"></div>
          <div class="div">이메일</div>
          <div class="naver-com">naver.com</div>
          <img class="vector" src="vector0.svg" />
          <div class="background-border-shadow">
            <div class="input">
              <div class="container3">
                <div class="anna-gmail-com">anna@gmail.com</div>
              </div>
            </div>
            <div class="rectangle"></div>
          </div>
        </div>
        <div class="label2">
          <div class="container2"></div>
          <div class="background">
            <div class="input2">
              <div class="container3">
                <div class="div2">••••••••••</div>
              </div>
            </div>
            <img class="svg" src="svg0.svg" />
            <div class="border"></div>
          </div>
          <div class="div3">비밀번호</div>
        </div>
        <div class="background-border-shadow2">
          <div class="input3">
            <div class="container3"></div>
          </div>
          <div class="rectangle"></div>
        </div>
        <div class="div4">비밀번호 확인</div>
        <div class="div5">이름</div>
        <div class="background-border-shadow3">
          <div class="input3">
            <div class="container3">
              <div class="kimjoeun">kimjoeun</div>
            </div>
          </div>
          <div class="rectangle"></div>
        </div>
        <div class="div6">아이디</div>
        <div class="background2">
          <div class="svg2"></div>
          <div class="border"></div>
          <div class="_010">010-****-****</div>
        </div>
        <div class="div7">휴대전화</div>
        <div class="background-border-shadow4">
          <div class="input3">
            <div class="container3">
              <div class="div8">이름</div>
            </div>
          </div>
          <div class="rectangle"></div>
        </div>
      </div>
      <div class="button">
        <div class="div9">뒤로가기</div>
      </div>
      <div class="button2">
        <div class="div9">가입하기</div>
      </div>
    </div>
  </div>
</div>
	
</body>
</html>