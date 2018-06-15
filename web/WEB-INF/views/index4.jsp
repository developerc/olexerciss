<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Create new content</title>
    <link rel="stylesheet" href="https://openlayers.org/en/v4.6.5/css/ol.css" type="text/css">
    <!-- The line below is only needed for old environments like Internet Explorer and Android 4.x -->
    <script src="https://cdn.polyfill.io/v2/polyfill.min.js?features=requestAnimationFrame,Element.prototype.classList,URL"></script>
    <script src="https://openlayers.org/en/v4.6.5/build/ol.js"></script>
</head>
<body>
<div id="map" class="map">
    <div id="popup"></div>
</div>
<form class="form-inline">
    <label>Geometry type &nbsp;</label>
    <select id="type">
        <option value="Point">Point</option>
        <option value="LineString">LineString</option>
        <option value="Polygon">Polygon</option>
        <option value="Circle">Circle</option>
    </select>
</form>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script>
    var nextid = 1;

    var raster = new ol.layer.Tile({
        source: new ol.source.OSM()
    });

    var source = new ol.source.Vector();

    var vector = new ol.layer.Vector({
        id: 'vector',
        source: source,
        style: new ol.style.Style({
            fill: new ol.style.Fill({
                color: 'rgba(255, 255, 255, 0.2)'
            }),
            stroke: new ol.style.Stroke({
                color: '#ffcc33',
                width: 2
            }),
            image: new ol.style.Circle({
                radius: 7,
                fill: new ol.style.Fill({
                    color: '#ffcc33'
                })
            })
        })
    });

    var map = new ol.Map({
        layers: [raster, vector],
        target: 'map',
        view: new ol.View({
            center: [-11000000, 4600000],
            zoom: 4
        })
    });

    var modify = new ol.interaction.Modify({source: source});
    map.addInteraction(modify);

    var typeSelect = document.getElementById('type');

    var draw; // global so we can remove it later
    function addInteraction() {
        draw = new ol.interaction.Draw({
            source: source,
            type: typeSelect.value
        });
        map.addInteraction(draw);

        modify.on('modifyend',
            function (evt) {
                // console.log(evt.feature);
                var parser = new ol.format.GeoJSON();
                var features = source.getFeatures();
                var featuresGeoJSON = parser.writeFeatures(features);
                /*$.ajax({
                    url: '/features.geojson',
                    type: 'POST',
                    data: featuresGeoJSON
                }).then(function(response) {
                    console.log(response);
                });*/
                console.log('modifyend:');
                console.log(featuresGeoJSON);
            }, this);

        draw.on('drawend',
            function(evt) {
                evt.feature.setProperties({
                    'id' : nextid
                });
                nextid++;
                // console.log(evt.feature);
                var parser = new ol.format.GeoJSON();
                var features = source.getFeatures();
                var featuresGeoJSON = parser.writeFeatures(features);
                console.log('drawend:');
                console.log(featuresGeoJSON);
                console.log(evt.feature.getGeometry().getCoordinates(), evt.feature.getProperties());
                /*$.ajax({
                    url: '/features.geojson',
                    type: 'POST',
                    data: featuresGeoJSON
                }).then(function(response) {
                    console.log(response);
                });*/
            },
            this);
    }

    typeSelect.onchange = function(e) {
        map.removeInteraction(draw);
        addInteraction();
    };

    addInteraction();

</script>

</body>
</html>
