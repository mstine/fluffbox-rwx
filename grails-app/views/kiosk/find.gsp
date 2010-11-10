<%--
  Created by IntelliJ IDEA.
  User: mstine
  Date: Nov 9, 2010
  Time: 9:26:36 PM
  To change this template use File | Settings | File Templates.
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head><title>Find a Fluffbox</title>
  <meta name="layout" content="main"/>
  <g:javascript library="prototype"/>
  <g:javascript>
    function updateKiosks(transport) {
      map.clearOverlays();

      var kioskList = $('kioskList');
      kioskList.childElements().each(function(oldKiosk) {
        oldKiosk.remove();
      });

      transport.responseJSON.each(function(kiosk) {
        var kioskHtml = '<strong><a class="kioskLink" id="kiosk-link-' + kiosk.id + '">' + kiosk.store.name;

        if (kiosk.inside) {
          kioskHtml += ' (Inside)</a></strong><br/>';
        } else {
          kioskHtml += ' (Outside)</a></strong><br/>';
        }

        kioskHtml += kiosk.address;
        kioskHtml += '<br/>';
        kioskHtml += kiosk.city;
        kioskHtml += ', ';
        kioskHtml += kiosk.state;
        kioskHtml += ' ';
        kioskHtml += kiosk.zipCode;
        kioskHtml += '<br/><br/>'
        kioskHtml += '<a class="kioskLink" href="${createLink(controller:"speakerClone", action:"findByKiosk")}/'+kiosk.id+'">Find Speakers Here</a>';  

        kioskList.insert('<li class="kioskListItem">' + kioskHtml + '</li>')

        geocoder.getLatLng(kiosk.address + ' ' + kiosk.city +
                           ', ' + kiosk.state + ' ' + kiosk.zipCode,
        function(point) {
          var marker = new GMarker(point);

          GEvent.addListener(marker, "click", function() {
            map.openInfoWindowHtml(point, kioskHtml);
          });

          map.addOverlay(marker);

          $('kiosk-link-' + kiosk.id).observe("click", function() {
            map.openInfoWindowHtml(point, kioskHtml);

          });
        });
      });
    }
  </g:javascript>
  <gmap:resources location="Ft. Lauderdale, FL"/>
</head>
<body>
<div class="columns span-24 last">
  <div class="left span-11">
    <h3>Find a Fluffbox</h3>
    <div class="kioskSearch">
      <g:formRemote name="searchKiosksForm" url="[controller: 'kiosk', action: 'search']" onSuccess="updateKiosks(e)">
        <label for="searchCriteria">Location:</label>
        <g:textField id="searchCriteria" name="searchCriteria"/>
        <g:submitButton name="searchButton" value="Search"/>
      </g:formRemote>
    </div>
    <div class="searchResults"><ul id="kioskList"></ul></div>
  </div>
  <div class="right span-13 last">
    <gmap:map width="490px" height="400px"/>
  </div>
</div>
</body>
</html>