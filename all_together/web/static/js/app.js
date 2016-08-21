// Brunch automatically concatenates all files in your
// watched paths. Those paths can be configured at
// config.paths.watched in 'brunch-config.js'.
//
// However, those files will only be executed if
// explicitly imported. The only exception are files
// in vendor, which are never wrapped in imports and
// therefore are always executed.

// Import dependencies
//
// If you no longer want to use a dependency, remember
// to also remove its path from 'config.paths.watched'.
import 'phoenix_html';

// Import local files
//
// Local files can be imported directly using relative
// paths './socket' or full ones 'web/static/js/socket'.

// import socket from './socket'

// Function that accurately rounds floats
function round(value, decimals) {
  return Number(Math.round(value+'e'+decimals)+'e-'+decimals);
}

// Takes an element. Gets the string value from it. Parses it.
function parseElToFloat(theElId) {
  const num = document.getElementById(theElId).value;
  return parseFloat(num);
}

// Will calculate the tip amount and then round it. Pure function.
function calcTip(tipPercentage, billAmount) {
  const tipAmount = (tipPercentage / 100) * billAmount;
  return round(tipAmount, 2);
}

// Calculates total bill w/ tip and rounds the value. Pure function.
function calcTotal(tipAmount, billAmount) {
  const billTotal = tipAmount + billAmount;
  return round(billTotal, 2);
}

// Rounds numbers and updates the DOM.
function updateDOM() {
  // Gets the string values from the DOM and parses them to numbers.
  const tipPercentage = parseElToFloat('tip-percentage');
  const billAmount = parseElToFloat('bill-amount');

  // Gets the result elements to get ready to update them.
  const tipEl = document.getElementById('the-tip');
  const totalEl = document.getElementById('bill-total');

  const tipAmount = calcTip(tipPercentage, billAmount);

  tipEl.innerHTML = tipAmount;
  totalEl.innerHTML = calcTotal(tipAmount, billAmount);
}

// Gets the 'calculate bill' button and adds an event lister to it.
document.getElementById('calc-bill').addEventListener('click', updateDOM, false);
