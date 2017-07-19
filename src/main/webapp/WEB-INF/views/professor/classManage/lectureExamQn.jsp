<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
	#removeBtn{
		margin-top:5px;
		height:25px;
	}
</style>
<script>
</script>
	시험문제 조회
	<form>
		<c:choose>
			<c:when test="${eqList eq null }">
				등록된 시험문제가 없습니다.
			</c:when>
			<c:otherwise>
				<c:forEach items="${eqList }" var="eqInfo" varStatus="status">
					<div class="examQn">
						문제고유번호 : <input type="text" name="eq_num" disabled="disabled" value="${eqInfo.getEq_num() }"/><br/>
						<input type="text" name="eq_qtna" readonly value="${eqInfo.getEq_qtna() }" style="width:20px"/>.<input type="text" readonly name="eq_qtn" value="${eqInfo.getEq_qtn() }"/><br/>
						<c:choose>
							<c:when test="${eqInfo.getEq_qtn_type() eq 1 }">
								①<input type="text" name="eq_exmp_one" value="${eq1.getEq_exmp_one() }"/><br/>
								②<input type="text" name="eq_exmp_two" value="${eq1.getEq_exmp_two() }"/><br/>
								③<input type="text" name="eq_exmp_three" value="${eq1.getEq_exmp_three() }"/><br/>
								④<input type="text" name="eq_exmp_four" value="${eq1.getEq_exmp_four() }"/><br/>
								답:<input type="text" name="eq_ans" value="${eq1.getEq_ans() }"/><br/><br/>
							</c:when>
							<c:otherwise>
								주관식문항은 문제만 입력이 가능합니다.<br/><br/>
							</c:otherwise>
						</c:choose>
					</div>
				</c:forEach>
			</c:otherwise>
		</c:choose>
	</form>
	<button onclick="location.href='${pageContext.request.contextPath}/professor/classManage/lectureExamQn?exam_num=${exam_num}&division=2'">시험등록/수정</button>
	1 일경우 수정x 2일경우 등록 및 수정