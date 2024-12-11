$(document).on('turbo:load', function() {
    objectMap();

    function objectMap() {
        let mapDiv = $("#object_map");

        if (mapDiv.length > 0) {
            ymaps.ready(init);

            function init() {
                let objectAddress = $(".object-address");
                let lat = objectAddress.attr("data-latitude");
                let lon = objectAddress.attr("data-longitude");
                let geoData = [lat, lon];

                let objectName = $(".main-left h3").text();
                let objectPrice = $(".main-right h3").text();

                let balloonContent = [objectName, objectAddress[0].innerText, objectPrice].join("<br />")

                var myMap = new ymaps.Map("object_map", {
                    center: geoData,
                    zoom: 16
                }, {
                    searchControlProvider: 'yandex#search'
                });

                myMap.geoObjects
                    .add(new ymaps.Placemark(geoData, {
                        balloonContent: balloonContent,
                        iconCaption: objectName
                    }, {
                        preset: 'islands#circleIcon',
                        iconColor: '#3caa3c'
                    }));
            }
        }
    }
});
