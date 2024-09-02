$(document).on('turbo:load', function() {
    $('*[placeholder="+7 (999) 999-99-99"]').inputmask({"mask": "+7 (999) 999-99-99"});
    $('*[placeholder="example@rssfera.ru"]').inputmask("email");
    $(".time").inputmask({alias: "datetime", inputFormat: "HH:MM"});
});
