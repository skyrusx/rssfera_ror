$(document).on('turbo:load', function() {
    $("#search_city_id").change(function () {
        var optionSelected = $(this).find("option:selected");
        var valueSelected = optionSelected.val();

        $.ajax({
            url: "/rent",
            method: "GET",
            dataType: "json",
            data: {city_id: valueSelected},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function (response) {
                var districts = response["districts"];
                $("#search_district_id").empty();
                $("#search_district_id").append('<option value="">Выбрать</option>');
                for (var i = 0; i < districts.length; i++) {
                    $("#search_district_id").append('<option value="' + districts[i]["id"] + '">' + districts[i]["name"] + '</option>');
                }
            }
        });
    });
});
