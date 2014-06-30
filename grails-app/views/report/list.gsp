
<%@ page import="lcm.Report" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'report.label', default: 'Report')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#list-report" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<sec:ifAnyGranted roles="ROLE_ADMIN">
				<ul>
					<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
				</ul>
			</sec:ifAnyGranted>
		</div>
		<div id="list-report" class="content scaffold-list" role="main">
			<h1><g:message code="default.list.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<table>
				<thead>
					<tr>
					
						<g:sortableColumn property="name" title="${message(code: 'report.name.label', default: 'Name')}" />
						
						<g:sortableColumn property="filename" title="${message(code: 'report.filename.label', default: 'Filename')}" />
					
						<th><g:message code="report.primaryLocation.label" default="Primary Location" /></th>
					
						<g:sortableColumn property="publicationdate" title="${message(code: 'report.publicationdate.label', default: 'Publication date')}" />
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${reportInstanceList}" status="i" var="reportInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td><g:link action="show" id="${reportInstance.id}">${fieldValue(bean: reportInstance, field: "name")}</g:link></td>
							
						<td><a target= _blank href="${resource(dir: 'up_files', file: "${fieldValue(bean: reportInstance, field: "filename")}")}">${fieldValue(bean: reportInstance, field: "filename")}</a></td>
							
						<td>${fieldValue(bean: reportInstance, field: "primaryLocation")}</td>
					
						<td><g:formatDate date="${reportInstance.publicationdate}" /></td>
					
					</tr>
				</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="${reportInstanceTotal}" />
			</div>
		</div>
	</body>
</html>
