import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    console.log(this.element);
  }

  click(e) {
    console.log('click');
    const csrfToken = document.querySelector("[name='csrf-token']").content;
    fetch(`/tictactoeboards/click`, {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken,
      },
      body: JSON.stringify({ cell: e.target.id }) 
    });
  }

  reset(e) {
    console.log('reset');
    const csrfToken = document.querySelector("[name='csrf-token']").content;
    fetch(`/tictactoeboards/reset`, {
      method: 'POST',
      mode: 'cors',
      cache: 'no-cache',
      credentials: 'same-origin',
      headers: {
        'Content-Type': 'application/json',
        'X-CSRF-Token': csrfToken,
      }
    })
    .then (response => response.text())
    .then(html => Turbo.renderStreamMessage(html));
  }
}