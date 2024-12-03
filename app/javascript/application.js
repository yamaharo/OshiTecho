// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import { Calendar } from '@fullcalendar/core'
import dayGridPlugin from '@fullcalendar/daygrid'

document.addEventListener('DOMContentLoaded', function() {
  const calendarEl = document.getElementById('calendar')
  const calendar = new Calendar(calendarEl, {
    plugins: [dayGridPlugin],
    headerToolbar: {
      left: 'prev,next today',
      center: 'title',
      right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
    }
  })
  calendar.render();

  var dropElems = document.querySelectorAll('.dropdown-trigger');
  var instances = M.Dropdown.init(dropElems);

  var slideElems = document.querySelectorAll('.sidenav');
  var instances = M.Sidenav.init(slideElems,{
    edge: 'right'
  });
})