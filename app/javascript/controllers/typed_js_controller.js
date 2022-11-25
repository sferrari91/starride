import { Controller } from "@hotwired/stimulus"
import Typed from "typed.js"

// Connects to data-controller="typed-js"
export default class extends Controller {
  connect() {
    console.log(this.element)
    new Typed(this.element, {
      strings: ["Type a spaceship's name"],
      typeSpeed: 50,
      loop: true
    })
  }
}
