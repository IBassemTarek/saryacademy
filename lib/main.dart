import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:flutter/services.dart';

//local
import 'models/adminMode.dart';
import 'models/childUID.dart';
import 'models/modalprogrsshub.dart';
import 'services/auth.dart';
import 'wrapper.dart';
import 'models/user.dart';

FlutterLocalNotificationsPlugin notification;
Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    systemNavigationBarColor: Colors.white, // navigation bar color
    statusBarColor: Colors.white, // status bar color
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Locales.init(['ar', 'en']);
  const androidInitlize = AndroidInitializationSettings("ic_launcher");
  const iOSInitlize = IOSInitializationSettings();
  const initilizationsSettings =
      InitializationSettings(android: androidInitlize, iOS: iOSInitlize);
  notification = FlutterLocalNotificationsPlugin();
  notification.initialize(initilizationsSettings,
      onSelectNotification: notificationSelected);
  await Firebase.initializeApp();
  runApp(MyApp());
}

Future notificationSelected(String payload) async {}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle.dark.copyWith(
        statusBarColor: Colors.white,
        statusBarBrightness: Brightness.dark,
      ),
    );
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AdminMode>(
          create: (context) => AdminMode(),
        ),
        ChangeNotifierProvider<ModelHub>(
          create: (context) => ModelHub(),
        ),
        StreamProvider<UserModel>.value(
          value: AuthService().user,
          initialData: null,
        ),
        ChangeNotifierProvider<ChildModel>(
          create: (context) => ChildModel(),
        ),
      ],
      child: Wrapper(),
    );
  }
}
