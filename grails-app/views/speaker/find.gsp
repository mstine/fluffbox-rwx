<%--
  Created by IntelliJ IDEA.
  User: mstine
  Date: Nov 9, 2010
  Time: 2:56:09 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Find a Speaker</title>
  <meta name="layout" content="main"/>
  <g:javascript library="scriptaculous"/>
  <g:javascript>
    var mySleepId;

    function displaySpeakerInfo(element) {
      var speakerId = element.id.substring(element.id.indexOf('-') + 1);

          var myInfo = $('speakerInfo-' + speakerId);
          var elementPos = element.cumulativeOffset();
          var elementDim = element.getDimensions();

          var styles = {
              top: elementPos['top']+'px',
              left: (elementPos['left']+elementDim['width']+5)+'px'
          }

          myInfo.setStyle(styles);
          myInfo.setOpacity(1);
          myInfo.appear();
    }

    document.observe("dom:loaded", function() {

      $$('img.speakerImage').each(function(element) {
        element.observe("mouseover", function() {
          var delay = function() { displaySpeakerInfo(element); };
          mySleepId = setTimeout(delay, 1000);
        });

        element.observe("mouseout", function() {
          if (mySleepId != null) {
              clearTimeout(mySleepId);
          }
          var speakerId = element.id.substring(element.id.indexOf('-') + 1);
          $('speakerInfo-' + speakerId).fade();
        })
      });

    });


  </g:javascript>
</head>
<body>
<g:each in="${speakers}" var="speaker" status="i">
  <g:if test="${i % 4 == 0}"><div class="speakerRow span-24 last"></g:if>
  <div class="speaker span-6 <g:if test="${(i % 4 == 3) || (speakers.size() - i ==1)}">last</g:if>">
    <img id="speakerImage-${speaker.id}" class="speakerImage" src="${speaker.imageUrl}"/><br/>
    <g:link action="show" id="${speaker.id}">${speaker.name}</g:link>
  </div>

  <g:if test="${(i % 4 == 3) || (speakers.size() - i == 1)}"></div></g:if>
</g:each>
<g:each in="${speakers}" var="speaker">
  <div id="speakerInfo-${speaker.id}" class="speakerInfo span-24 last" style="display:none">
    ${speaker.bio}
  </div>
</g:each>
</body>
</html>