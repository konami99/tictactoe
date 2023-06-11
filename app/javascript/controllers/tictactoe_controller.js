import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log(this.element);
  }

  click(e) {
    console.log('click');
    const csrfToken = document.querySelector("[name='csrf-token']").content;
    fetch(`/tictactoeboards/click`, {
      method: 'GET',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
      },
    });
  }
}