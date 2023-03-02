import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"
import rangePlugin from "flatpickr/dist/plugins/rangePlugin";

export default class extends Controller {

  static targets = [ 'startDateInput', 'endDateInput', 'priceHolder']
  static values = { price: Number }
  static values = { dates: Object }

  connect() {
    this.#initFlatPickr()
  }

  #initFlatPickr() {
    flatpickr(this.startDateInputTarget, this.#options());
  }

  #options() {
    return {
      ...this.#parsedBookedDates(),
      mode: 'range',
      inline: true,
      // enableTime: true,
      minDate: new Date(),
      "plugins": [new rangePlugin({ input: this.endDateInputTarget})]
    }
  }

  #parsedBookedDates() {
    return this.datesValue
  }
}
