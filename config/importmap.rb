# Pin npm packages by running ./bin/importmap

# pin "fullcalendar", to: "https://cdn.jsdelivr.net/npm/fullcalendar@6.1.15/index.global.min.js" # @6.1.15
pin "application"
pin "@hotwired/turbo-rails", to: "turbo.min.js"
pin "@hotwired/stimulus", to: "stimulus.min.js"
pin "@hotwired/stimulus-loading", to: "stimulus-loading.js"
pin_all_from "app/javascript/controllers", under: "controllers"
pin "@fullcalendar/core", to: "https://cdn.skypack.dev/@fullcalendar/core@6.1.15"
pin "@fullcalendar/daygrid", to: "https://cdn.skypack.dev/@fullcalendar/daygrid@6.1.15"
