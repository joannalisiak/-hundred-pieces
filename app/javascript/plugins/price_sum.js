const initPriceSum = () => {
  const priceSumElement = document.getElementById('price-sum');
  const price = priceSumElement.dataset.price;
  const startDateElement = document.getElementById('booking_start_date');
  const endDateElement = document.getElementById('booking_end_date');

  startDateElement.addEventListener('input', updatePrice);
  endDateElement.addEventListener('input', updatePrice);
  function updatePrice(event) {
    let date1 = new Date(startDateElement.value);
    let date2 = new Date(endDateElement.value);
    let diffTime = Math.abs(date2 - date1);
    let diffDays = Math.ceil(diffTime / (1000 * 60 * 60 * 24));
    let kaas = (diffDays) * price
    priceSumElement.innerHTML = "Total: €" + kaas

  }
}

export { initPriceSum };
