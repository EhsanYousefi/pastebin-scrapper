$(function () {
    setNavigation();
});

function setNavigation() {
    var path = window.location.pathname;
    path = path.replace(/\/$/, "");
    path = decodeURIComponent(path);

    $("a").each(function () {
        if (location.href === this.href) {
            $(this).closest('li').addClass('active');
            $(this).addClass('active');
        }
    });
}

