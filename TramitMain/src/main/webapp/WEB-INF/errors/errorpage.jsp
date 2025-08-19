<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>

<%@ page isErrorPage="true" %>

<% response.setStatus(200); %>
<div class="row my-5" id="global-content">
	<div class="col">    
		<div id="errorpage" class="my-5">
			<img src="images/errorpage.gif" usemap="#errorpage"/>
			<map name="errorpage">
				<area shape="rect" coords="336, 136, 436, 159" 
					href="home.mvc" alt="홈으로 이동" />
			</map>
		</div>
	</div>
</div>