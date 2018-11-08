class TokenGroup {
  final String name;
  final List<String> tokens;
  final String Function(List<String>) parser;

  TokenGroup(this.name, String tokens, this.parser) : this.tokens = tokens.split(' ');

  String get(int index) {
    return tokens[index];
  }

  int get length => tokens.length;
}
