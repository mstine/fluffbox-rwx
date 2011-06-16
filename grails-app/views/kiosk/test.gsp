<%--
  Created by IntelliJ IDEA.
  User: mstine
  Date: Nov 29, 2010
  Time: 4:52:31 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head><title>Simple GSP page</title>
  <meta name="layout" content="main"/>
  <g:javascript library="prototype"/>
    <g:javascript>
    document.observe("dom:loaded", function() {
       $('clickme-1').observe("click", function() {
           alert("clicked!");
       })
    });
    </g:javascript>
  </head>
  <body><a id="clickme-1" href="#">CLICK ME!</a>
  <div>
    <p>
      <strong>
        <a id="clickme=1" href="#">Or me??!?</a>
      </strong>
    </p>
  </div></body>
</html>