<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
  
<style>

#commonRightSide{
margin-top:50px;

}

div.detailBtn>*{
	margin:0 auto;
}

div.input-group{
	width : 400px;
}

div.input-group>span.input-group-addon{
	width:120px;
}

</style>
    
    
<div class="col-md-2">

	<!-- a 태그에 URL 적고 div 사이에 메뉴 이름을 적는다.  ${pageContext.request.contextPath}-->
	<a href="#">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			메뉴1</div>
	</a>
	<a href="#">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			메뉴2
		</div>
	</a>
	<a href="#">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			메뉴3
		</div>
	</a>
	<a href="#">
		<div style="height: 40px; background-color: #2196F3; color: #fff; border-radius: 5px; font-size: 15px; text-align: center; padding-top: 8px; margin-top: 10px;">
			메뉴4
		</div>
	</a>
</div>