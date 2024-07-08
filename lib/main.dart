import 'package:flutter/material.dart';
import 'package:pleng/group/pleng_app.dart';
import 'package:pleng/provider/theme_notifier.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => ThemeNotifier(),
      child: PlengApp(),
    ),
  );
}

