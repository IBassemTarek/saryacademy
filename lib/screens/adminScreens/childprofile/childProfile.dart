import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/childUID.dart';
import 'package:saryacademy/screens/adminScreens/childprofile/statusInfoSection.dart';
import 'package:saryacademy/services/profileDatabase.dart';
import 'package:saryacademy/shared/addImpDataSection.dart';
import 'package:saryacademy/shared/alertchecker.dart';
import 'package:saryacademy/shared/reportTitleCard.dart';
import '../../../const.dart';
import 'InfoSection.dart';
import 'customAppBar.dart';
import 'saveBotton.dart';

// ignore: must_be_immutable
class ChildProfile extends StatelessWidget {
  String photoURL;
  String childName;
  String age;
  String gender;
   String  birthday;
   String  email;
   String  nationality;
   int  reportType; 
   String phone;
   String address;   
   String  fatherOcc;
   String  matherOcc;     

  @override
  Widget build(BuildContext context) {
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.width;
    final uid = Provider.of<ChildModel>(context).uid;
    alertcheck(context:context);
    return Scaffold(
      backgroundColor: kbackgroundColor.withOpacity(1),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        height: _height * 0.960625,
                        color: Colors.white,
                        child: Column(
                          children: [
                            SizedBox(
                              height: 0.01897 * _height,
                            ),
                            CustomAppBar(),
                            Container(
                              width: 0.7198 * _width,
                              child: InfoSection(
                                lable: ["Image URL"],
                                onClick: [(value) {photoURL= value;}],
                                title: "Child Photo",
                              ),
                            ),
                            Container(
                              width: 0.7198 * _width,
                              child: InfoSection(
                                lable: [
                                  "Child Name",
                                  "Gender",
                                  "Date of birth",
                                  "E-mail",
                                  "Nationality",
                                  "age",
                                  "report type"
                                ],
                                onClick: [
                                  (value) {childName = value;},
                                  (value) {gender = value;},
                                  (value) {birthday= value;},
                                  (value) {email= value;},
                                  (value) {nationality= value;},
                                  (value) {age= value;},
                                  (x) {reportType=int.parse(x);}
                                ],
                                title: "Child Info",
                              ),
                            ),
                            SizedBox(
                              height: 0.026018 * _height,
                            ),
                            
                              SaveBotton(smallBotton: false,text: "save",
                              onTap: () async { 
                                  if (age!=null && birthday!=null &&email!=null &&gender!=null &&childName!=null &&nationality!=null &&photoURL!=null &&reportType!=null&&reportType<=3 )
                                  {
                                try{

                                 await ProfileDataBaseServices(uid:uid).updateUserData(
                                  age: age,
                                  birthday: birthday,
                                  email: email,
                                  gender: gender,
                                  name: childName,
                                  nationality: nationality,
                                  photourl: photoURL,
                                  reportType: reportType,
                                  uid:uid
                                );
                                }
                                catch(e){
                                  print(e);
                                }
                                  }
                                else 
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("enter you Info again and report type between 1 and 3"),
                                   ));
                              },

                              ),
                            
                          ],
                        ),
                      ),
                      SizedBox(height: 0.0558*_height,),
                      Container(
                        width: 0.7198 * _width,
                        child: DetailsListView(
                          lable: [
                            "Phone",
                            "Address",
                            "Father`s occupation",
                            "Father`s occupation"
                          ],
                          onClick: [
                                  (value) {
                                    print(value);
                                    phone = value;},
                                  (value) {
                                    print(value);
                                    address = value;},
                                  (value) {
                                    print(value);
                                    fatherOcc= value;},
                                  (value) {
                                    print(value);
                                    matherOcc= value;},
                          ],
                        ),
                      ),
                      SizedBox(height: 0.0258*_height,),
                      SaveBotton(smallBotton: false,text: "save",
                      onTap: ()async{
                        // print(uid);
                        if (address!=null && phone!=null &&fatherOcc!=null &&matherOcc!=null )
                        {
                         try{
                                await ProfileDataBaseServices(uid:uid).updateParentData(
                                  address: address,
                                  phone:phone,
                                  fatherOcc: fatherOcc,
                                  matherOcc: matherOcc
                                );

                         }catch(e){
                           print(e);
                         }
                        }
                        else 
                                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                                    content: Text("enter you Info again"),
                                   ));

                      },
                      ),
                    ],
                  ),
                  Positioned(
                      top: 0.93209*_height,
                      left:0.2705*_width,
                      child: ReportTitleCard(
                        title: "Parents Info",
                      )),
                ],
              ),
        SizedBox(
          height: 0.036875 * _height,
        ),
        ReportTitleCard(title: "Medical History"),
        SizedBox(
          height: 0.02897 * _height,
        ),
        StatusInfoSction(title: "Medical history",),
        SizedBox(
          height: 0.036875 * _height,
        ),
        AddImpDataSection(
          condition: "Medical history"
        ),

        SizedBox(
          height: 0.036875 * _height,
        ),
        ReportTitleCard(title: "Vaccinations"),
        SizedBox(
          height: 0.02897 * _height,
        ),
        StatusInfoSction(title: "Vaccinations",),
        SizedBox(
          height: 0.036875 * _height,
        ),
        AddImpDataSection(
          condition: 'Vaccinations',
        ),
        SizedBox(
          height: 0.036875 * _height,
        ),
        ReportTitleCard(title: "Absence"),
        SizedBox(
          height: 0.02897 * _height,
        ),
        StatusInfoSction(title: "Absence",),
        SizedBox(
          height: 0.036875 * _height,
        ),
        AddImpDataSection(
          condition: "Absence",
        ),
            ],
          ),
        ),
      ),
    );
  }
}

