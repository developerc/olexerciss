<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Draw and Modify Features</title>
    <link rel="stylesheet" href="https://openlayers.org/en/v4.6.5/css/ol.css" type="text/css">
    <!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
    <script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
    <script src="https://openlayers.org/en/v4.6.5/build/ol.js"></script>
</head>
<body>
<div id="map" class="map"></div>
<script>
    var osmLayer = new ol.layer.Tile({
        source: new ol.source.OSM()
    });
    var birmingham = ol.proj.transform([-1.81185, 52.44314],
        'EPSG:4326', 'EPSG:3857');
    var view = new ol.View({
        center: birmingham,
        zoom: 6
    });
    var map = new ol.Map({
        target: 'map'
    });
    map.addLayer(osmLayer);
    map.setView(view);
</script>
</body>
</html>
