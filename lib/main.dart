import 'package:flutter/material.dart';

import './utils/dependency/dependency_injection.dart' as di;
import 'app/my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    const MyApp(),
  );
}
