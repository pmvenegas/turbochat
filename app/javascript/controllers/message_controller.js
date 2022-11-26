import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["info", "controls"]

  show_controls() {
    this.infoTarget.classList.add("d-none");
    this.controlsTarget.classList.remove("d-none");
  }

  hide_controls() {
    this.infoTarget.classList.remove("d-none");
    this.controlsTarget.classList.add("d-none");
  }
}
