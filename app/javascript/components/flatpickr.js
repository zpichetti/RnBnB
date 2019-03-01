import flatpickr from "flatpickr";

const initflatpickr = () => {

  const startDateInput = document.getElementById('booking_start');
  const endDateInput = document.getElementById('booking_end');
  const dates_disable = JSON.parse(document.getElementById('dates').dataset.list);
  startDateInput.style.visibility = "hidden";
  endDateInput.style.visibility = "hidden";

  if ((startDateInput != null) && (endDateInput != null)) {
    flatpickr(startDateInput, {
      minDate: 'today',
      dateFormat: 'Y-m-d',
      inline: true,
      disable: dates_disable,
    });

    flatpickr(endDateInput, {
      minDate: 'today',
      dateFormat: 'Y-m-d',
      inline: true,
      disable: dates_disable,
    });
  }
};

export { initflatpickr };