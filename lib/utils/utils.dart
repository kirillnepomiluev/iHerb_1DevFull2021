List<String> textToSearchTerms(String text) {
  return text.trim().toLowerCase().split(RegExp(r'\s+'));
}
