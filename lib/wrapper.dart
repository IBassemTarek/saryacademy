import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/progressReportModel4.dart';
import 'package:saryacademy/services/PRM4Database.dart';

import '../../../models/dateProvider.dart';
import '../../../services/adminServices/adminAlertDatbase.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'models/EditEvent.dart';
import 'models/adminMode.dart';
import 'models/alertModel.dart';
import 'models/changeReportType.dart';
import 'models/childUID.dart';
import 'models/isEmpty.dart';
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

class Wrapper extends StatefulWidget {
  static final GlobalKey<NavigatorState> navigatorKey =
      new GlobalKey<NavigatorState>();

  @override
  _WrapperState createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  Future myFuture;
  @override
  void initState() {
    super.initState();
    myFuture = getData();
  }

  Future<bool> getData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.getBool("isAdmin") != null) {
      bool temp = prefs.getBool("isAdmin");
      return Provider.of<AdminMode>(context, listen: false)
          .changeIsAdminValue(admin: temp);
    } else {
      return Provider.of<AdminMode>(context, listen: false)
          .changeIsAdminValue(admin: false);
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
    return FutureBuilder(
      future: myFuture,
      // ignore: missing_return
      builder: (_, __) {
        if ((user == null || isAdmin == null)) {
          return MaterialApp(
              navigatorKey: Wrapper.navigatorKey,
              debugShowCheckedModeBanner: false,
              title: 'Sary Academy',
              theme: textData(),
              home: SignIn());
        } else if (!isAdmin.isAdmin) {
          return MultiProvider(
              providers: [
                ChangeNotifierProvider<IsEmptyModel>(
                  create: (context) => IsEmptyModel(),
                ),
                StreamProvider<List<GalleryModel>>.value(
                  value: GalleryDataBaseServices(uid: user.id).galleryCardsData,
                  initialData: [],
                ),
                StreamProvider<PRM1model>.value(
                  value:
                      ToddlerPRDataBaseServices(uid: user.id).toddlerPRCardData,
                  initialData: PRM1model(),
                ),
                StreamProvider<List<PR2Grades>>.value(
                  value: PRM2DataBaseServices(uid: user.id).pr2Gardes,
                  initialData: [],
                ),
                StreamProvider<List<PR3Grades>>.value(
                  value: PRM3DataBaseServices(uid: user.id).pr3Gardes,
                  initialData: [],
                ),
                StreamProvider<List<PR4Grades>>.value(
                  value: PRM4DataBaseServices(uid: user.id).pr4Gardes,
                  initialData: [],
                ),
                StreamProvider<PRM3Listmodel>.value(
                  value: PRM3DataBaseServices(uid: user.id).prm3sData,
                  initialData: PRM3Listmodel(),
                ),
                StreamProvider<PRM4Listmodel>.value(
                  value: PRM4DataBaseServices(uid: user.id).prm4sData,
                  initialData: PRM4Listmodel(),
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
                  value:
                      ProfileDataBaseServices(uid: user.id).vaccinationCardData,
                  initialData: [],
                ),
                StreamProvider<ChildInfoModel>.value(
                  value: ProfileDataBaseServices(uid: user.id).childData,
                  initialData: ChildInfoModel(),
                ),
                StreamProvider<List<MedicalHistoryCard>>.value(
                  value: ProfileDataBaseServices(uid: user.id)
                      .medicalHistoryCardData,
                  initialData: [],
                ),
                StreamProvider<ParentInfoModel>.value(
                  value: ProfileDataBaseServices(uid: user.id).parentData,
                  initialData: ParentInfoModel(),
                ),
                StreamProvider<List<AlertModel>>.value(
                  value: AdminAlertDataBaseServices().alertsCardsData,
                  initialData: [],
                ),
                ChangeNotifierProvider<DateProvider>(
                  create: (context) => DateProvider(),
                ),
              ],
              child: LocaleBuilder(
                builder: (locale) => MaterialApp(
                    localizationsDelegates: Locales.delegates,
                    supportedLocales: Locales.supportedLocales,
                    locale: locale,
                    debugShowCheckedModeBanner: false,
                    title: 'Sary Academy',
                    theme: textData(),
                    home: HomePage()),
              ));
        } else if (isAdmin.isAdmin) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<ReportType>(
                create: (context) => ReportType(),
              ),
              StreamProvider<List<AbsenceCard>>.value(
                value: ProfileDataBaseServices(uid: childUser.uid)
                    .absenceCardsData,
                initialData: [],
              ),
              StreamProvider<ParentInfoModel>.value(
                value: ProfileDataBaseServices(uid: childUser.uid).parentData,
                initialData: ParentInfoModel(),
              ),
              StreamProvider<List<PR2Grades>>.value(
                value: PRM2DataBaseServices(uid: childUser.uid).pr2Gardes,
                initialData: [],
              ),
              StreamProvider<List<PR3Grades>>.value(
                value: PRM3DataBaseServices(uid: childUser.uid).pr3Gardes,
                initialData: [],
              ),
              StreamProvider<List<PR4Grades>>.value(
                value: PRM4DataBaseServices(uid: childUser.uid).pr4Gardes,
                initialData: [],
              ),
              StreamProvider<PRM1model>.value(
                value: ToddlerPRDataBaseServices(uid: childUser.uid)
                    .toddlerPRCardData,
                initialData: PRM1model(),
              ),
              StreamProvider<PRM2Listmodel>.value(
                value: PRM2DataBaseServices(uid: childUser.uid).prm2sData,
                initialData: PRM2Listmodel(),
              ),
              StreamProvider<List<VaccinationCard>>.value(
                value: ProfileDataBaseServices(uid: childUser.uid)
                    .vaccinationCardData,
                initialData: [],
              ),
              StreamProvider<List<MedicalHistoryCard>>.value(
                value: ProfileDataBaseServices(uid: childUser.uid)
                    .medicalHistoryCardData,
                initialData: [],
              ),
              StreamProvider<List<EventCard>>.value(
                value: EventDataBaseServices(uid: childUser.uid).eventCardsData,
                initialData: [],
              ),
              StreamProvider<ChildInfoModel>.value(
                value: ProfileDataBaseServices(uid: childUser.uid).childData,
                initialData: ChildInfoModel(),
              ),
              StreamProvider<List<ChildIndex>>.value(
                value: ProfilesIndexBaseServices().kidsIndex,
                initialData: [],
              ),
              StreamProvider<List<GalleryModel>>.value(
                value: GalleryDataBaseServices(uid: childUser.uid)
                    .galleryCardsData,
                initialData: [],
              ),
              ChangeNotifierProvider<DateProvider>(
                create: (context) => DateProvider(),
              ),
              ChangeNotifierProvider<EditEvent>(
                create: (context) => EditEvent(),
              ),
              StreamProvider<List<AlertModel>>.value(
                value: AdminAlertDataBaseServices().alertsCardsData,
                initialData: [],
              ),
              StreamProvider<PRM3Listmodel>.value(
                value: PRM3DataBaseServices(uid: childUser.uid).prm3sData,
                initialData: PRM3Listmodel(),
              ),
              StreamProvider<PRM4Listmodel>.value(
                value: PRM4DataBaseServices(uid: childUser.uid).prm4sData,
                initialData: PRM4Listmodel(),
              ),
            ],
            child: LocaleBuilder(
              builder: (locale) => MaterialApp(
                  localizationsDelegates: Locales.delegates,
                  supportedLocales: Locales.supportedLocales,
                  locale: locale,
                  debugShowCheckedModeBanner: false,
                  title: 'Sary Academy',
                  theme: textData(),
                  home: AdminHomePage()),
            ),
          );
        }
      },
    );
  }
}
