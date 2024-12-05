// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

document.addEventListener("turbo:load", () => {
  console.log("application.js start!!!");
  var dropElems = document.querySelectorAll('.dropdown-trigger');
  var dropdownInstances = M.Dropdown.init(dropElems);
  console.log("application.js success!!!");
});
