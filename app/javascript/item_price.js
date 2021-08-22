function price() {
  const priceInput = document.getElementById("item-price");
  priceInput.addEventListener("input", ()=> {
    const inputValue = priceInput.value;

    const addTaxDom = document.getElementById("add-tax-price")
    const Fee = 0.1;
    const priceFee = inputValue*Fee;
    const priceAfterFee = Math.round(priceFee);
    addTaxDom.innerHTML = `${priceAfterFee}`;

    const addProfit = document.getElementById("profit");
    const addAfterProfit = inputValue-priceAfterFee;
    addProfit.innerHTML = `${addAfterProfit}`
  });
}
window.addEventListener('load', price)