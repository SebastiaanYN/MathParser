import '../lib/src/parser/constructor.dart';
import '../lib/src/parser/grouper.dart';
import '../lib/src/parser/parser.dart';
import '../lib/src/parser/tokenizer.dart';
import '../lib/src/tokens/token.dart';
import '../lib/src/tokens/token_list.dart';

void printOutput(Token token) {
  print('${token.name}${token.value == null ? '' : ' ${token.value}'}');
}

void main() {
  TokenList tokens = tokenize('log10(100) + 2^3');
  tokens.forEach(printOutput);

  print('');

  TokenList grouped = grouper(tokens);
  grouped.forEach(printOutput);

  print('');

  TokenList parsed = parse(grouped);
  parsed.forEach(printOutput);

  print('');

  String output = construct(parsed);
  print(output);
}
