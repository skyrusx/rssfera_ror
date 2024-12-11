$(document).on('turbo:load', function() {
    objectMap();
    listObjectsMap();

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

                let balloonContent = [objectName, objectAddress[0].innerText.trim(), objectPrice].join("<br />")

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

    function listObjectsMap() {
        let mapDiv = $("#map-objects");

        if (mapDiv.length > 0) {
            ymaps.ready(init);

            function init() {
                let objects = $(".tab-pane.active .object");

                var myMap = new ymaps.Map("map-objects", {
                    center: [68.970663, 33.074914],
                    zoom: 10
                }, {
                    searchControlProvider: 'yandex#search'
                });

                $.each(objects, function(index, object) {
                    let lat = $(object).attr("data-latitude");
                    let lon = $(object).attr("data-longitude");

                    let objectName = $(object).find(".card-title a").text();
                    let objectPrice = $(object).find(".card-price").text();
                    let objectAddress = $(object).find(".card-location")[0].innerText.trim();

                    let balloonContent = [objectName, objectAddress, objectPrice].join("<br />")

                    myMap.geoObjects
                        .add(new ymaps.Placemark([lat, lon], {
                            balloonContent: balloonContent,
                            iconCaption: objectName
                        }, {
                            preset: 'islands#circleIcon',
                            iconColor: '#3caa3c'
                        }));
                });
            }
        }
    }
});
