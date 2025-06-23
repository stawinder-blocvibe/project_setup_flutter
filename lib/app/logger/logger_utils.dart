  


import 'dart:developer';

class LoggerX {
  static void write(String text, {bool isError = false}) {
    Future.microtask(() => isError ? log(text) : log(text));
  }
}
