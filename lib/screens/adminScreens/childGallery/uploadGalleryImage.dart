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

import '../../../models/modalprogrsshub.dart';

class PhotoGalleryGetLocal extends StatefulWidget {
  @override
  State<PhotoGalleryGetLocal> createState() => _PhotoGalleryGetLocalState();
}

class _PhotoGalleryGetLocalState extends State<PhotoGalleryGetLocal> {
  File file;

  @override
  Widget build(BuildContext context) {
    String fileName = '';
    fileName = file != null ? basename(file.path) : "";
    final _height = MediaQuery.of(context).size.height;
    final _width = MediaQuery.of(context).size.height;
    return InkWell(
      onTap: () async {
        final loading = Provider.of<ModelHub>(context, listen: false);

        final result = await FilePicker.platform.pickFiles(
          allowMultiple: false,
        );
        if (result == null) {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("Choose it again"),
          ));
        } else {
          loading.changeIsLoading(true);

          setState(() {
            String path = result.files.single.path;
            file = File(path);
          });
          final uid = Provider.of<ChildModel>(context, listen: false).uid;
          final destination = 'photos/gallery/$uid/$fileName';
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
          SharedPreferences prefs = await SharedPreferences.getInstance();

          prefs.setString("GalleryImage", urlDownload);
          loading.changeIsLoading(false);
        }
      },
      child: Container(
        padding: EdgeInsets.all(5),
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
                  ? "???????? ???????? ???? ?????????????? ????????????????"
                  : "choose image from local storage"
              : fileName,
        ),
      ),
    );
  }
}
