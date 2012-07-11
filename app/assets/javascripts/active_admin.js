//= require active_admin/base
//= require tinymce-jquery


$(document).ready(function () {
    load_editors();
});


function load_editors() {
    $('.editor').tinymce({
        relative_urls : true
    });
}