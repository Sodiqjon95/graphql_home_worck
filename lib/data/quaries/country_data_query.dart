

const getCountryData = r'''
query Query($code:ID!) {
  country(code: $code) {
    name
    native
    capital
    emoji
    currency
   }
}

''';
