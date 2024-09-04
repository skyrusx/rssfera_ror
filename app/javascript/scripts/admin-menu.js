$(document).on('turbo:load', function() {
    let currentHref = window.location.pathname;
    let activeMenuId = "#" + $('a[href="'+ currentHref +'"]').closest('div').attr('id');
    $(activeMenuId).addClass("show");
});
