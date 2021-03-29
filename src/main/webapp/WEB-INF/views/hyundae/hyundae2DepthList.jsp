<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>A soft</title>
  <link rel="stylesheet" href="/resources/static/css/datepicker.min.css">
  <link rel="stylesheet" href="/resources/static/css/index.css">
  <script src="/resources/static/js/includeHTML.js"></script>
  <script src="/resources/static/js/jquery.min.js"></script>
  <script src="/resources/static/js/datepicker.min.js"></script>
  <script src="/resources/static/js/datepicker.en.js"></script>
  
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script>
     
  function getCookie(cookie_name) {
     var x, y;
     var val = document.cookie.split(';');

     for (var i = 0; i < val.length; i++) {
       x = val[i].substr(0, val[i].indexOf('='));
       y = val[i].substr(val[i].indexOf('=') + 1);
       x = x.replace(/^\s+|\s+$/g, ''); // 앞과 뒤의 공백 제거하기
       if (x == cookie_name) {
         return unescape(y); // unescape로 디코딩 후 값 리턴
       }
     }
   }
  
  var res = getCookie('NOW_TIME');
  
  function convertDiv(){
	  $('#out1').css("display", "none");
	  $('#out2').css("display", "block");
  } 
  
  $(document).ready(function(){
	  var res = getCookie('NOW_TIME');
	  
	  if(typeof(res) == 'undefined'){
		  $('#out1').css("display", "none");
		  $('#out2').css("display", "none");  
	  }else{
		  $('#out1').css("display", "block");
		  $('#out2').css("display", "none");  
		  $('#out1Date').html(res);
		  $('#out2Date').html(res);  
	  }
	  
  	}
  );
  
  console.log(res);
  
  </script>
