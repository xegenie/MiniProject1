<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/layout/common.jsp" %>
<style>
  .footer,
  .footer * {
    box-sizing: border-box;
  }

  .footer {
    background: #947d69;
    height: 259px;
    position: fixed; /* 화면 하단에 고정 */
    left: 0;
    bottom: 0;
    width: 100%; /* 전체 화면 너비 */
  }

  .group {
    height: 1px;
    position: absolute;
    right: 894.92px;
    left: 894.9199829101562px;
    top: 30px;
  }

  .link {
    height: 28.56px;
    position: absolute;
    right: 88px;
    left: 0px;
    top: 0px;
  }

  .icon {
    width: 18.16px;
    height: 20px;
    position: absolute;
    left: 12px;
    top: 24px;
    transform-origin: 0 0;
    transform: rotate(0deg) scale(1, -1);
    overflow: hidden;
  }

  .link2 {
    height: 28.56px;
    position: absolute;
    right: 0px;
    left: 85.16000366210938px;
    top: 0px;
  }

  .icon2 {
    width: 21px;
    height: 20px;
    position: absolute;
    left: 12px;
    top: 22px;
    transform-origin: 0 0;
    transform: rotate(0deg) scale(1, -1);
    overflow: hidden;
  }

  .div {
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

  .div2 {
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
    left: calc(50% - 114px);
    top: 156px;
    width: 228px;
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
    left: calc(50% - 204px);
    top: 219.94px;
    width: 406px;
    height: 17px;
    display: flex;
    align-items: center;
    justify-content: center;
  }

  .footer_icon1 {
    width: 2%;
    height: 9.12%;
    position: absolute;
    right: 52.82%;
    left: 45.92%;
    bottom: 77.76%;
    top: 13.13%;
    overflow: visible;
  }

  .footer_icon2 {
    width: 2%;
    height: 9.35%;
    position: absolute;
    right: 49.49%;
    left: 49.27%;
    bottom: 77.52%;
    top: 13.13%;
    overflow: visible;
  }

  .footer_icon3 {
    width: 2%;
    height: 8.45%;
    position: absolute;
    right: 46.07%;
    left: 52.62%;
    bottom: 77.65%;
    top: 13.9%;
    overflow: visible;
  }
</style>

<footer>
  <div class="footer">
    <div class="group">
      <div class="link">
        <div class="icon"></div>
      </div>
      <div class="link2">
        <div class="icon2"></div>
      </div>
    </div>
    <div class="div">코딩 라이프!</div>
    <div class="div2">개발자를 위한 전자도서관 게시판!</div>
    <div class="e-mail-joeun-gmail-com">e-mail : joeun@gmail.com</div>
    <div class="copyright-aloha-class-all-rights-reserved-alohaclass-kr">
      <span>
        <span class="copyright-aloha-class-all-rights-reserved-alohaclass-kr-span">
          Copyright ⓒ ALOHA CLASS. All Rights Reserved
        </span>
        <span class="copyright-aloha-class-all-rights-reserved-alohaclass-kr-span2">
          alohaclass.kr
        </span>
      </span>
    </div>
    <img class="footer_icon1" src="<%= root %>/static/img/footer_icon1.png">
    <img class="footer_icon2" src="<%= root %>/static/img/footer_icon2.png">
    <img class="footer_icon3" src="<%= root %>/static/img/footer_icon3.png">
  </div>
</footer>
