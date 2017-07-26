<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="col-md-2" id="commonLeftSide">
	<%@include file="../common/classManageLectureSideCategory.jsp"%>
</div>

<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading"
			style="background-color: #666666; margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">
				강의계획서</h4>
		</div>
		<div class="panel-body">
			<form name="lct" method="post" action="${pageContext.request.contextPath }/professor/classManage/lectureModify">
				강의번호 : <input type="text" name="lct_num" value="${detailLct.get('lct_num') }"/>
				담당교수 : <input type="text" readonly value="${detailLct.get('prfs_nm')}"/>
				E-mail : <input type="text" readonly value="${detailLct.get('prfs_email')}"/>
				분반 : <input type="text" readonly value="${detailLct.get('lct_nm_class')}"/>
				핸드폰 : <input type="text" readonly value="${detailLct.get('prfs_hp')}"/><br/>
				
				교과목명 : <input type="text" readonly value="${detailLct.get('sjt_nm')}"/>
				학점 : <input type="text" readonly value="${detailLct.get('sjt_crd')}"/>
				이수구분 : <input type="text" readonly value="${detailLct.get('sjt_cd')}"/>
				개설학년 : <input type="text" readonly value="${detailLct.get('sjt_estm_grd')}"/>
				개설학과 : <input type="text" readonly value="${detailLct.get('dept_nm')}"/><br/>
				
				1.과목개요<br/>
				<textarea rows="10" cols="100" readonly>${detailLct.get('sjt_smy')}</textarea><br/>
				<div style="margin:10px 0; border:2px pink dotted">
				
				2.평가방법<br/>
				중간고사<input type="text"  name="lct_me_rate" value="${detailLct.get('lct_me_rate')}"/>
				기말고사<input type="text" name="lct_fe_rate" value="${detailLct.get('lct_fe_rate')}"/>
				과제<input type="text"  name="lct_asgn_rate" value="${detailLct.get('lct_asgn_rate')}"/>
				출석<input type="text"  name="lct_atdc_rate" value="${detailLct.get('lct_atdc_rate')}"/><br/>
					
				</div>
				3.교재<br/>
				저자<input type="text" name="writer" value="${textbook[0] }"/>
				서명<input type="text" name="title" value="${textbook[1] }"/>
				출판사<input type="text" name="publisher" value="${textbook[2] }"/>
				년도<input type="text" name="year" value="${textbook[3] }"/><br/>
				
				4.강의내용<br/>
				<textarea rows="10" cols="100" name="lct_cont">${detailLct.get('lct_cont')}</textarea><br/>
				<input type="submit" value="수정완료"/>
				<button onclick="location.href='<%=request.getContextPath()%>/professor/classManage/lectureDetail'">취소</button>
			</form>
<!-- 		평가방법이 100%가 넘는 경우 체크해야됨 -->
<!-- 		교재를 입력안하는 경우도 해야되고 -->
<!-- 		강의내용을 작성 안하는 경우도 생각해야됨 -->
		</div>
	</div>
</div>