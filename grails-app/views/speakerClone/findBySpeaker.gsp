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
        //alert("hello!");
      map.clearOverlays();

      var kioskList = $('kioskList');
      kioskList.childElements().each(function(oldKiosk) {
        oldKiosk.remove();
      });

      transport.responseJSON.each(function(clone) {
        var kiosk = clone.kiosk;
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
        kioskHtml += '<a class="kioskLink" href="${createLink(controller: "rental", action: "reserve")}/'+clone.id+'">RENT NOW</a>';

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
  <g:javascript>
    document.observe("dom:loaded", function() {
      initialize();
      <g:remoteFunction controller="speakerClone" action="searchBySpeaker" id="${id}" onSuccess="updateKiosks(e)"/>
    });
  </g:javascript>
</head>
<body>
<div class="columns span-24 last">
  <div class="left span-11">
    <h2>Find a Fluffbox</h2>    
    <h3>Selected speaker:</h3>
    <p><strong>${speaker.name}</strong><br/>${speaker.title}</p>
    <div class="searchResults"><ul id="kioskList"></ul></div>
  </div>
  <div class="right span-13 last">
    <gmap:map width="490px" height="400px"/>
  </div>
</div>
</body>
</html>