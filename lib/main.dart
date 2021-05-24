import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/provider/modalprogrsshub.dart';
import 'package:saryacademy/services/auth.dart';
import 'package:saryacademy/wrapper.dart';
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
ChangeNotifierProvider<ModelHub>(
        create: (context)=>ModelHub(),),
StreamProvider<UserModel>.value(
      value: AuthService().user,
       initialData: null, 
       ),  
      ],
          child: Wrapper(),
    );
  }
}

