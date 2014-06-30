<!DOCTYPE html>
<!--[if lt IE 7 ]> <html lang="en" class="no-js ie6"> <![endif]-->
<!--[if IE 7 ]>    <html lang="en" class="no-js ie7"> <![endif]-->
<!--[if IE 8 ]>    <html lang="en" class="no-js ie8"> <![endif]-->
<!--[if IE 9 ]>    <html lang="en" class="no-js ie9"> <![endif]-->
<!--[if (gt IE 9)|!(IE)]><!--> <html lang="en" class="no-js"><!--<![endif]-->
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
		<title><g:layoutTitle default="LCM"/></title>
		<link href='http://fonts.googleapis.com/css?family=Patrick+Hand+SC|Istok+Web' rel='stylesheet' type='text/css'>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<link rel="shortcut icon" href="${resource(dir: 'images', file: 'LCM_IronBow5_size2.png')}" type="image/x-icon">
		<link rel="apple-touch-icon" href="${resource(dir: 'images', file: 'LCM_IronBow5_size2.png')}">
		<link rel="apple-touch-icon" sizes="114x114" href="${resource(dir: 'images', file: 'LCM_IronBow5_size2.png')}">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css">
		<link rel="stylesheet" href="${resource(dir: 'css', file: 'mobile.css')}" type="text/css">
		<g:javascript library="jquery"/>
		<g:layoutHead/>
		<r:layoutResources />
	</head>
	<body>
		
		<div id="lcmLogo" role="banner">
			<img src="${resource(dir: 'images', file: 'LCM_IronBow5_size2.png')}" alt="LCM"/>
		</div>
		
		
			
			<div class="nav" role="navigation">
				<ul>
					<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
					<li><g:link controller='company'>Company</g:link></li>
					<li><g:link controller='location'>Location</g:link></li>
					<li><g:link controller='Report'>Report</g:link></li>
					<li style="float:right">
						<sec:ifLoggedIn>
							Logged in as: <strong><sec:loggedInUserInfo field="username"/></strong> 
							<g:link controller='logout'>Logout</g:link>
						</sec:ifLoggedIn>
						<sec:ifNotLoggedIn>
							<g:link controller='login'>Login</g:link>
						</sec:ifNotLoggedIn>
					</li>
				</ul>
			</div>
	
		
		<g:layoutBody/>
		<div class="footer" role="contentinfo">Sandra Rubio - A20316057 - srubioso@hawk.iit.edu</div>
		<g:javascript library="application"/>
		<r:layoutResources />
	</body>
</html>
