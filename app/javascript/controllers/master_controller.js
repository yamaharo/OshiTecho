import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="master"
export default class extends Controller {
  connect() {
    console.log("master start!!!");
    var tabs = document.querySelectorAll('.tabs');
    M.Tabs.init(tabs);
    console.log("master success!!!");
  }
}
