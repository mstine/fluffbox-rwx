<html>
<head>
  <title><g:layoutTitle default="Welcome!"/></title>
  <link rel="stylesheet" href="${resource(dir: 'css/blueprint', file: 'screen.css')}" type="text/css" media="screen, projection">
  <link rel="stylesheet" href="${resource(dir: 'css/blueprint', file: 'print.css')}" type="text/css" media="print">
  <!--[if lt IE 8]>
    <link rel="stylesheet" href="${resource(dir: 'css/blueprint', file: 'ie.css')}" type="text/css" media="screen, projection">
    <![endif]-->
  <link rel="stylesheet" href="${resource(dir: 'css', file: 'main.css')}" type="text/css" media="screen, projection">
  <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
  <g:layoutHead/>
</head>

<body>
<div class="main container">
  <div class="header span-24 last">
    <div class="span-8">
      <a href="<g:createLinkTo absolute="/"/>"><img src="${resource(dir: 'images', file: 'fluffbox-logo-sm.jpg')}"/></a>
    </div>
    <div class="headerBox span-4">
      <g:link controller="speaker" action="find" class="headerLink">FIND A<br/>SPEAKER</g:link>
    </div>
    <div class="headerBox span-4">
      <g:link controller="kiosk" action="find" class="headerLink">FIND A<br/>FLUFFBOX</g:link>
    </div>
    <div class="headerBox span-4">
      <a href="#" class="headerLink">COMING<br/>SOON</a>
    </div>
    <div class="headerBox span-4 last">
      <a href="#" class="headerLink">TOP 20<br/>RENTALS</a>
    </div>
  </div>
  <div class="accountBar span-24 last">
    <div class="accountBarBox span-4" style="padding-left: 15px">Welcome to Fluffbox!</div>
    <sec:ifNotLoggedIn>
      <div class="accountBarBox span-3" style="text-align: right; padding-right: 5px;"><g:link controller="login">Log-in</g:link></div>
      <div class="accountBarBox span-3"><g:link controller="register">Create an Account</g:link></div>
    </sec:ifNotLoggedIn>
    <sec:ifLoggedIn>
      <div class="accountBarBox span-3" style="text-align: right; padding-right: 5px;">Hi <sec:loggedInUserInfo field="username"/>!</div>
      <div class="accountBarBox span-3"><g:link controller="logout">Logout</g:link></div>  
    </sec:ifLoggedIn>
    <div class="accountBarBox span-3"><a href="#">Get a Free Rental</a></div>
    <div class="accountBarBox span-4"><a href="#">How Fluffbox Works</a></div>
    <div class="accountBarSearch span-6 last"><input type="text"/><input type="submit" value="Search"/></div>
  </div>
  <div class="bodyContent span-24 last">
    <g:layoutBody/>
  </div>
  <div class="footer span-24 last">
    Copyright &copy; 2010 Fluffbox Inc.
  </div>
</div>
</body>
</html>