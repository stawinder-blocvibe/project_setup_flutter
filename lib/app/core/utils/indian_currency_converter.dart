


class IndianCurrencyConverter {
  static String convertToWords(int number) {
    if (number == 0) return 'Zero';

    final List<String> units = [
      '',
      'One',
      'Two',
      'Three',
      'Four',
      'Five',
      'Six',
      'Seven',
      'Eight',
      'Nine',
      'Ten',
      'Eleven',
      'Twelve',
      'Thirteen',
      'Fourteen',
      'Fifteen',
      'Sixteen',
      'Seventeen',
      'Eighteen',
      'Nineteen'
    ];

    final List<String> tens = [
      '',
      '',
      'Twenty',
      'Thirty',
      'Forty',
      'Fifty',
      'Sixty',
      'Seventy',
      'Eighty',
      'Ninety'
    ];

    String twoDigits(int n) {
      if (n < 20) return units[n];
      return tens[n ~/ 10] + (n % 10 != 0 ? ' ${units[n % 10]}' : '');
    }

    String threeDigits(int n) {
      if (n == 0) return '';
      if (n < 100) return twoDigits(n);
      return '${units[n ~/ 100]} Hundred${n % 100 != 0 ? ' ${twoDigits(n % 100)}' : ''}';
    }

    String inWords(int n) {
      String result = '';

      if (n >= 10000000) {
        result += '${twoDigits(n ~/ 10000000)} Crore ';
        n %= 10000000;
      }

      if (n >= 100000) {
        result += '${twoDigits(n ~/ 100000)} Lakh ';
        n %= 100000;
      }

      if (n >= 1000) {
        result += '${twoDigits(n ~/ 1000)} Thousand ';
        n %= 1000;
      }

      if (n > 0) {
        result += '${threeDigits(n)}';
      }

      return result.trim();
    }

    return inWords(number);
  }
}
