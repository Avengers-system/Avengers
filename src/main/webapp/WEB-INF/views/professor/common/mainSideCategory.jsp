<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
		<div class="col-xs-12">
			<div id="userInformation">
				<img src="http://placehold.it/100x100" />
				<c:choose>
					<c:when test="${not empty prfs }">
						<p>이름:${prfs.prfs_nm }</p>
						<p>이메일:${prfs.prfs_email }</p>
					</c:when>
				</c:choose>
			</div>
		</div>
		<div class="col-xs-12">
			<div id="userSchedule">
				<div class="panel panel-default">
					<div class="panel-heading">개인일정</div>
					<div class="panel-body">
						<c:choose>
							<c:when test="${not empty perschdList}">
								<c:forEach var="perschd" items="${perschdList }">
									<tr>
										<td>제목:${perschd.perschd_title}</td>
										<td>내용:${perschd.perschd_cont}</td>
										<td>번호:${perschd.perschd_num}</td>
										<td>날짜:${perschd.perschd_date}</td>
									</tr>
								</c:forEach>
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" style="text-align: center;">해당 내용이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>
		</div>
