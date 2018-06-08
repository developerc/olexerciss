<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>OpenLayers Overlays</title>
    <link rel="stylesheet" href="https://openlayers.org/en/v4.6.5/css/ol.css" type="text/css">
    <!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
    <script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
    <script src="https://openlayers.org/en/v4.6.5/build/ol.js"></script>
</head>
<body>
<div id="map" class="map"></div>
<div id="overlay" style="background-color: white; border-radius: 10px; border: 1px solid black; padding: 5px 10px;"></div>
<script>

    var layer = new ol.layer.Tile({
        source: new ol.source.OSM()
    });

    var center = ol.proj.transform([-1.812, 52.443], 'EPSG:4326', 'EPSG:3857');

    var overlay = new ol.Overlay({
        element: document.getElementById('overlay'),
        positioning: 'bottom-center'
    });

    var view = new ol.View({
        center: center,
        zoom: 6
    });

    var map = new ol.Map({
        target: 'map',
        layers: [layer],
        view: view
    });

    // register an event handler for the click event
    map.on('click', function(event) {
        // extract the spatial coordinate of the click event in map projection units
        var coord = event.coordinate;
        // transform it to decimal degrees
        var degrees = ol.proj.transform(coord, 'EPSG:3857', 'EPSG:4326');
        // format a human readable version
        var hdms = ol.coordinate.toStringHDMS(degrees);
        // update the overlay element's content
        var element = overlay.getElement();
        element.innerHTML = hdms;
        // position the element (using the coordinate in the map's projection)
        overlay.setPosition(coord);
        // and add it to the map
        map.addOverlay(overlay);
    });
</script>
</body>
</html>
