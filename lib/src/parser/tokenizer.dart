import '../compile_error.dart';
import '../tokens/token.dart';
import '../tokens/token_list.dart';
import '../tokens/token_match.dart';

final List<TokenMatch> tokenMatches = [
  TokenMatch('CHAR', RegExp('[a-zA-Z]')),
  TokenMatch('NUM', RegExp('[0-9]')),
  TokenMatch('OPERATOR', RegExp(r'[+\-*\/%]')),
  TokenMatch('OPEN_PARENTHESIS', '('),
  TokenMatch('CLOSE_PARENTHESIS', ')'),
  TokenMatch('DOT', '.'),
  TokenMatch('SPACE', ' '),
  TokenMatch('POW', '^')
];

TokenList tokenize(String input) {
  TokenList tokens = TokenList();

  for (int i = 0; i < input.length; i++) {
    String char = input[i];
    bool valid = false;

    for (TokenMatch tokenMatch in tokenMatches) {
      if (tokenMatch.matches(char)) {
        tokens.add(Token(tokenMatch.name, char));
        valid = true;
        break;
      }
    }

    if (!valid) {
      throw CompileError("Unexpected token '$char' at index $i");
    }
  }

  return tokens;
}
