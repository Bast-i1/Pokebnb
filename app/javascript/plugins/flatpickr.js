import flatpickr from "flatpickr"
import "flatpickr/dist/themes/dark.css" // Note this is important!
import rangePlugin from "flatpickr/dist/plugins/rangePlugin"

const initFlatpickr = () => {
  const bookingForm = document.getElementById('booking-form-div');

  if (bookingForm) {
    const bookings = JSON.parse(bookingForm.dataset.bookings);
    flatpickr("#range_start", {
      plugins: [new rangePlugin({ input: "#range_end"})],
      minDate: "today",
      inline: true,
      dateFormat: "Y-m-d",
      "disable": bookings,
    });
    const startDate = document.getElementById("range_start");
    const endDate = document.getElementById("range_end");

    const dynamicPrice = () => {
      let dateDiffInMilliseconds = new Date(endDate.value) - new Date(startDate.value);
      let nbrOfNights = dateDiffInMilliseconds / 86400000 + 1;
      let price = parseInt(document.getElementById("price").innerText, 10);
      if (!isNaN(nbrOfNights)) {
        document.getElementById("total-price").innerText = nbrOfNights * price;
        document.getElementById("total-nights").innerText = nbrOfNights;
      }
    };

    [startDate, endDate].forEach((item) => {
      item.addEventListener("change", (event) => {
        dynamicPrice();
      })
    })
  }

}
export {initFlatpickr};
