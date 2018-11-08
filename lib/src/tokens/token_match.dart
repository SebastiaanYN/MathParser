class TokenMatch {
  final String name;
  final match;

  TokenMatch(this.name, this.match);

  bool matches(String char) {
    if (match is RegExp) {
      return (match as RegExp).hasMatch(char);
    } else {
      return match == char;
    }
  }
}
