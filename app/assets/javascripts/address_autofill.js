$(function() {
  return $('#store_postal_code').jpostal({
    postcode: ['#store_postal_code'],
    address: {
      '#store_prefecture_code': '%3',
      '#store_address_city': '%4',
      '#store_address_street': '%5%6%7',
    },
  });
});