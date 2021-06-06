import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/adminMode.dart';
import 'models/childUID.dart';
import 'models/modalprogrsshub.dart';
import 'services/auth.dart';
import 'wrapper.dart';
import 'models/user.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
