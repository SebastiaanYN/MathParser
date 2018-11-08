import '../tokens/token_group.dart';
import '../tokens/token_list.dart';

final List<TokenGroup> tokenGroups = [
  TokenGroup(
      'METHOD', 'CHAR OPEN_PARENTHESIS NUM CLOSE_PARENTHESIS', (values) {
        if (values[0] == 'log') {
          return 'Math.log(${values[2]})';
        }
  }),
  TokenGroup('METHOD', 'CHAR NUM OPEN_PARENTHESIS NUM CLOSE_PARENTHESIS',
      (values) {
    if (values[0] == 'log') {
      return '(Math.log(${values[3]}) / Math.log(${values[1]}))';
    }
  }),
  TokenGroup('NUM', 'NUM DOT NUM', (values) {
    return values.join('');
  }),
  TokenGroup('METHOD', 'NUM POW NUM', (values) {
    return 'Math.pow(${values[0]}, ${values[2]})';
  })
];

TokenList parse(TokenList tokens) {
  tokenGroups
    ..sort((a, b) => b.length.compareTo(a.length))
    ..forEach((group) => tokens.replace(group));

  return tokens;
}