</head>
<body>
  <div class="wrap">
    <header>
      <h1><a href="#this"><img src="/resources/static/img/logo.svg" alt=""></a></h1>
     <nav>
        <div class="gnb">
          <a href="/" class="gnb-item onThisToggle">
            <span class="gnb-icon" include-HTML="/resources/static/img/dashboard.svg"></span>
            Dashboard
          </a>
        </div>
        <div class="gnb">
          <a href="/diagonosis/hyundae1DepthList" class="gnb-item on arrow onThisToggle">
            <span class="gnb-icon" include-HTML="/resources/static/img/gnb-01.svg"></span>
            전동기 결함 유형 진단
          </a>
          <div class="depth-1">
            <a href="/diagonosis/hyundae1DepthList" class="depth-1-item on onThisToggle">현대모터</a>
            <div class="depth-2">
              <a href="/diagonosis/hyundae2DepthList?item_sn=${minNum}" class="depth-2-item on onThisToggle">5.5kW(7.5Hp)</a>
            </div>
          </div>
        </div>
        <div class="gnb">
          <a href="#this" class="gnb-item arrow onThisToggle">
          <span class="gnb-icon" include-HTML="/resources/static/img/gnb-02.svg"></span>
          ECO 시스템 환경관리
          </a>
        </div>
      </nav>
      <div class="bottom-logo"><img src="/resources/static/img/logo.svg" alt=""></div>
    </header>
    <main>
      <div class="page-title mb-40">
        현대모터
        <div class="sub">전동기 결함 유형 진단</div>
      </div>
      <div class="flex">
        <div class="container xs mr-20">
          <div class="bar-title mb-20">분석데이터</div>
          <div class="border-content mb-20">
            <div class="flex mb-20">
              <div class="custom-select mr-20">
                <div class="name">결함유형</div>
                <select name="" id="">
                  <option value="">전체</option>
                  <option value="">회전자바 결함</option>
                  <option value="">부하불평형 결함</option>
                  <option value="">편심 결함</option>
                </select>
              </div>
              <div class="custom-select">
                <div class="name">상태</div>
                <select name="" id="">
                  <option value="">전체</option>
                  <option value="">정상</option>
                  <option value="">비정상</option>
                  <option value="">대기</option>
                </select>
              </div>
            </div>
            <div class="flex align-center">
              <input type="text" placeholder="년도-월-일" 
              class="datepicker-input datepicker-here" 
              data-language="en"
              data-date-format="yyyy-mm-dd">
              <span class="my-10">~</span>
              <input type="text" placeholder="년도-월-일" 
              class="datepicker-input datepicker-here" 
              data-language="en"
              data-date-format="yyyy-mm-dd">
              <button class="btn btn-darkblue btn-40 ml-20">검색</button>
            </div>
          </div>
          <div class="data-content">
            <div class="top-info">
              <div class="info-data">
                <div class="dot success"></div>
                <div class="name">비정상</div>
              </div>
              <div class="info-data">
                <div class="dot"></div>
                <div class="name">정상</div>
              </div>
            </div>
            <div class="scroll-box">
            
            	<div class="card" id="out1">
              		<div class="card-name"><a href="#" onclick="convertDiv()">현대모터(5.5kW(7.5Hp))</a></div>
              	 	<div class="card-date" id="out1Date"></div>
              	 	<div class="flex between">
               			<div class="card-text">분석이 완료되지 않았습니다.</div>
                	 	<button class="btn btn-26 lg btn-danger">
                	    	<div class="btn-icon">
                    	 		<img src="/resources/static/img/delete.svg" alt="">
                   			</div>
                   			삭제
                 	</button>
                	</div>
              	</div>
               <div class="card" id="out2">
               	<div class="card-name"><a href="#">현대모터(5.5kW(7.5Hp))</a></div>
               	<div class="card-date" id="out2Date"></div>
               	<div class="flex between">
                  <div class="btn-group">
                    <button class="btn btn-26 btn-primary">DNN</button>
                    <button class="btn btn-26 btn-primary">RF</button>
                    <button class="btn btn-26 btn-primary">SVM</button>
                    <button class="btn btn-26 btn-primary">Ensemble</button>
                  </div>
                  <button class="btn btn-26 lg btn-danger">
                    <div class="btn-icon">
                      <img src="/resources/static/img/delete.svg" alt="">
                    </div>
                    삭제
                  </button>
                </div>
              </div>
              
            <div class="card">
               <div class="card-name"><a href="#">현대모터(5.5kW(7.5Hp))</a></div>
               <div class="card-date">2020-12-20 16:57:20</div>
               <div class="flex between">
               	<div class="card-text">분석이 완료되지 않았습니다.</div>
                 <button class="btn btn-26 lg btn-danger">
                   <div class="btn-icon">
                     <img src="/resources/static/img/delete.svg" alt="">
                   </div>
                   삭제
                 </button>
                </div>
              </div>
              <div class="card">
                <div class="card-name"><a href="/diagonosis/hyundae2DepthSelected2">현대모터(5.5kW(7.5Hp))</a></div>
                <div class="card-date">2020-12-19 16:42:36</div>
                <div class="flex between">
                  <div class="btn-group">
                    <button class="btn btn-26 btn-primary">DNN</button>
                    <button class="btn btn-26 btn-primary">RF</button>
                    <button class="btn btn-26 btn-primary">SVM</button>
                    <button class="btn btn-26 btn-primary">Ensemble</button>
                  </div>
                  <button class="btn btn-26 lg btn-danger">
                    <div class="btn-icon">
                      <img src="/resources/static/img/delete.svg" alt="">
                    </div>
                    삭제
                  </button>
                </div>
              </div>
              <div class="card">
                <div class="card-name"><a href="/diagonosis/hyundae2DepthSelected">현대모터(5.5kW(7.5Hp))</a></div>
                <div class="card-date">2020-12-14 17:34:33</div>
                <div class="flex between">
                  <div class="btn-group">
                    <button class="btn btn-26 btn-primary">DNN</button>
                    <button class="btn btn-26 btn-primary">RF</button>
                    <button class="btn btn-26 btn-primary">SVM</button>
                    <button class="btn btn-26 btn-primary">Ensemble</button>
                  </div>
                  <button class="btn btn-26 lg btn-danger">
                    <div class="btn-icon">
                      <img src="/resources/static/img/delete.svg" alt="">
                    </div>
                    삭제
                  </button>
                </div>
              </div>
            </div>
          </div>
        </div>
        <div class="container sm">
          <div class="bar-title mb-20">
            분석결과
            <div class="sub">현대모터(5.5kW(7.5Hp))</div>
          </div>
          <div class="graph-scroll-content">
            <div class="graph-grid-content">
              <div class="graph-item border-content">
                <div class="graph-title">RawData(A)</div>
                <div class="graph-box ready"></div>
              </div>
              <div class="graph-item border-content">
                <div class="graph-title">RawData(V)</div>
                <div class="graph-box ready"></div>
              </div>
              <div class="graph-item border-content">
                <div class="graph-title">FFT(30Hz A)</div>
                <div class="graph-box ready"></div>
              </div>
              <div class="graph-item border-content">
                <div class="graph-title">FFT(30Hz V)</div>
                <div class="graph-box ready"></div>
              </div>
              <div class="graph-item border-content">
                <div class="graph-title">FFT(60Hz A)</div>
                <div class="graph-box ready"></div>
              </div>
            </div>
            <div class="board-grid ">
              <div class="board-grid-content">
                <div class="board-title">Deep Learning</div>
                <div class="board-column">
                  <div class="board-item">
                    <div class="board-name success">DNN</div>
                  </div>
                  <div class="board-item">
                    <div class="board-name success">Ensemble</div>
                  </div>
                </div>
              </div>
              <div class="board-grid-content">
                <div class="board-title">Machine Learning</div>
                <div class="board-row">
                  <div class="board-item">
                    <div class="board-name success">RF</div>
                  </div>
                  <div class="board-item">
                    <div class="board-name success">SVM</div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>
    </main>
  </div>
  <script>
    includeHTML();
  </script>
  <script src="/resources/static/js/onThisToggle.js"></script>
  <script>
    $('.datepicker-here').datepicker({
    });
  </script>
</body>
</html>