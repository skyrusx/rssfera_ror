$(document).on('turbo:load', function() {
    $(".upload-image").on("change", function() {
        displaySelectedImage(event, 'selected-image');
    });

    $(".upload-images").on("change", function() {
        displaySelectedImages(event, 'selected-image');
    });

    function displaySelectedImages(event, elementClass) {
        const selectedImages = document.getElementsByClassName(elementClass);
        const fileInput = event.target;

        if (selectedImages.length == 0) {
            $.each(fileInput.files, function(index, file) {
                var image = window.URL.createObjectURL(file);
                $(".list-images").append(`<div class="img-thumbnail-${index} img-thumbnail">`)
                $(".img-thumbnail-" + index).empty().append(`<img class="selected-image" src="${image}">`);
            });
        } else {
            $.each(fileInput.files, function(key, file) {
                var image = window.URL.createObjectURL(file);
                var index = selectedImages.length + key
                $(".list-images").append(`<div class="img-thumbnail-${index} img-thumbnail">`)
                $(".img-thumbnail-" + index).empty().append(`<img class="selected-image" src="${image}">`);
            });
        }
    }

    function displaySelectedImage(event, elementId) {
        const selectedImage = document.getElementById(elementId);
        const fileInput = event.target;

        if (fileInput.files && fileInput.files[0]) {
            const reader = new FileReader();

            reader.onload = function(e) {
                selectedImage.src = e.target.result;
                selectedImage.classList.remove("preview")
            };

            reader.readAsDataURL(fileInput.files[0]);
        }
    }
});
