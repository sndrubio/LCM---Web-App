<head>
	<meta name="layout" content="main"/>
	<%@ page import = "lcm.*" %>
</head>

<body>
    <g:uploadForm name = "upload" action = "save">
    	<p>Please, introduce your report name: &nbsp;<input type="text" name="name" value="${reportInstance?.name} id="name" /></p>
    	<p>Please, select a location: &nbsp;<g:select name="location" from="${Location.list()}" optionKey="id" required="" value="${reportInstance?.primaryLocation?.id}"/></p>
        <p>Please, select a file: &nbsp;<input type="file" name="fileUpload" /></p>
        <p><input type="submit" /></p>
    </g:uploadForm>

</body>