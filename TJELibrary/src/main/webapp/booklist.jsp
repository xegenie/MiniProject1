<%@page import="tje.DTO.User"%>
<%@page import="tje.Service.UserServiceImpl"%>
<%@page import="tje.Service.UserService"%>
<%@ include file="/layout/jstl.jsp" %>
<%@ include file="/layout/common.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<link rel="stylesheet" href="static/css/booklist.css">

<%
// chapter 
String chapterTitle = "통합검색";
String chapter1 = "HOME";
String chapter2 = "자료검색";
String chapter3 = "통합검색";

%>
<!DOCTYPE html>
<html>

<head>
  <title>project💻 - ALOHA CLASS🌴</title>
  <jsp:include page="/layout/meta.jsp" />
  <jsp:include page="/layout/link.jsp" />
</head>

<body>
  <jsp:include page="/layout/header.jsp" />

  <%-- [Contents] ######################################################### --%>
  <div class="pb-4 pt-5">
    <%@ include file="/layout/chapter.jsp" %>
  </div>
  <div class="container">
    <div class="book">
      <div class="head d-flex justify-content-start">
        <div class="no">NO. 1</div>
        <div class="단행본">단행본</div>
      </div>
      <div class="Description d-flex border-bottom">
        <img class="book1" src="static/img/book1.png" />
        <div class="content">
          <div class="head">
            <h2>필독! 개발자 온보딩 가이드</h2>
          </div>
          <div class="middle">
            크리스 리코미니 지음 ; 붉은 여우 옮김 | 지식의숲 | 2012
          </div>
          <div class="bottom d-flex justify-content-start">
            <span class="popular">인기도서</span> <span> | 도서정보</span>
          </div>
        <div class="div18">
          <div class="div19">찜하기</div>
        </div>
        </div>
      </div>
      <div class="book">
        <div class="div9">
          <div class="no">NO. 2</div>
          <img class="frame-12" src="frame-121.png" />
        </div>
        <div class="div10">
          <div class="div11">
            <div class="border">
              <div class="div12">단행본</div>
            </div>
          </div>
          <div class="div13">
            <div class="heading-1">세상에서 가장 쉬운 코딩책</div>
          </div>
          <div class="div14">
            <div class="list2">
              <div class="_2012">
                <span>
                  <span class="_2012-span6">
                    위캔코딩 지음 ; 붉은 여우 옮김
                  </span>
                  <span class="_2012-span7">|</span>
                  <span class="_2012-span8">지식의숲</span>
                  <span class="_2012-span9">|</span>
                  <span class="_2012-span10">2012</span>
                </span>
              </div>
            </div>
          </div>
          <div class="div15">
            <div class="div16">
              <div class="list3">
                <div class="item3">
                  <div class="div17">
                    <ul class="div-17-span2">
                      <li>소장정보</li>
                    </ul>
                  </div>
                  <div class="vertical-divider"></div>
                </div>
                <div class="item4">
                  <ul class="item-4-span2">
                    <li>도서정보</li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="div18">
              <div class="item5">
                <div class="link3" style="
                    background: url(link3.png) center;
                    background-size: cover;
                    background-repeat: no-repeat;
                  ">
                  <div class="div19">찜하기</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="book">
        <div class="div9">
          <div class="no">NO. 3</div>
          <img class="frame-12" src="frame-122.png" />
        </div>
        <div class="div10">
          <div class="div11">
            <div class="border">
              <div class="div12">단행본</div>
            </div>
          </div>
          <div class="div13">
            <div class="heading-1">어떤 개발자가 되고 싶니?</div>
          </div>
          <div class="div14">
            <div class="list2">
              <div class="_2012">
                <span>
                  <span class="_2012-span11">
                    박동기 글 ; 송진욱 그림 ; 안미연 옮김
                  </span>
                  <span class="_2012-span12">|</span>
                  <span class="_2012-span13">좋은책어린이</span>
                  <span class="_2012-span14">|</span>
                  <span class="_2012-span15">2010</span>
                </span>
              </div>
            </div>
          </div>
          <div class="div15">
            <div class="div16">
              <div class="list3">
                <div class="item3">
                  <div class="div17">
                    <ul class="div-17-span3">
                      <li>소장정보</li>
                    </ul>
                  </div>
                  <div class="vertical-divider"></div>
                </div>
                <div class="item4">
                  <ul class="item-4-span3">
                    <li>도서정보</li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="div18">
              <div class="item5">
                <div class="link3" style="
                    background: url(link4.png) center;
                    background-size: cover;
                    background-repeat: no-repeat;
                  ">
                  <div class="div19">찜하기</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="book">
        <div class="div9">
          <div class="no">NO. 4</div>
          <img class="frame-12" src="frame-123.png" />
        </div>
        <div class="div10">
          <div class="div11">
            <div class="border">
              <div class="div12">단행본</div>
            </div>
          </div>
          <div class="div13">
            <div class="heading-1">GPT 제너레이션</div>
          </div>
          <div class="div14">
            <div class="list2">
              <div class="_2012">
                <span>
                  <span class="_2012-span16">
                    이시한 지음 ; 김난령 옮김 ; 최승혜 그림
                  </span>
                  <span class="_2012-span17">|</span>
                  <span class="_2012-span18">좋은책어린이</span>
                  <span class="_2012-span19">|</span>
                  <span class="_2012-span20">2007</span>
                </span>
              </div>
            </div>
          </div>
          <div class="div15">
            <div class="div16">
              <div class="list3">
                <div class="item3">
                  <div class="div17">
                    <ul class="div-17-span4">
                      <li>소장정보</li>
                    </ul>
                  </div>
                  <div class="vertical-divider"></div>
                </div>
                <div class="item4">
                  <ul class="item-4-span4">
                    <li>도서정보</li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="div18">
              <div class="item5">
                <div class="link3" style="
                    background: url(link5.png) center;
                    background-size: cover;
                    background-repeat: no-repeat;
                  ">
                  <div class="div19">찜하기</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="book">
        <div class="div9">
          <div class="no">NO. 5</div>
          <img class="frame-12" src="frame-124.png" />
        </div>
        <div class="div10">
          <div class="div11">
            <div class="border">
              <div class="div12">단행본</div>
            </div>
          </div>
          <div class="div13">
            <div class="heading-1">챗 GPT</div>
          </div>
          <div class="div14">
            <div class="list2">
              <div class="_2012">
                <span>
                  <span class="_2012-span21">반병현 지음</span>
                  <span class="_2012-span22">|</span>
                  <span class="_2012-span23">행복우물</span>
                  <span class="_2012-span24">|</span>
                  <span class="_2012-span25">2012</span>
                </span>
              </div>
            </div>
          </div>
          <div class="div15">
            <div class="div16">
              <div class="list3">
                <div class="item3">
                  <div class="div17">
                    <ul class="div-17-span5">
                      <li>소장정보</li>
                    </ul>
                  </div>
                  <div class="vertical-divider"></div>
                </div>
                <div class="item4">
                  <ul class="item-4-span5">
                    <li>도서정보</li>
                  </ul>
                </div>
              </div>
            </div>
            <div class="div18">
              <div class="item5">
                <div class="link3" style="
                    background: url(link6.png) center;
                    background-size: cover;
                    background-repeat: no-repeat;
                  ">
                  <div class="div19">찜하기</div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
      <div class="pageNo d-flex jutify-content-center column-gap-3">
        <div class="_1">1</div>
        <div class="_2">2</div>
        <div class="_3">3</div>
        <div class="_4">4</div>
        <div class="_5">5</div>
        <div class="div7">&gt;</div>
        <div class="div8">&gt;&gt;</div>
      </div>
    </div>
  </div>

  <%-- [Contents] ######################################################### --%>
  <jsp:include page="/layout/footer.jsp" />
  <jsp:include page="/layout/script.jsp" />
</body>

</html>