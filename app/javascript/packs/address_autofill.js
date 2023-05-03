$(function() {
  // $(document).on('turbolinks:load', () => {
    $('#store_postal_code').jpostal({
      postcode : [
        '#store_postal_code'
      ],
      address: {
        "#store_prefecture_code"        : "%3",
        "#store_address_city"           : "%4%5",
        "#store_address_street"         : "%6%7"
      }
    });
  // });
});
// turbolinksをコメントアウトしないと、自動入力の動作しない