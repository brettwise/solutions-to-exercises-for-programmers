// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in "brunch-config.js".
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from "config.paths.watched".
import "phoenix_html"

// Import local files
//
// Local files can be imported directly using relative
// paths "./socket" or full ones "web/static/js/socket".

// import socket from "./socket"


var calcBillButton = document.getElementById('calc-bill');
calcBillButton.addEventListener('click', calcTotalWithTip, false);


function calcTotalWithTip() {

  var tipPercentage = parseInt(
    document.getElementById('tip-percentage').value
    , 10
  );

  var billAmount = parseFloat(
    document.getElementById('bill-amount').value
  );

  var billTotal = document.getElementById('bill-total').innerHTML;

  var tipAmount = tipPercentage/100 * billAmount;
  var billTotal = tipAmount + billAmount;
  document.getElementById('the-tip').innerHTML = round(tipAmount, 2);
  document.getElementById('bill-total').innerHTML = billTotal.toFixed(2);
}

function round(value, decimals) {
  return Number(Math.round(value+'e'+decimals)+'e-'+decimals);
}
