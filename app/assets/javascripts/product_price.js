$(function () {
  $('#price_form').on('keyup', function () {
    var input = $('#price_form').val();
    var salesFee = Math.floor(input / 10);
    var salesProfit = (input - salesFee);
    if (input >= 300) {
      $('#sales_fee').text('¥' + salesFee);
      $('#sales_profit').text('¥' + salesProfit);
    } else {
      $('#sales_fee').text('-');
      $('#sales_profit').text('-');
    }
  });
});
