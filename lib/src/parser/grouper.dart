import '../tokens/token.dart';
import '../tokens/token_list.dart';

TokenList grouper(TokenList input) {
  TokenList tokens = TokenList();

  String name = '';
  String value = '';

  input.forEach((token) {
    if (name == token.name) {
      value += token.value;
    } else {
      if (name.isNotEmpty) {
        tokens.add(new Token(name, value));
      }

      name = token.name;
      value = token.value;
    }
  });

  if (name.isNotEmpty) {
    tokens.add(new Token(name, value));
  }

  return tokens;
}
