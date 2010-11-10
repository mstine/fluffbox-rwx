<%--
  Created by IntelliJ IDEA.
  User: mstine
  Date: Nov 10, 2010
  Time: 12:25:34 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
  <head><title>Find a Speaker</title>
    <meta name="layout" content="main"/>
  </head>
  <body>
  <div class="speakerDetails span-24 last">
    <div class="speakerDetailsLeft span-8">
      <img src="${speaker.imageUrl}"/>
      <p>
        <g:link controller="speakerClone" action="findBySpeaker" id="${speaker.id}">Find this Speaker</g:link>
      </p>
    </div>
    <div class="speakerDetailsRight span-16 last">
      <h1>${speaker.name}</h1>
      <h2>${speaker.title}</h2>
      <p>${speaker.bio}</p>
    </div>
  </div>
  </body>
</html>