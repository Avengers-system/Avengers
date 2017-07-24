<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- Content -->
<div class="col-md-2" id="commonLeftSide">
<%@include file="../common/classManageLectureSideCategory.jsp" %>
</div>
<div class="col-md-10">
	<h1>강의계획서</h1>
	<hr color="pink"/>
	<form>
		강의번호 : <input type="text" readonly value="${detailLct.get('lct_num') }"/>
		담당교수 : <input type="text" readonly value="${detailLct.get('prfs_nm')}"/>
		E-mail : <input type="text" readonly value="${detailLct.get('prfs_email')}"/>
		분    반 : <input type="text" readonly value="${detailLct.get('lct_nm_class')}"/>
		핸 드 폰 : <input type="text" readonly value="${detailLct.get('prfs_hp')}"/><br/>
		
		교과목명 : <input type="text" readonly value="${detailLct.get('sjt_nm')}"/>
		학    점 : <input type="text" readonly value="${detailLct.get('sjt_crd')}"/>
		이수구분 : <input type="text" readonly value="${detailLct.get('sjt_cd')}"/>
		개설학년 : <input type="text" readonly value="${detailLct.get('sjt_estm_grd')}"/>
		개설학과 : <input type="text" readonly value="${detailLct.get('dept_nm')}"/><br/>
		
		1.과목개요<br/>
		<textarea rows="10" cols="100" readonly>${detailLct.get('sjt_smy')}</textarea><br/>
		<div style="margin:10px 0; border:2px pink dotted">
			2.평가방법<br/>
			중간고사<input type="text" readonly value="${detailLct.get('lct_me_rate')}"/>
			기말고사<input type="text" readonly value="${detailLct.get('lct_fe_rate')}"/>
			과제<input type="text" readonly value="${detailLct.get('lct_asgn_rate')}"/>
			출석<input type="text" readonly value="${detailLct.get('lct_atdc_rate')}"/><br/>
		</div>
		3.교재<br/>
		저자<input type="text"  readonly value="${textbook[0] }"/>
		서명<input type="text"  readonly value="${textbook[1] }"/>
		출판사<input type="text" readonly value="${textbook[2] }"/>
		년도<input type="text" readonly value="${textbook[3] }"/><br/>
		
		4.강의내용<br/>
		<textarea rows="10" cols="100" readonly>${detailLct.get('lct_cont')}</textarea>
	</form>
	<button onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureModifyDetail'">수정</button>
	<button onclick="location.href='${pageContext.request.contextPath }/professor/classManage/lectureMain'">뒤로가기</button>
</div> 