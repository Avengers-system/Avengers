<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- Content -->
<%@include file="../common/classManageLectureSideCategory.jsp"%>
<style>
	.fileBox .fileName {display:inline-block;width:190px;height:30px;padding-left:10px;margin-right:5px;line-height:30px;border:1px solid #aaa;background-color:#fff;vertical-align:middle}
	.fileBox .btn_file {display:inline-block;border:1px solid #000;width:100px;height:30px;font-size:13px;line-height:30px;text-align:center;vertical-align:middle}
	.fileBox input[type="file"] {position:absolute;width:1px;height:1px;padding:0;margin:-1px;overflow:hidden;clip:rect(0,0,0,0);border:0}
</style>

<script>
var uploadFile = $('.fileBox .uploadBtn');
uploadFile.on('change', function(){
    if(window.FileReader){
        var filename = $(this)[0].files[0].name;
    } else {
        var filename = $(this).val().split('/').pop().split('\\').pop();
    }
    $(this).siblings('.fileName').val(filename);
});
</script>


<div class="col-md-10">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #666666;  margin-top: 10px;">
			<h4 style="color:#fff; font-weight:bold; font-size:20px;">과제등록</h4>
		</div>
	</div>
	<form name="registryAsgn" method="post" action="${pageContext.request.contextPath}/professor/classManage/registryAsgn" enctype="multipart/form-data" class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-1" for="lct_yr">년도:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" name="lct_yr" value="${lctVO.getLct_yr()}">
				</div>
				<label class="control-label col-sm-1" for="lct_qtr">학기:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" name="lct_qtr" value="${lctVO.getLct_qtr()}">
				</div>
			</div>
			<div class="form-group">
				<label class="control-label col-sm-1" for="lct_nm_class">강의명:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${lctNm.get('lct_nm') }">
				</div>
				<label class="control-label col-sm-1" for="sjt_cd">분반:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${lctNm.get('lct_nm_class') }">
				</div>
		    </div>
		    <div class="form-group">
				<label class="control-label col-sm-1" for="lct_nm_class">제출시작일:</label>
				<div class="col-sm-2">
					<input type="date" class="form-control" name="asgn_start_date" value="2017-08-02">
				</div>
				<label class="control-label col-sm-1" for="sjt_cd">제출마감일:</label>
				<div class="col-sm-2">
					<input type="date" class="form-control" name="asgn_dl_date" value="2017-08-30">
				</div>
		    </div>
		    <div class="form-group">
				<label class="control-label col-sm-1" for="asgn_nm">과제명:</label>
				<div class="col-sm-8">
					<input type="text" class="form-control" name="asgn_nm">
				</div>
		    </div>
		    <div class="form-group">
				<label class="control-label col-sm-1" for="asgn_cont">과제내용:</label>
				<div class="col-sm-8">
					<textarea class="form-control" rows="10" cols="100" name="asgn_cont"></textarea><br/>
				</div>
		    </div>
		    <div class="form-group">
				<label class="control-label col-sm-1" for="asgn_sub_form">첨부파일</label>
				<div class="col-sm-3">
<!-- 					<div class="fileBox"> -->
<!-- 					    <input type="file" id="uploadBtn" class="uploadBtn"> -->
<!-- 					    <input type="button" class="btn_file btn-outline btn-primary" style="padding:0px" value="찾아보기"/> -->
<!-- 					    <input type="text" class="fileName" readonly="readonly"> -->
<!-- 					</div> -->
					<input type="file" name="asgn_sub_form" style="font-size:15px"/>
				</div>
		    </div>
		     <div class="form-group">
				<label class="control-label col-sm-1" for="asgn_cont"></label>
				<div class="col-sm-8">
				    <input type="submit" class="btn btn-outline btn-primary" value="등록"/>
					<input type="button" class="btn btn-outline btn-primary" value="뒤로가기" onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureAsgnMain'"/> 
				</div>
		    </div>
	</form>
</div>