String removeCountryCode(String fullPhoneNumber, String dialCode) {
  return fullPhoneNumber.replaceFirst(dialCode, '');
}
String cleanPhone(String phoneNumber) {
  String formattedPhoneNumber = phoneNumber.replaceAll("[ +]", "");
  return formattedPhoneNumber;
}
