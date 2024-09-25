$(document).on('turbo:load', function() {
    $("#search_district_id").change(function() {
        var optionSelected = $(this).find("option:selected");
        var valueSelected = optionSelected.val();

        $.ajax({
            url: "/rent",
            method: "GET",
            dataType: "json",
            data: {district_id: valueSelected},
            error: function (xhr, status, error) {
                console.error('AJAX Error: ' + status + error);
            },
            success: function(response) {
                var streets = response["streets"];
                $("#search_street_id").empty();
                $("#search_street_id").append('<option value="">Выбрать</option>');
                for (var i = 0; i < streets.length; i++) {
                    $("#search_street_id").append('<option value="' + streets[i]["id"] + '">' + streets[i]["name"] + '</option>');
                }
            }
        });
    });
});
