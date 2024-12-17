import { Controller } from "@hotwired/stimulus"
import { Calendar } from '@fullcalendar/core'
import { Calendar } from '@fullcalendar/core/locales/ja'
import dayGridPlugin from '@fullcalendar/daygrid'

// Connects to data-controller="main"
export default class extends Controller {
  connect() {
    console.log("main start!!!");
    const calendarEl = document.getElementById('calendar')
    const calendar = new Calendar(calendarEl, {
      plugins: [dayGridPlugin],
      locale: "jp",
      headerToolbar: {
        left: 'prev,next today',
        center: 'title',
        right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
      }
    })
    calendar.render();

    var slideElems = document.querySelectorAll('.sidenav');
    M.Sidenav.init(slideElems,{
      edge: 'right'
    });
    console.log("main success!!!");
  }
}
