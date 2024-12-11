$(document).on('turbo:load', function() {
    if ($("#number-rooms").length > 0) {
        let numZero = "";
        let numOne = "";
        let rooms = {"one": "1", "two": "2", "three": "3", "four": "4", "five": "5"}
        let oldNumberRooms = $("#number-rooms").val().split("");

        $(".btn-check").change(function() {
            if($(this).prop('checked')) {
                numOne = $(this)[0].id.split("-")[0];
                oldNumberRooms.push(rooms[numOne].toString());
                $("#number-rooms").val(oldNumberRooms.sort());
            } else {
                numZero = $(this)[0].id.split("-")[0];
                oldNumberRooms = $.grep(oldNumberRooms, function(value) {
                    return value != rooms[numZero].toString();
                });
                $("#number-rooms").val(oldNumberRooms.sort());
            }
        });
    }
});
