import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/childUID.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../const.dart';
import 'package:path/path.dart';
import '../../../shared/reportTitleCard.dart';

class PhotoGetLocal extends StatefulWidget {
  @override
  State<PhotoGetLocal> createState() => _PhotoGetLocalState();
}

class _PhotoGetLocalState extends State<PhotoGetLocal> {
  File file;

  @override
  Widget build(BuildContext context) {
    String fileName = '';
    fileName = file != null ? basename(file.path) : "";
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.height;
    return Column(
      children: [
        SizedBox(
          height: 0.036875 * _height,
        ),
        ReportTitleCard(title: "Child Photo"),
        SizedBox(
          height: 0.02897 * _height,
        ),
        Row(
          children: [
            InkWell(
              onTap: () async {
                final result = await FilePicker.platform.pickFiles(
                  allowMultiple: false,
                );
                if (result == null)
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text("Choose it again"),
                  ));
                else {
                  setState(() {
                    String path = result.files.single.path;
                    file = File(path);
                  });
                }
              },
              child: Container(
                height: 0.059018 * _height,
                width: 0.31 * _width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.0),
                  border: Border.all(
                    color: kGreyColor.withOpacity(1),
                  ),
                ),
                alignment: Alignment.center,
                child: Text(
                  fileName == ''
                      ? Locales.currentLocale(context).toString() == "ar"
                          ? "إختر صورة من الذاكرة الداخلية"
                          : "choose image from local storage"
                      : fileName,
                ),
              ),
            ),
            SizedBox(
              width: 0.01897 * _width,
            ),
            InkWell(
              onTap: () async {
                if (file != null) {
                  final uid =
                      Provider.of<ChildModel>(context, listen: false).uid;
                  final destination = 'photos/profile/$uid/$fileName';
                  UploadTask uploadTask;
                  try {
                    final ref = FirebaseStorage.instance.ref(destination);
                    uploadTask = ref.putFile(file);
                  } on FirebaseException catch (e) {
                    print(e);
                  }
                  final snapshot = await uploadTask.whenComplete(() => {});
                  final urlDownload = await snapshot.ref.getDownloadURL();
                  print(urlDownload);
                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();
                  prefs.setString("profileImage", urlDownload);
                }
              },
              child: Icon(
                Icons.upload,
                color: kText1Color.withOpacity(1),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
