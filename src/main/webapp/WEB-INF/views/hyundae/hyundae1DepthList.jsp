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
     

  function selectModelAll(data){
	  $.ajax({
			url: "/selectModelAll",
			type: 'POST',
			data: data,
			success: function(data) {
				console.log(data);
				console.log(data.selectModelListAll);
				
				$('#cardList').empty();
				var listHtml = '';
				
				for(var i=0 ; i<data.selectModelListAll.length ; i++){
					var md = data.selectModelListAll[i];
					console.log(md);
					
					listHtml += '<div class="card">';
					listHtml +=    '<div class="card-name"><a href="/diagonosis/hyundae2DepthList?item_sn='+md.item_sn+'">'+md.org_nm+'('+md.model_nm+')</a></div>';
					listHtml += '<div class="card-date">'+md.model_dttm+'</div>';
					listHtml +=    '<div class="flex between">';
					console.log(md.inst_flag);
					if(md.inst_flag != 0){
						listHtml +=    	'<div class="card-text">분석이 완료되지 않았습니다.</div>';
						
					} else {
						if(md.err_flag != 0){
							listHtml += '<div class="btn-group">';
							listHtml += '<button class="btn btn-26 btn-success">DNN</button>';
							listHtml += '<button class="btn btn-26 btn-success">RF</button>';
							listHtml += '<button class="btn btn-26 btn-success">SVM</button>';
							listHtml += '<button class="btn btn-26 btn-success">Ensemble</button>';
							listHtml += '</div>';
						}else{
							listHtml += '<div class="btn-group">';
							listHtml += '<button class="btn btn-26 btn-primary">DNN</button>';
							listHtml += '<button class="btn btn-26 btn-primary">RF</button>';
							listHtml += '<button class="btn btn-26 btn-primary">SVM</button>';
							listHtml += '<button class="btn btn-26 btn-primary">Ensemble</button>';
							listHtml += '</div>';	
						}
							
					}
					
					
					
					listHtml +=      '<button class="btn btn-26 lg btn-danger" onclick="submitDelete('+md.item_sn+')">';
					listHtml +=        '<div class="btn-icon">';
					listHtml +=          '<img src="/resources/static/img/delete.svg" alt="">';
					listHtml +=        '</div>';
					listHtml +=        	'삭제';
					listHtml +=      '</button>';
					listHtml +=     '</div>';
					listHtml +=   '</div>';
					
					
					
					
				}
				
				$("#cardList").html(listHtml);
				
				
			}, error: function(request, status, error) {
				console.log(error);
			}
		});
  }
  
  
  
  $(document).ready(function(){
	  
	  var data = {err_flag:-1,result_nm:'-1'};
	  selectModelAll(data);
  	}
  );
  
  function selectAll(){
	  var s1 = $("#select1 option:selected").val();
	  var s2 = $("#select2 option:selected").val();
	  var stdt = $("#stdt").val();
	  var eddt = $("#eddt").val();
	  
	  console.log(s1);
	  console.log(s2);
	  console.log(stdt);
	  console.log(eddt);
	  var data = {err_flag:s1,result_nm:s2,stdt:stdt,eddt:eddt};

	  selectModelAll(data);
	  
  }
  
  function submitDelete(item_sn){
	  if(confirm('삭제하시겠습니까?')){
		  window.location.href = "/diagonosis/hyundae2DepthList/deleteModel?item_sn="+item_sn;
	  }
  }
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
              <a href="/diagonosis/hyundae2DepthList?item_sn=0" class="depth-2-item onThisToggle">5.5kW(7.5Hp)</a>
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
                <select name="" id="select1">
                  <option value="-1">전체</option>
                  <option value="1">회전자바 결함</option>
                  <option value="1">부하불평형 결함</option>
                  <option value="1">편심 결함</option>
                </select>
              </div>
              <div class="custom-select">
                <div class="name">상태</div>
                <select name="" id="select2">
                  <option value="-1">전체</option>
                  <option value="정상">정상</option>
                  <option value="비정상">비정상</option>
                  <option value="대기">대기</option>
                </select>
              </div>
            </div>
            <div class="flex align-center">
              <input type="text" placeholder="년도-월-일" id="stdt"
              class="datepicker-input  datepicker-here" 
              data-language="en"
              data-date-format="yyyy-mm-dd">
              <span class="my-10">~</span>
              <input type="text" placeholder="년도-월-일" id="eddt" 
              class="datepicker-input  datepicker-here" 
              data-language="en"
              data-date-format="yyyy-mm-dd">
              <button class="btn btn-darkblue btn-40 ml-20" onclick="selectAll();">검색</button>
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
            
         <div class="scroll-box" id="cardList">

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