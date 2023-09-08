window.addEventListener("load", function (event) {
  var accordions = document.querySelectorAll(".x-accordion-item-header");
  for(var i of accordions) {
    i.addEventListener('click', function(e) {
      e.target.closest(".x-accordion-item").classList.toggle('active');
    });
  }
});