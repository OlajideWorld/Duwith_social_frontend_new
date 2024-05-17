import 'package:duwith_social/Pages/Auth%20Page/controller/auth_bindings.dart';
import 'package:duwith_social/routes/routes.dart';
import 'package:duwith_social/utils/Size-config.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Ge Storage
  await GetStorage.init();

// Onesignal settings
  OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
  OneSignal.initialize("c4535f03-7e38-4685-b096-ba5302f40d58");
  OneSignal.Notifications.requestPermission(true);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        SizeConfig().init(constraints);
        return GetMaterialApp(
          title: 'Duwith Social',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(useMaterial3: true),
          initialBinding: AuthBindings(),
          initialRoute: Pages.splashscreen,
          getPages: Pages.routes,
        );
      },
    );
  }
}
