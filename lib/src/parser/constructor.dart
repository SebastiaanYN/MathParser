import '../tokens/token_list.dart';

String construct(TokenList tokens) {
  String output = '';

  tokens.forEach((token) {
    output += token.value == null ? ' ' : token.value;
  });

  return output;
}
