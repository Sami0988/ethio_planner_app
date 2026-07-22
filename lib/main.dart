import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'app.dart';
import 'core/providers/observers.dart';

void main() {
  runApp(
    ProviderScope(
      observers: [AppObserver()],
      child: const App(),
    ),
  );
}
