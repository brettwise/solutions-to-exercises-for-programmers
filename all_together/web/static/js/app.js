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

document.addEventListener("DOMContentLoaded", function(event) {
  // Function that accurately rounds floats
  function round(value, decimals) {
    return Number(Math.round(value+'e'+decimals)+'e-'+decimals);
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

  function validateInputVal(tipEl, tipErrorEl, billEl, billErrorEl) {
    // Get value from element.
    const tipVal = parseFloat(tipEl.value);
    const billVal = parseFloat(billEl.value);
    if (!isNaN(tipVal) && !isNaN(billVal)) {
      const theHideErrorClass = 'textfield__error-message--hidden';
      // Hides error messages if they were there.
      tipErrorEl.className = theHideErrorClass;
      billErrorEl.className = theHideErrorClass;
      // Gets the result elements to get ready to update them.
      const tipAmountEl = document.getElementById('the-tip');
      const totalEl = document.getElementById('bill-total');
      const tipAmount = calcTip(tipVal, billVal);
      // Update result elements.
      tipAmountEl.innerHTML = tipAmount;
      totalEl.innerHTML = calcTotal(tipAmount, billVal);
    } else {
      const theShowErrorClass = 'textfield__error-message--show';
      tipErrorEl.className = theShowErrorClass;
      billErrorEl.className = theShowErrorClass;
      return false;
    }
  }

  // Rounds numbers and updates the DOM.
  function calcInputs() {
    const tipEl = document.getElementById('tip-percentage');
    const tipErrorEl = document.getElementById('tip-percentage-error');
    const billEl = document.getElementById('bill-amount');
    const billErrorEl = document.getElementById('bill-amount-error');
    validateInputVal(tipEl, tipErrorEl, billEl, billErrorEl);
  }

  // Gets the 'calculate bill' button and adds an event lister to it.
  var calcBillButton = document.getElementById('calc-bill');
  if(calcBillButton) {
    calcBillButton.addEventListener('click', calcInputs, false);
  }


  // Checks for the enter key on the event passed in by the event listener then prints a string to the inner HTML of an element.
  function updateDOM(event, outputId, strToPrint) {
    const output = document.getElementById(outputId);
    output.innerHTML = strToPrint;
    event.preventDefault();
  }

  if (document.getElementById('name') != null) {
    const nameInput = document.getElementById('name');
    nameInput.addEventListener('keyup', function(event) {
      const str = `Hi there, ${nameInput.value}. Happy you're using this input.`;
      updateDOM(event, 'output', str);
    }, false);
  }

  if (document.getElementById('characters') != null) {
    const charInput = document.getElementById('characters');
    charInput.addEventListener('keyup', function(event) {
      const str = `You typed ${charInput.value.length} characters.`;
      updateDOM(event, 'the-count', str);
    }, false);
  }

});
