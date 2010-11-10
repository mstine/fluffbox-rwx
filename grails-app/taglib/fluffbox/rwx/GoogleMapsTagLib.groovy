package fluffbox.rwx

class GoogleMapsTagLib {
  static namespace = "gmap"
  def grailsApplication

  def resources = {attrs, body ->

    out << """
<script src="http://maps.google.com/maps?file=api&amp;v=2&amp;key=${grailsApplication.config.gmap.apiKey}&sensor=false"
          type="text/javascript"></script>
<script type="text/javascript">

    var geocoder = new GClientGeocoder();
    var map;

    function initialize() {
      if (GBrowserIsCompatible()) {
        map = new GMap2(document.getElementById("map_canvas"));
        map.addControl(new GSmallZoomControl3D());

        var address = '${attrs.location}';

        geocoder.getLatLng(address, function(point) {
          map.setCenter(point, 11);

          //var marker = new GMarker(point);
          //map.addOverlay(marker);
        });
      }
    }

    window.onload = initialize;
    window.unload = GUnload();
</script>
"""
  }

  def map = { attrs, body ->
    out << """
  <div id="map_canvas" style="width:${attrs.width}; height:${attrs.height}"></div>

"""
  }
}
