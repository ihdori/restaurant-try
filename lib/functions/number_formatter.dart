String formatNumber(int number) {
  // Convert the number to a string
  String numberString = number.toString();

  // Initialize an empty string to store the formatted number
  String formattedNumber = '';

  // Add commas to the number
  int count = 0;
  for (int i = numberString.length - 1; i >= 0; i--) {
    formattedNumber = numberString[i] + formattedNumber;
    count++;
    if (count % 3 == 0 && i != 0) {
      formattedNumber = ',$formattedNumber';
    }
  }

  return formattedNumber;
}