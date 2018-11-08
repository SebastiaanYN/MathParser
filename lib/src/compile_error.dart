class CompileError extends Error {
  final String message;

  CompileError([this.message]);

  @override
  String toString() {
    if (message == null) {
      return 'An error occurred while compiling the code';
    } else {
      return message;
    }
  }
}
