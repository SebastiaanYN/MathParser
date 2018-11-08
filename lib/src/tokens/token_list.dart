import '../compile_error.dart';
import 'token.dart';
import 'token_group.dart';

class TokenList {
  final List<Token> tokens = List();

  void add(Token token) {
    tokens.add(token);
  }

  void forEach(void Function(Token token) fn) {
    for (Token token in tokens) {
      fn(token);
    }
  }

  void replace(TokenGroup group) {
    for (int i = 0; i < tokens.length; i++) {
      Token token = tokens[i];

      List<String> values = [token.value];
      bool match = true;
      if (token.name == group.get(0)) {
        for (int j = 1; j < group.length; j++) {
          String name = group.get(j);

          if (i + j >= tokens.length) {
            match = false;
            break;
          }
          Token next = tokens[i + j];

          if (name == next.name) {
            values.add(next.value);
          } else {
            match = false;
            break;
          }
        }
      } else {
        match = false;
      }

      if (match) {
        String parsed = group.parser(values);
        if (parsed == null) {
          throw CompileError('Unexpected token ${values.join('')}');
        }

        tokens[i] = Token(group.name, parsed);
        tokens.removeRange(i + 1, i + group.length);
      }
    }
  }
}
