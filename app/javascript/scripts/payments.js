$(document).on('turbo:load', function() {
    $("#calculate-payments").click(function() {
        var square = ""
        var price = ""
        var formatedPrice = ""
        var priceWithSymbol = ""
        var result = ""
        var payment = 0.0

        square = $("#realty_total_area")[0].value
        price = $("input.price-item")[0].value
        // payment = (parseFloat(price) / parseFloat(square)).toFixed(2)
        payment = Math.round(parseFloat(price) / parseFloat(square))
        formatedPrice = new Intl.NumberFormat('ru-RU').format(payment)
        priceWithSymbol = [formatedPrice, "₽"].join(" ")
        result = [priceWithSymbol, "м²"].join(" / ")

        $("#realty_payments").val(result);
    });
});
