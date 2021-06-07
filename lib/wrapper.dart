import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/dateProvider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/adminMode.dart';
import 'models/childUID.dart';
import 'models/profileInfoModels/parentInfoModel.dart';
import 'screens/adminScreens/adminHomePage/adminHomePage.dart';
import 'services/PRM2Database.dart';
import 'services/PRM3Database.dart';
import 'services/adminServices/childName.dart';
import 'services/adminServices/profilesDatabases.dart';
import 'services/galleryDatabase.dart';
import 'services/profileDatabase.dart';
import 'services/toddlerPRDatabase.dart';
import 'const.dart';
import 'models/eventModel.dart';
import 'models/galleryModel.dart';
import 'models/profileInfoModels/absenceModel.dart';
import 'models/profileInfoModels/childInfoModel.dart';
import 'models/profileInfoModels/medicalHistoryModel.dart';
import 'models/profileInfoModels/vaccinationModel.dart';
import 'models/progressReportModel1.dart';
import 'models/progressReportModel2.dart';
import 'models/progressReportModel3.dart';
import 'models/user.dart';
import 'screens/home/home.dart';
import 'screens/signIn/signin.dart';
import 'services/eventsDatabase.dart';



//import 'package:prefirebase/screens/home/home.dart';

class Wrapper extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  void initState()   {
    super.initState();
    getData();
  }

    getData () async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("isAdmin")!=null)
    {
        bool temp = prefs.getBool("isAdmin");
        Provider.of<AdminMode>(context,listen: false).changeIsAdminValue(temp);
    }
    if (prefs.getBool("isAdmin") ==null)
    {
      print("hello");
     Provider.of<AdminMode>(context,listen: false).changeIsAdminValue(false);
    }

  }


  @override
  // ignore: missing_return
  Widget build(BuildContext context) {

    final user = Provider.of<UserModel>(context);
    final isAdmin = Provider.of<AdminMode>(context);
    final childUser = Provider.of<ChildModel>(context);
    print(isAdmin.isAdmin);
    // return home or auth depend on state of auth now
    if ((user == null || isAdmin == null )) {
      return MaterialApp(
        navigatorKey: Wrapper.navigatorKey,
    debugShowCheckedModeBanner: false,
    title: 'Sary Academy',
    theme: textData(),
    home: SignIn());
    } else if (!isAdmin.isAdmin) {
      return MultiProvider(
              providers: [
StreamProvider<List<GalleryModel>>.value(
      value: GalleryDataBaseServices(uid: user.id).galleryCardsData,
       initialData: [], 
       ),

StreamProvider<PRM1model>.value(
      value: ToddlerPRDataBaseServices(uid: user.id).toddlerPRCardData,
       initialData: PRM1model(), 
       ),
StreamProvider<PRM2Mounth1>.value(
      value: PRM2DataBaseServices(uid: user.id).prMounth1sData,
       initialData: PRM2Mounth1(), 
       ),
StreamProvider<PRM2Mounth2>.value(
      value: PRM2DataBaseServices(uid: user.id).prMounth2sData,
       initialData: PRM2Mounth2(), 
       ),
StreamProvider<PRM2Mounth3>.value(
      value: PRM2DataBaseServices(uid: user.id).prMounth3sData,
       initialData: PRM2Mounth3(), 
       ),

StreamProvider<PRM3Listmodel>.value(
      value: PRM3DataBaseServices(uid: user.id).prm3sData,
       initialData: PRM3Listmodel(), 
       ),
StreamProvider<PRM3Mounth1>.value(
      value: PRM3DataBaseServices(uid: user.id).pr3Mounth1sData,
       initialData: PRM3Mounth1(), 
       ),
StreamProvider<PRM3Mounth2>.value(
      value: PRM3DataBaseServices(uid: user.id).pr3Mounth2sData,
       initialData: PRM3Mounth2(), 
       ),
StreamProvider<PRM3Mounth3>.value(
      value: PRM3DataBaseServices(uid: user.id).pr3Mounth3sData,
       initialData: PRM3Mounth3(), 
       ),


StreamProvider<PRM2Listmodel>.value(
      value: PRM2DataBaseServices(uid: user.id).prm2sData,
       initialData: PRM2Listmodel(), 
       ),
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
    else if (isAdmin.isAdmin){
    return MultiProvider(
              providers: [
StreamProvider<List<AbsenceCard>>.value(
      value: ProfileDataBaseServices(uid: childUser.uid).absenceCardsData,
       initialData: [], 
       ),

StreamProvider<List<VaccinationCard>>.value(
      value: ProfileDataBaseServices(uid: childUser.uid).vaccinationCardData,
       initialData: [], 
       ),
StreamProvider<List<MedicalHistoryCard>>.value(
      value: ProfileDataBaseServices(uid: childUser.uid).medicalHistoryCardData,
       initialData: [], 
       ),
StreamProvider<List<EventCard>>.value(
      value: EventDataBaseServices(uid: childUser.uid).eventCardsData,
       initialData: [], 
       ),
StreamProvider<ChildInfoModel>.value(
      value: ProfileDataBaseServices(uid:childUser.uid ).childData,
       initialData: ChildInfoModel(),
       ),
StreamProvider<List<ChildIndex>>.value(
      value: ProfilesIndexBaseServices().kidsIndex,
       initialData: [], 
       ),
StreamProvider<List<GalleryModel>>.value(
      value: GalleryDataBaseServices(uid: childUser.uid).galleryCardsData,
       initialData: [], 
       ),
        ChangeNotifierProvider<DateProvider>(
          create: (context) => DateProvider(),
        ),

        
      ],
      child: MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Sary Academy',
      theme: textData(),
      home: AdminHomePage()),
    );
    }
  }
}