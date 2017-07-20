<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="col-xs-12">
	<ul>

		<li>
			<button id="adminMain" onclick="adminMain_go()">관리자</button>
		</li>
		<li>
			<button id="logout" onclick="logout_go()">로그아웃</button>
		</li>
		<li>
			<button id="myInfo" onclick="myInfo_go()">개인정보</button>
		</li>
		<li>
			<button id="mySchedule" onclick="mySchedule_go()">개인일정관리</button>
		</li>
		<li>
			<button id="adminMain" onclick="adminMain_go()">관리자</button>
		</li>
		<li>
			<button id="myPage" onclick="mypage_go()">mypage</button>
		</li>
		<li>
			<button id="profPage">교수관리</button>
		</li>
		<li>
			<button id="studPage">학생관리</button>
		</li>
		<li>
			<button id="classPage">강의관리</button>
		</li>
		<li>
			<button id="boardPage">HelpDesk</button>
		</li>
	</ul>
</div>
<script src="https://code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
function adminMain_go(){
  location.href="<%=request.getContextPath()%>/admin/main/adminMain";
  }
function logout_go(){
   location.href="<%=request.getContextPath()%>/common/logout";
   }
function myInfo_go(){
    location.href="<%=request.getContextPath()%>/admin/mypage/myInfo";
    }
function mySchedule_go(){
    location.href="<%=request.getContextPath()%>/admin/mypage/mySchedule";
	}
</script>
