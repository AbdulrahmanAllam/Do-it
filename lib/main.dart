import 'package:device_preview/device_preview.dart';
import 'package:do_it_flutter/utils/routes.dart';
import 'package:do_it_flutter/view/mobile/user/log_in_view.dart';
import 'package:flutter/material.dart';

void main() {
  // runApp(DevicePreview(
  //   enabled: true,
  //   builder: (context) => MyApp(), // Wrap your app
  // ),);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // locale: DevicePreview.locale(context), // Add the locale here
      // builder: DevicePreview.appBuilder, //
      initialRoute: LogInView.route,
      routes: routes,
    );
  }
}