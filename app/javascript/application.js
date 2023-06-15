// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

window.Turbo.StreamActions.reload = function() {
  location.reload(true);
}

