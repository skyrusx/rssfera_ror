$(document).on('turbo:load', function() {
    objectMap();
    listObjectsMap();
    contactsMap();

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

    function contactsMap() {
        let mapDiv = $("#contacts_map");

        if (mapDiv.length > 0) {
            ymaps.ready(init);

            function init() {
                var myMap = new ymaps.Map("contacts_map", {
                    center: [68.965897, 33.091851],
                    zoom: 15,
                    controls: []
                }, {
                    searchControlProvider: 'yandex#search'
                });

                var placemark = new ymaps.Placemark(myMap.getCenter(), {
                    // Зададим содержимое заголовка балуна.
                    balloonContentHeader: '<a href="https://yandex.ru/maps/org/riyeltstroysfera/235177691831/?ll=33.091851%2C68.965897&mode=search&sctx=ZAAAAAgBEAAaKAoSCW2NCMbBi0BAEX2TpkHRPVFAEhIJBI4EGmzqjD8RUn5S7dPxaD8iBgABAgMEBSgKOABAoqYNSAFqAnJ1nQHNzMw9oAEAqAEAvQFNelpRwgEGt5W7jewGggIe0KDQuNC10LvRgtCh0YLRgNC%2B0LnQodGE0LXRgNCwigIAkgIAmgIMZGVza3RvcC1tYXBz&sll=33.091851%2C68.965897&sspn=0.014617%2C0.003152&text=%D0%A0%D0%B8%D0%B5%D0%BB%D1%82%D0%A1%D1%82%D1%80%D0%BE%D0%B9%D0%A1%D1%84%D0%B5%D1%80%D0%B0&z=16.95" style="color:green">РиелтСтройСфера</a><br>' +
                        '<span class="description">Агентство недвижимости</span>',
                    // Зададим содержимое основной части балуна.
                    balloonContentBody: '<br/><b>Информация:</b><br/>' + '<a href="tel:+79537541623" style="color:green">+7 (953) 754-16-23</a><br/>' +
                        '<a hreh="mailto:rssfera@mail.ru" style="color:green">rssfera@mail.ru</a>',
                    // Зададим содержимое нижней части балуна.
                    balloonContentFooter: '<br/><b>График работы</b><br/>' + 'Понедельник - Пятница: 10:00 - 19:00<br/>' +
                        'Суббота: 10:00 - 18:00<br/>' + '<span style="color:red;">Воскресенье: выходной</span>',
                    // Зададим содержимое всплывающей подсказки.
                    hintContent: 'Рога и копыта'
                });
                // Добавим метку на карту.
                myMap.geoObjects.add(placemark);
                // Откроем балун на метке.
                placemark.balloon.open();
            }
        }
    }
});
