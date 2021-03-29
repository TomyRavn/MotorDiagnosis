<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html lang="en">
<head>

<!-- jQuery -->
<script src="<c:url value="/resources/jquery/dist/jquery.min.js"/>"></script>
	
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>A soft</title>
  <link rel="stylesheet" href="/resources/static/css/index.css">
  <script src="/resources/static/js/includeHTML.js"></script>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/paginationjs/2.1.4/pagination.css"/>
  
  <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
  <script>
  setCookie('TEST_CNT', 67, 1);
  /*
  
  var deleteCookie = function(name) {
      document.cookie = name + '=; expires=Thu, 01 Jan 1999 00:00:10 GMT;';
  }
  
  deleteCookie('NOW_TIME');
  */
  
  function setCookie(cookie_name, value, days) {
     var exdate = new Date();
     exdate.setDate(exdate.getDate() + days);
     // 설정 일수만큼 현재시간에 만료값으로 지정

     var cookie_value = escape(value) + ((days == null) ? '' : '; expires=' + exdate.toUTCString());
     document.cookie = cookie_name + '=' + cookie_value;
   }
  
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
  
  function addTestModel(){
	 
     
     var org_nm = $("#org_nm option:selected").val();
     var model_nm = $("#model_nm option:selected").val();
     
     $.ajax({
			url: "/insertModel",
			type: 'POST',
			data: { 
				org_nm: org_nm, 
				model_nm: model_nm,
				
				type_nm: 'SVM',
				result_nm:'대기', 
				inst_flag: 1,
				err_flag: 0
			},
			success: function(data) {
				console.log(data);
				selectModel(0,10);
				
			}, error: function(request, status, error) {
				console.log(error);
			}
		});
     
  }
  
  function openAdd(){
	  $('#modelAddForm').css("display", "block"); 
  }
  
  function prevPage(){
	  page--;
	  if(page<0){
		  page=0;
	  }
	  selectModel(page,10);
  }
  
  function nextPage(){
	  page++;
	  if(page>last-1){
		  page=last-1; 
	  }
	  selectModel(page,10);
  }
  
  function movePage(index){
	  selectModel(index,10);
  }
  
  var page=0;
  var last=0;
  
  
  function selectModel(s,p){
	  $.ajax({
			url: "/selectModel",
			type: 'POST',
			data: { startPage:(s*p), perPage:p ,page:s},
			success: function(data) {
				console.log(data);
				console.log('1                ');
				
				
				document.getElementById('plusRow1').innerHTML=data.pager.total;
				document.getElementById('plusRow2').innerHTML=data.pager.total;
				document.getElementById('plusRow3').innerHTML=data.resTotal;
				document.getElementById('plusRow4').innerHTML=data.resTotal;
				
				
				 var test_tbody = document.getElementById('test_tbody');
				 $('#test_tbody').empty();
				 
				 
				 for(var i=(data.modelList.length-1) ; i>=0 ; i--){
					 var md = data.modelList[i];
					 var row = test_tbody.insertRow(0);
				     var cell0 = row.insertCell(0);
				     var cell1 = row.insertCell(1);
				     var cell2 = row.insertCell(2);
				     var cell3 = row.insertCell(3);
				     var cell4 = row.insertCell(4);
				     var cell5 = row.insertCell(5);
				     
				     var pp = data.pager.total-((page)*10);
				     
				     cell0.innerHTML = pp-i;
				     cell1.innerHTML = md.org_nm;
				     cell2.innerHTML = md.model_nm;
				     if(md.model_dttm == null){
				    	 cell3.innerHTML = '-';
				     }else{
				    	 cell3.innerHTML = md.model_dttm;
				     }
				     
				     cell4.innerHTML = md.type_nm;
				     if(md.result_nm=='대기'){
				    	 cell5.innerHTML = '<div class="tc"><div class="table-badge">진단중</div></div>';	 
				     }
				     if(md.result_nm=='정상'){
				    	 cell5.innerHTML = '<div class="tc"><div class="table-badge success">정상</div></div>';
				     }
				     if(md.result_nm=='비정상'){
				    	 cell5.innerHTML = '<div class="tc"><div class="table-badge danger">비정상</div></div>';
				     } 
				     
				 }
				 
				page = data.pager.page;
				last = data.pager.last;
				
				console.log('page : '+page);
				console.log('last : '+last);
				
				
				document.getElementById('end_row').innerHTML=data.pager.total-((page)*10)-(data.modelList.length-1);
				document.getElementById('start_row').innerHTML=data.pager.total-((page)*10);
				document.getElementById('total').innerHTML=data.pager.total;
				     
				
				var dataHtml = '<button class="page-btn" onclick="prevPage()"><img src="/resources/static/img/prev.svg" alt=""></button>';
				
				for(var i=0 ; i<last ; i++){
					if(page==i){
						dataHtml += "<button class='page-btn on' onclick='movePage("+i+")'>"+(i+1)+"</button>";	
					}else{
						dataHtml += "<button class='page-btn' onclick='movePage("+i+")'>"+(i+1)+"</button>";
					}
		            	
		            
				}
				dataHtml += '<button class="page-btn" onclick="nextPage()"><img src="/resources/static/img/next.svg" alt=""></button>';
				$("#pageDiv").html(dataHtml);
				
				
				
			}, error: function(request, status, error) {
				console.log(error);
			}
		});
  }
  
  $(document).ready(function(){
	 $('#modelAddForm').css("display", "none"); 
	 selectModel(0,10);
	
	 //$('#fileSelect').
	 
  });
  
  function fileChangeLis(){
	  console.log('fileChangeLis 1      ');
	  if($("#fileSelect").val() != null){
		  var fileValue = $("#fileSelect").val().split("\\");
		  var fileName = fileValue[fileValue.length-1]; // 파일명
		  
		  document.getElementById('file_name').innerHTML=fileName;
		  
	  }
  }
  
  function fileChangeLis2(){
	  console.log('fileChangeLis 2      ');
	  if($("#fileSelect2").val() != null){
		  var fileValue = $("#fileSelect2").val().split("\\");
		  var fileName = fileValue[fileValue.length-1]; // 파일명
		  
		  console.log(fileValue);
		  console.log(fileName);
		  
		  document.getElementById('file_name2').innerHTML=fileName;
		  
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
          <a href="#this" class="gnb-item on onThisToggle">
            <span class="gnb-icon" include-HTML="/resources/static/img/dashboard.svg"></span>
            Dashboard
          </a>
        </div>
        <div class="gnb">
          <a href="/diagonosis/hyundae1DepthList" class="gnb-item arrow onThisToggle">
            <span class="gnb-icon" include-HTML="/resources/static/img/gnb-01.svg"></span>
            전동기 결함 유형 진단
          </a>
          <div class="depth-1">
            <a href="#this" class="depth-1-item onThisToggle">현대모터</a>
            <div class="depth-2">
              <a href="#this" class="depth-2-item onThisToggle">5.5kW(7.5Hp)</a>
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
      <div class="dashboard-title">Dashboard</div>
      <div class="container mb-20">
        <div class="flex mb-20">
          <div class="dashboard-data data-01">
            <div class="dot"></div>
            <div class="name">수집</div>
            <div class="sub">Collect</div>
            <div class="data">
              <font id='plusRow1'></font>
              <span>건</span>
            </div>
          </div>
          <div class="dashboard-data data-02">
            <div class="dot"></div>
            <div class="name">정제</div>
            <div class="sub">Refine</div>
            <div class="data">
              <font id='plusRow2'></font>
              <span>건</span>
            </div>
          </div>
          <div class="dashboard-data data-03">
            <div class="dot"></div>
            <div class="name">전처리</div>
            <div class="sub">Pretreatment</div>
            <div class="data">
              <font id='plusRow3'></font>
              <span>건</span>
            </div>
          </div>
          <div class="dashboard-data data-04">
            <div class="dot"></div>
            <div class="name">진단</div>
            <div class="sub">Diagnosis</div>
            <div class="data">
              <font id='plusRow4'></font>
              <span>건</span>
            </div>
          </div>
        </div>
        <div class="flex">
          <div class="full-basis border-content mr-20">
            <div class="bar-title mb-20">최근 수집 데이터 목록</div>
            <div class="data-table">
              <table>
                <thead>
                  <tr>
                    <th>순번</th>
                    <th>기업</th>
                    <th>모델</th>
                    <th>시간</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>현대모터</td>
                    <td>5.5kW(7.5Hp)</td>
                    <td>2020-12-27 10:21:13</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>현대모터</td>
                    <td>5.5kW(7.5Hp)</td>
                    <td>2020-12-27 09:11:48</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>현대모터</td>
                    <td>5.5kW(7.5Hp)</td>
                    <td>2020-12-26 17:56:32</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
          <div class="full-basis border-content">
            <div class="bar-title mb-20">최근 진단 데이터 목록</div>
            <div class="data-table">
              <table>
                <thead>
                  <tr>
                    <th>순번</th>
                    <th>기업</th>
                    <th>모델</th>
                    <th>시간</th>
                  </tr>
                </thead>
                <tbody>
                  <tr>
                    <td>1</td>
                    <td>현대모터</td>
                    <td>5.5kW(7.5Hp)</td>
                    <td>2020-12-29 09:12:04</td>
                  </tr>
                  <tr>
                    <td>2</td>
                    <td>현대모터</td>
                    <td>5.5kW(7.5Hp)</td>
                    <td>2020-12-29 09:08:16</td>
                  </tr>
                  <tr>
                    <td>3</td>
                    <td>현대모터</td>
                    <td>5.5kW(7.5Hp)</td>
                    <td>2020-12-29 08:47:01</td>
                  </tr>
                </tbody>
              </table>
            </div>
          </div>
        </div>
      </div>
      <div class="container">
        <div class="bar-title mb-20">
        	기업 및 모델 진단 현황
        	<div style="justify-content: flex-end; width: 88%; display: flex;">
        		<button class="btn btn-26 btn-primary" onclick="openAdd()">등록</button>
        	</div>
        </div>
        <!-- 
        <form id="testmodel" name="testmodel">
	        <div class="border-content" style="width; 100%;" id="modelAddForm">
	        	<div class="flex">
	        		<div class="custom-select mr-20">
	            		<div class="name" style="flex: 1 15px;">기업</div>
	            		<select name="" id="org_nm" style="flex: 2 40px;">
	              			<option value="현대모터">현대모터</option>
	            		</select>
	          		</div>
	          		<div class="custom-select mr-20">
			           	<div class="name" style="flex: 1 15px;">모델</div>
	    	        	<select name="" id="model_nm" style="flex: 2 40px;">
		        		   	<option value="5.5kW(7.5Hp)">5.5kW(7.5Hp)</option>
	            		</select>
	          		</div>
	          		<div class="custom-select" >
			           	<div class="name" style="flex: 1 80px;">데이터 파일 등록</div>
			           	<input type="file" style="flex: 2 150px;" />
			           	
			           	<div style="flex: 2 150px;">
			           		<button class="btn btn-26 btn-success" style="height:100%; margin:auto;">파일선택</button>
			           	</div>
			           	
	            		<button class="btn btn-darkblue btn-40 ml-20" onclick="alert('!!!')">등록</button>
	          		</div>
	        	</div>
	        </div>
        </form>
        
         -->
        
        
        
        
        <div class="border-content" style="width; 100%;" id="modelAddForm">
           <div class="flex">
              <div class="custom-select mr-20">
                  <div class="name" style="flex: 1 15px;">기업</div>
                  <select name="" id="org_nm" style="flex: 2 40px;">
                       <option value="현대모터">현대모터</option>
                  </select>
                </div>
                <div class="custom-select mr-20">
                    <div class="name" style="flex: 1 15px;">모델</div>
                  <select name="" id="model_nm" style="flex: 2 40px;">
                       <option value="5.5kW(7.5Hp)">5.5kW(7.5Hp)</option>
                  </select>
                </div>
                <div class="custom-select" >
                    <div class="name" style="flex: 1 80px;">전류 데이터 파일</div>
                    <input type="file" id="fileSelect" style="flex: 2 150px; display: none;" onchange='fileChangeLis();'/>
                    <label for="fileSelect" style="flex: 2 150px; align-self:center; padding-left:20px; display:flex; align-items:center;">
                       <label for="fileSelect" class="btn" 
                       style="padding:6px 10px; margin-right: 8px; background:#efefef; font-size:12px; font-weight:400; border: 1px solid #bbbbbb; border-radius:4px;">파일선택</label>
                       		<font id="file_name">파일명</font>   
                    </label> 
                    <!-- 
                    <div style="flex: 2 150px;">
                       <button class="btn btn-26 btn-success" style="height:100%; margin:auto;">파일선택</button>
                    </div>
                     -->
                  
                </div>
                
                <div class="custom-select" >
                    <div class="name" style="flex: 1 80px;">자속 데이터 파일</div>
                    <input type="file" id="fileSelect2" style="flex: 2 150px; display: none;" onchange='fileChangeLis2();'/>
                    <label for="fileSelect2" style="flex: 2 150px; align-self:center; padding-left:20px; display:flex; align-items:center;">
                       <label for="fileSelect2" class="btn" style="padding:6px 10px; margin-right: 8px; background:#efefef; font-size:12px; font-weight:400; border: 1px solid #bbbbbb; border-radius:4px;">파일선택</label>
                       		<font id="file_name2">파일명</font>   
                    </label> 
                </div>
                
                <button class="btn btn-darkblue btn-40 ml-20" onclick="addTestModel()">등록</button>
           </div>
        </div>
        
        
        
        <div class="border-content">
          <div class="data-table">
            <table>
              <thead>
                <tr>
                  <th>순번</th>
                  <th>기업</th>
                  <th>모델</th>
                  <th>시간</th>
                  <th>진단 유형</th>
                  <th>진단 결과</th>
                </tr>
              </thead>
              <tbody id="test_tbody">
                <tr>
                  <td>67</td>
                  <td>현대모터</td>
                  <td>5.5kW(7.5Hp)</td>
                  <td>2021-1-30 15:02:37</td>
                  <td>DNN</td>
                  <td>
                    <div class="tc">
                      <div class="table-badge">진단중</div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>66</td>
                  <td>현대모터</td>
                  <td>5.5kW(7.5Hp)</td>
                  <td>2020-12-29 09:12:04</td>
                  <td>RF</td>
                  <td>
                    <div class="tc">
                      <div class="table-badge success">정상</div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>65</td>
                  <td>현대모터</td>
                  <td>5.5kW(7.5Hp)</td>
                  <td>2020-12-29 09:08:16</td>
                  <td>SVM</td>
                  <td>
                    <div class="tc">
                      <div class="table-badge success">정상</div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>64</td>
                  <td>현대모터</td>
                  <td>5.5kW(7.5Hp)</td>
                  <td>2020-12-29 08:47:01</td>
                  <td>DNN</td>
                  <td>
                    <div class="tc">
                      <div class="table-badge success">정상</div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>63</td>
                  <td>현대모터</td>
                  <td>5.5kW(7.5Hp)</td>
                  <td>2020-12-27 06:33:23</td>
                  <td>RF</td>
                  <td>
                    <div class="tc">
                      <div class="table-badge success">정상</div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>62</td>
                  <td>현대모터</td>
                  <td>5.5kW(7.5Hp)</td>
                  <td>2020-12-26 14:49:12</td>
                  <td>SVM</td>
                  <td>
                    <div class="tc">
                      <div class="table-badge success">정상</div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>61</td>
                  <td>현대모터</td>
                  <td>5.5kW(7.5Hp)</td>
                  <td>2020-12-26 09:43:29</td>
                  <td>DNN</td>
                  <td>
                    <div class="tc">
                      <div class="table-badge success">정상</div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>60</td>
                  <td>현대모터</td>
                  <td>5.5kW(7.5Hp)</td>
                  <td>2020-12-24 21:17:14</td>
                  <td>RF</td>
                  <td>
                    <div class="tc">
                      <div class="table-badge success">정상</div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>59</td>
                  <td>현대모터</td>
                  <td>5.5kW(7.5Hp)</td>
                  <td>2020-12-24 18:42:05</td>
                  <td>SVM</td>
                  <td>
                    <div class="tc">
                      <div class="table-badge success">정상</div>
                    </div>
                  </td>
                </tr>
                <tr>
                  <td>58</td>
                  <td>현대모터</td>
                  <td>5.5kW(7.5Hp)</td>
                  <td>2020-12-24 14:26:11</td>
                  <td>DNN</td>
                  <td>
                    <div class="tc">
                      <div class="table-badge success">정상</div>
                    </div>
                  </td>
                </tr>
              </tbody>
            </table>
          </div>
          <div class="pagenation mt-18">
            <div class="data">Showing <font id='end_row'>58</font> to <font id='start_row'>67</font> of <font id='total'>67</font> entries</div>
            <div class="left-auto">
            	<!-- <div class="flex" id="data-container"></div> -->
              <div class="flex" id="pageDiv"></div>
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
  	/*
  		const CLICKED_CLASS = "on";
  		
  		function movePage(index){
  			const title = document.querySelector("#pageBtn"+index);
  			const hasClass = title.classList.contains(CLICKED_CLASS);
  			
  			if(index == 1){
  				const temp2 = document.querySelector("#pageBtn2");
  				temp2.classList.remove(CLICKED_CLASS);  				
  			}else if(index == 2){
  				const temp1 = document.querySelector("#pageBtn1");
  				temp1.classList.remove(CLICKED_CLASS);
  			}
  			
  			
  			if(!hasClass){
  				title.classList.add(CLICKED_CLASS);
  			}
  		}
  		
  		function addModel(){
  			
  		}
  */
  </script>
</body>
</html>