<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--side Category-->
<div class="col-md-12">
	<div class="panel panel-default">
		<div class="panel-heading" style="background-color: #2196F3;  margin-top: 10px;">
			<h4 style="color: #fff; font-weight: bold; font-size: 20px;">강의계획서</h4>
		</div>
		<div class="panel-body" >
			<form  class="form-horizontal">
			<div class="form-group">
				<label class="control-label col-sm-1" for="email">강의번호:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${detailLct.get('lct_num')}">
				</div>
				<label class="control-label col-sm-1" for="sjt_nm">교과목명:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${detailLct.get('sjt_nm')}">
				</div>
				<label class="control-label col-sm-1" for="lct_nm_class">분    반:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${detailLct.get('lct_nm_class')}">
				</div>
				<label class="control-label col-sm-1" for="sjt_cd">이수구분:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${detailLct.get('sjt_cd')}">
				</div>
		    </div>
		    <div class="form-group">
				<label class="control-label col-sm-1" for="sjt_crd">학    점:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${detailLct.get('sjt_crd')}">
				</div>
				<label class="control-label col-sm-1" for="sjt_estm_grd">개설학년:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${detailLct.get('sjt_estm_grd')}">
				</div>
				<label class="control-label col-sm-1" for="dept_nm">개설학과:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${detailLct.get('dept_nm')}">
				</div>
		    </div>
		    <div class="form-group">
				<label class="control-label col-sm-1" for="prfs_nm">담당교수:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${detailLct.get('prfs_nm')}">
				</div>
				<label class="control-label col-sm-1" for="prfs_email">E-mail:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${detailLct.get('prfs_email')}">
				</div>
				<label class="control-label col-sm-1" for="prfs_hp">핸 드 폰:</label>
				<div class="col-sm-2">
					<input type="text" readonly class="form-control" value="${detailLct.get('prfs_hp')}">
				</div>
		    </div>
			<div class="form-group">
				<label class="control-label col-sm-1" for="sjt_smy">과목개요:</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="10" cols="100" readonly>${detailLct.get('sjt_smy')}</textarea><br/>
				</div>
		    </div>
		    <div class="form-group">
		    </div>
			<div class="form-group">
		    	<label class="control-label col-sm-1" for="method">평가방법:</label>
				<label class="control-label col-sm-1" for="lct_me_rate">중간고사</label>
				<div class="col-sm-1">
					<input type="text" readonly class="form-control" value="${detailLct.get('lct_me_rate')}">
				</div>
				<label class="control-label col-sm-1" for="lct_fe_rate">기말고사</label>
				<div class="col-sm-1">
					<input type="text" readonly class="form-control" value="${detailLct.get('lct_fe_rate')}">
				</div>
				<label class="control-label col-sm-1" for="lct_asgn_rate">과제</label>
				<div class="col-sm-1">
					<input type="text" readonly class="form-control" value="${detailLct.get('lct_asgn_rate')}">
				</div>
				<label class="control-label col-sm-1" for="lct_atdc_rate">출석</label>
				<div class="col-sm-1">
					<input type="text" readonly class="form-control" value="${detailLct.get('lct_atdc_rate')}">
				</div>
			</div>
				<div class="form-group">
			    	<label class="control-label col-sm-1" for="textbook">교재:</label>
					<label class="control-label col-sm-1" for="textbook1">저자</label>
					<div class="col-sm-1">
						<input type="text" readonly class="form-control" value="${textbook[0] }">
					</div>
					<label class="control-label col-sm-1" for="textbook2">서명</label>
					<div class="col-sm-1">
						<input type="text" readonly class="form-control" value="${textbook[1] }">
					</div>
					<label class="control-label col-sm-1" for="textbook3">출판사</label>
					<div class="col-sm-1">
						<input type="text" readonly class="form-control" value="${textbook[2] }">
					</div>
					<label class="control-label col-sm-1" for="textbook4">년도</label>
					<div class="col-sm-1">
						<input type="text" readonly class="form-control" value="${textbook[3] }">
					</div>
				</div>
			<div class="form-group">
				<label class="control-label col-sm-1" for="lct_cont">강의내용:</label>
				<div class="col-sm-10">
					<textarea class="form-control" rows="10" cols="100" readonly>${detailLct.get('lct_cont')}</textarea><br/>
				</div>
		    </div>
			</form>
		</div>
	</div>
</div>

