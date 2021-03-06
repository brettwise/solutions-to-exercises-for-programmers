function calcTotalWithTip() {

  var tipPercentage = parseInt(
    document.getElementById('tip-percentage').value
  );

  var billAmount = parseFloat(
    document.getElementById('bill-amount').value
  );

  var billTotal = document.getElementById('bill-total').innerHTML;

  var tipAmount = tipPercentage/100 * billAmount;
  var billTotal = tipAmount + billAmount;

  document.getElementById('bill-total').innerHTML = billTotal.toFixed(2);
}

var calcBillButton = document.getElementById('calc-bill');
calcBillButton.addEventListener('click', calcTotalWithTip, false);
