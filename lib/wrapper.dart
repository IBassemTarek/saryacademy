import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/profileInfoModels/parentInfoModel.dart';
import 'package:saryacademy/services/profileDatabase.dart';
import 'const.dart';
import 'models/eventModel.dart';
import 'models/profileInfoModels/absenceModel.dart';
import 'models/profileInfoModels/childInfoModel.dart';
import 'models/profileInfoModels/medicalHistoryModel.dart';
import 'models/profileInfoModels/vaccinationModel.dart';
import 'models/user.dart';
import 'screens/home/home.dart';
import 'screens/signIn/signin.dart';
import 'services/eventsDatabase.dart';



//import 'package:prefirebase/screens/home/home.dart';

class Wrapper extends StatelessWidget {
  static final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UserModel>(context);
    // return home or auth depend on state of auth now
    if (user == null) {
      return MaterialApp(
        navigatorKey: navigatorKey,
    debugShowCheckedModeBanner: false,
    title: 'Sary Academy',
    theme: textData(),
    home: SignIn());
    } else {
      return MultiProvider(
              providers: [
StreamProvider<List<EventCard>>.value(
      value: EventDataBaseServices(uid: user.id).eventCardsData,
       initialData: [], 
       ),

StreamProvider<List<AbsenceCard>>.value(
      value: ProfileDataBaseServices(uid: user.id).absenceCardsData,
       initialData: [], 
       ),

StreamProvider<List<VaccinationCard>>.value(
      value: ProfileDataBaseServices(uid: user.id).vaccinationCardData,
       initialData: [], 
       ),

StreamProvider<ChildInfoModel>.value(
      value: ProfileDataBaseServices(uid: user.id).childData,
       initialData: ChildInfoModel(),
       ),

StreamProvider<List<MedicalHistoryCard>>.value(
      value: ProfileDataBaseServices(uid: user.id).medicalHistoryCardData,
       initialData: [], 
       ),


StreamProvider<ParentInfoModel>.value(
      value: ProfileDataBaseServices(uid: user.id).parentData,
       initialData: ParentInfoModel(),
       ),
      ],
        child: MaterialApp(
              debugShowCheckedModeBanner: false,
    title: 'Sary Academy',
    theme: textData(),
    home: HomePage())
        );
    }
  }
}