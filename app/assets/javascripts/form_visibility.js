document.addEventListener("DOMContentLoaded", function() {
    var deleteLinks = document.getElementsByName('deleteCommentLink');

    if (deleteLinks.length > 0) {
        deleteLinks.forEach(function(link) {
            link.closest('div').previousSibling.parentElement.previousElementSibling.classList.toggle("not-visible");
        });
    }
});
