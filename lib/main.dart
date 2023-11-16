import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'src/app/app.locator.dart';
import 'src/helpers/setup/setup_dialog.dart';
import 'src/injector/injector.dart';
import 'src/my_app.dart';

Future<void> main() async {
  try {
    WidgetsFlutterBinding.ensureInitialized();
    initializeDateFormatting();
    await setupInjector();
    setupLocator();
    setupDialog();
    runApp(const MyApp());
  } catch (error) {
    print('$error');
  }
}
