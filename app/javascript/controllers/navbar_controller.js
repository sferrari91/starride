import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="navbar"
export default class extends Controller {
  connect() {
    console.log("Hello from controller")
  }

  updateNavbar() {
    if (window.scrollY >= 50) {
      this.element.classList.add("navbar-lewagon-grey")
    } else {
      this.element.classList.remove("navbar-lewagon-grey")
    }
  }
}
