<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<div class="paginate">
	<c:set value="${pageArray}" var="page"></c:set>
	<%-- 
	("prev_pageno", pageNo[0])
	("page_sno", pageNo[1])
	("page_eno", pageNo[2])
	("next_pageno", pageNo[3])
	("total_page", pageNo[4])
	("record_start_no", pageNo[5])
	("record_end_no", pageNo[6])
	("group_no", pageNo[7])
	 --%>
	<nav>
		<ul class="pagination">

			<li class="<c:if test="${page[7] eq page[1]}">disabled</c:if>"><a
				href="javascript:goTo(${cat},1)" aria-label="home"><span
					aria-hidden="true">&laquo;</span></a></li>
			<li class="<c:if test="${page[7] eq page[1]}">disabled</c:if>"><a
				href="javascript:goTo(${cat},${page[0]})" aria-label="pre"><span
					aria-hidden="true">&lt;</span></a></li>
			<c:forEach begin="${page[1]}" end="${page[2]}" step="1" var="p">
				<c:choose>
					<c:when test="${currentPage==p}">
						<li class="active"><a href="javascript:goTo(${cat},${p})">${p}<span
								class="sr-only">(current)</span></a></li>
					</c:when>
					<c:otherwise>
						<li><a href="javascript:goTo(${cat},${p})">${p}</a></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
			<li class="<c:if test="${page[4] eq page[2]}">disabled</c:if>"><a
				href="javascript:goTo(${cat},${page[3]})" aria-label="Next"><span
					aria-hidden="true">&gt;</span></a></li>
			<li class="<c:if test="${page[4] eq page[2]}">disabled</c:if>"><a
				href="javascript:goTo(${cat},${page[4]})" aria-label="End"><span
					aria-hidden="true">&raquo;</span></a></li>
		</ul>
	</nav>
</div>