<%@ page import="lcm.Report" %>


<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'name', 'error')} ">
	<label for="name">
		<g:message code="report.name.label" default="Name" />
		
	</label>
	<g:textField name="name" value="${reportInstance?.name}"/>
</div>

<div class="fieldcontain ${hasErrors(bean: reportInstance, field: 'primaryLocation', 'error')} required">
	<label for="primaryLocation">
		<g:message code="report.primaryLocation.label" default="Primary Location" />
		<span class="required-indicator">*</span>
	</label>
	
	<g:select id="primaryLocation" name="primaryLocation.id" from="${lcm.Location.list()}" optionKey="id" required="" value="${reportInstance?.primaryLocation?.id}" class="many-to-one"/>
</div>

<div class="fieldcontain">
	<label for="filename">
		Please, select a file: 
	</label>
	<input type="file" name="fileUpload" />
</div>	    

    	
 
    


