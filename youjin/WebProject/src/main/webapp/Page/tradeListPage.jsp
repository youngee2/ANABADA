<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ include file="./HeaderFooter/Header.jsp"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>거래 페이지</title>

  <meta http-equiv="X-UA-Compatible" content="IE=edge">

  <!--부트스트랩-->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
    integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-ho+j7jyWK8fNQe+A12Hb8AhRq26LrZ/JpcUGGOn+Y7RsweNrtN/tE3MoK7ZeZDyx"
    crossorigin="anonymous"></script>
  <script>
    $('.carousel').carousel({
      interval: 2000 //기본 5초
    })
  </script>

  <script>
    $(window).scroll(function () {
      if ($(this).scrollTop() > 300) {
        $('.btn_gotop').show();
      } else {
        $('.btn_gotop').hide();
      }
    });
    $('.btn_gotop').click(function () {
      $('html, body').animate({ scrollTop: 0 }, 400);
      return false;
    });
  </script>

  <link rel="stylesheet" href="./css/style-jieun.css">
</head>

<body>

  <div style="margin-left: 10%; margin-top: 2%;">
    <a href="" class="a link">HOME</a>
    > 거래
  </div>



  <div class="slide-img">
    <div id="demo" class="carousel slide" data-ride="carousel">

      <div class="carousel-inner">
        <!-- 슬라이드 쇼 -->
        <div class="carousel-item active">
          <!--가로-->
          <picture>
            <source srcset="./img/banner1-trade.png" media="(min-width: 768px)" />
            <source srcset="./img/banner1(min)-trade.png" media="(min-width:400px)" />
            <img src="./img/banner1-trade.png">
        </picture>
          <div class="carousel-caption d-none d-md-block">
          </div>
        </div>
        <div class="carousel-item">
          <picture>
            <source srcset="./img/banner2-trade.png" media="(min-width: 768px)" />
            <source srcset="./img/banner2(min)-trade.png" media="(min-width:400px)" />
            <img src="./img/banner2-trade.png">
        </picture>
        </div>
        <div class="carousel-item">
          <picture>
            <source srcset="./img/banner3-trade.png" media="(min-width: 768px)" />
            <source srcset="./img/banner3(min)-trade.png" media="(min-width:400px)" />
            <img src="./img/banner3-trade.png">
        </picture>
        </div>

        <!-- / 슬라이드 쇼 끝 -->

        <!-- 왼쪽 오른쪽 화살표 버튼 -->
        <a class="carousel-control-prev" href="#demo" data-slide="prev">
          <span class="carousel-control-prev-icon" aria-hidden="true"></span>
          <!-- <span>Previous</span> -->
        </a>
        <a class="carousel-control-next" href="#demo" data-slide="next">
          <span class="carousel-control-next-icon" aria-hidden="true"></span>
          <!-- <span>Next</span> -->
        </a>
        <!-- / 화살표 버튼 끝 -->

        <!-- 인디케이터 -->
        <ul class="carousel-indicators">
          <li data-target="#demo" data-slide-to="0" class="active"></li>
          <!--0번부터시작-->

          <li data-target="#demo" data-slide-to="1"></li>
          <li data-target="#demo" data-slide-to="2"></li>
        </ul>
        <!-- 인디케이터 끝 -->
      </div>
    </div>
  </div>



  <!--검색창-->
  <div class="search-category">
    <div class="searchbox">
      <input class="search-text" type="text" placeholder="키워드를 검색하세요.">
      <button class="search-btn" type="submit">
        <svg xmlns="http://www.w3.org/2000/svg" width="20" height="20" fill="#337a98" class="bi bi-search"
          viewBox="0 0 16 16">
          <path
            d="M11.742 10.344a6.5 6.5 0 1 0-1.397 1.398h-.001c.03.04.062.078.098.115l3.85 3.85a1 1 0 0 0 1.415-1.414l-3.85-3.85a1.007 1.007 0 0 0-.115-.1zM12 6.5a5.5 5.5 0 1 1-11 0 5.5 5.5 0 0 1 11 0z" />
        </svg>

      </button>
    </div>

    <!--카테고리-->
    <div style="margin-top: 5%;">
      <ul class="category">
        <li class="li-tradePage category-li">
          <a href="" class="a link">
            <span>
              <img src="./img/sprout-tree-svgrepo-com.svg" class="icon">
              <br>전체
            </span>
          </a>
        </li>

        <li class="li-tradePage category-li">
          <a href="" class="a link">
            <span>
              <img src="./img/fassion.png" class="icon">
              <br>패션/잡화/뷰티
            </span>
          </a>
        </li>

        <li class="li-tradePage category-li">
          <a href="" class="a link">
            <span>
              <img src="./img/tech.png" class="icon">
              <br>테크/가전
            </span>
          </a>
        </li>

        <li class="li-tradePage category-li">
          <a href="" class="a link">
            <span>
              <img src="./img/home.png" class="icon">
              <br>홈/리빙
            </span>
          </a>
        </li>

        <li class="li-tradePage category-li">
          <a href="" class="a link">
            <span>
              <img src="./img/baby.png" class="icon">
              <br>베이비/키즈
            </span>
          </a>
        </li>

        <li class="li-tradePage category-li">
          <a href="" class="a link">
            <span>
              <img src="./img/pet.png" class="icon">
              <br>반려동물
            </span>
          </a>
        </li>

        <li class="li-tradePage category-li">
          <a href="" class="a link">
            <span>
              <img src="./img/game.png" class="icon">
              <br>게임/취미
            </span>
          </a>
        </li>

        <li class="li-tradePage category-li">
          <a href="" class="a link">
            <span>
              <img src="./img/etc.png" class="icon">
              <br>기타
            </span>
          </a>
        </li>

      </ul>
    </div>
  </div>


  <!--게시글 리스트(기능 넣으면 수정예정)-->
  <div class="container-fluid">
    <h4>(카테고리 표시할 부분)</h4>
    <hr>
    <div class="row">
      <div class="col-6 col-md-3">
        <div class="ex-list">
          <p style="background-image: url(./img/slide1.jpg);" class="listimg">
          <p class>
          <ul>
            <li class="li-tradePage" style="color:#ff6666;"> ♥ </li>
            <li class="li-tradePage"> 교환 희망 물품 :</li>
          </ul>
          </p>
          <p>#태그영역</p>
          <p style="text-align: center;">물품제목영역</p>
        </div>
      </div>
      <div class="col-6 col-md-3">
        <div class="ex-list">
          <p style="background-image: url(./img/slide2.jpg);" class="listimg">
        </div>
      </div>
      <div class="col-6 col-md-3">
        <div class="ex-list">1</div>
      </div>
      <div class="col-6 col-md-3">
        <div class="ex-list">1</div>
      </div>
    </div>


    <div class="row">
      <div class="col-6 col-md-3">
        <div class="ex-list">
          <p style="background-image: url(./img/slide1.jpg);" class="listimg">
          <p class>
          <ul>
            <li class="li-tradePage" style="color:#ff6666;"> ♥ </li>
            <li class="li-tradePage"> 교환 희망 물품 :</li>
          </ul>
          </p>
          <p>#태그영역</p>
          <p style="text-align: center;">물품제목영역</p>
        </div>
      </div>
      <div class="col-6 col-md-3">
        <div class="ex-list">
          <p style="background-image: url(./img/slide2.jpg);" class="listimg">
        </div>
      </div>
      <div class="col-6 col-md-3">
        <div class="ex-list">1</div>
      </div>
      <div class="col-6 col-md-3">
        <div class="ex-list">1</div>
      </div>
    </div>


    <div class="row">
      <div class="col-6 col-md-3">
        <div class="ex-list">
          <p style="background-image: url(./img/slide1.jpg);" class="listimg">
          <p class>
          <ul>
            <li class="li-tradePage" style="color:#ff6666;"> ♥ </li>
            <li class="li-tradePage"> 교환 희망 물품 :</li>
          </ul>
          </p>
          <p>#태그영역</p>
          <p style="text-align: center;">물품제목영역</p>
        </div>
      </div>
      <div class="col-6 col-md-3">
        <div class="ex-list">
          <p style="background-image: url(./img/slide2.jpg);" class="listimg">
        </div>
      </div>
      <div class="col-6 col-md-3">
        <div class="ex-list">1</div>
      </div>
      <div class="col-6 col-md-3">
        <div class="ex-list">1</div>
      </div>
    </div>



    <hr>
    <a href="" title="글쓰기" class="button btnFade btnOrange">글쓰기</a>
  </div>
  <p style="margin: 20% 0;">
  </p>

  <!--글 목록 번호-->

  <!--TOP 버튼-->
  <div class="floating">
    <a href="#" class="btn_gotop" id="click">
      <span class="glyphicon glyphicon-chevron-up">
        <img src="./img/top-arrow-svgrepo-com.svg" style="width: 50px; height:50px;">
      </span>
    </a>
  </div>


<%@ include file="./HeaderFooter/Footer.jsp"%>
</body>

</html>