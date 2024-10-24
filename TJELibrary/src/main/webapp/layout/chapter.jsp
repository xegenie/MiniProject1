<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="bg-gradient py-4">
	<div class="container ">
		<div class="d-flex justify-content-between align-items-center">
			<div class="fs-3 fw-semibold" style="color:#ffffff">
				<%= chapterTitle %>
			</div>
			
			<div>
				<ol class="breadcrumb breadcrumb-chevron p-2">
			      <li class="breadcrumb-item">
			          <span class=""><%= chapter1 %></span>
			      </li>
			      <li class="breadcrumb-item">
			        <span class=""><%= chapter2 %></span>
			      </li>
			      <li class="breadcrumb-item">
			      	<span class=""><%= chapter3 %></span>
			      </li>
			    </ol>
			</div>
		</div>
	</div>
</div>