function closeAllCollapsibles() {
    let collapsibles = document.querySelectorAll('.collapse');
    collapsibles.forEach(function(collapse) {
        let bsCollapse = new bootstrap.Collapse(collapse, {
            toggle: false
        });
        bsCollapse.hide();
    });
}

document.getElementById('menu-btn').addEventListener('click', function() {
    const menu = document.getElementById('menu');
    menu.classList.add('show');
});

document.getElementById('close-btn').addEventListener('click', function() {
    const menu = document.getElementById('menu');
    menu.classList.remove('show');
    closeAllCollapsibles();
});

document.addEventListener('click', function(event) {
    const menu = document.getElementById('menu');
    const menuButton = document.getElementById('menu-btn');
    if (menu.classList.contains('show') &&
        !menu.contains(event.target) &&
        !menuButton.contains(event.target)) {
        menu.classList.remove('show');
        closeAllCollapsibles();
    }
});