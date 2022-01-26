import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_locales/flutter_locales.dart';
import 'package:provider/provider.dart';
import 'package:saryacademy/models/childUID.dart';
import 'package:saryacademy/services/PRM2Database.dart';
import 'package:saryacademy/services/PRM3Database.dart';
import 'package:saryacademy/services/PRM4Database.dart';
import 'package:saryacademy/services/toddlerPRDatabase.dart';
import '../../../const.dart';
import 'package:path/path.dart';

enum Type {
  toddle,
  report1,
  report2,
  report3,
}

// ignore: must_be_immutable
class PDFGetLocal extends StatefulWidget {
  Type reportType;
  String date;

  PDFGetLocal({@required this.reportType, this.date});
  @override
  State<PDFGetLocal> createState() => _PDFGetLocalState();
}

class _PDFGetLocalState extends State<PDFGetLocal> {
  File file;

  @override
  Widget build(BuildContext context) {
    String fileName = '';
    fileName = file != null ? basename(file.path) : "";
    final _width = MediaQuery.of(context).size.height;
    return Row(
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
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: kGreyColor.withOpacity(1),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 10),
            alignment: Alignment.center,
            child: Text(
              fileName == ''
                  ? Locales.currentLocale(context).toString() == "ar"
                      ? "إختر الملف"
                      : "choose file"
                  : fileName.substring(1, 10),
            ),
          ),
        ),
        SizedBox(
          width: 0.01897 * _width,
        ),
        InkWell(
          onTap: () async {
            if (file != null) {
              final uid = Provider.of<ChildModel>(context, listen: false).uid;
              String destination;
              UploadTask uploadTask;
              switch (widget.reportType) {
                case Type.toddle:
                  {
                    destination = 'files/toddlerRP/$uid/$fileName';
                    break;
                  }
                case Type.report1:
                  {
                    destination =
                        'files/S1Report/$uid/${widget.date}/$fileName';
                    break;
                  }

                case Type.report2:
                  {
                    destination =
                        'files/S2Report/$uid/${widget.date}/$fileName';
                    break;
                  }
                case Type.report3:
                  {
                    destination =
                        'files/S3Report/$uid/${widget.date}/$fileName';
                    break;
                  }
                default:
                  {
                    destination = '';
                    break;
                  }
              }

              try {
                if (destination != null) {
                  print(destination);
                  final ref = FirebaseStorage.instance.ref(destination);
                  uploadTask = ref.putFile(file);
                }
              } on FirebaseException catch (e) {
                print(e);
              }
              final snapshot = await uploadTask.whenComplete(() => {});
              final urlDownload = await snapshot.ref.getDownloadURL();
              print(urlDownload);
              print(uid);
              switch (widget.reportType) {
                case Type.toddle:
                  {
                    await ToddlerPRDataBaseServices().updatePDF(
                      pdf: urlDownload,
                      uid: uid,
                    );
                  }
                  break;
                case Type.report1:
                  {
                    await PRM2DataBaseServices(uid: uid)
                        .updateDatePdf(pdf: urlDownload, dateDoc: widget.date);
                    break;
                  }

                case Type.report2:
                  {
                    await PRM3DataBaseServices(uid: uid)
                        .updateDatePdf(pdf: urlDownload, dateDoc: widget.date);
                    break;
                  }
                case Type.report3:
                  await PRM4DataBaseServices(uid: uid)
                      .updateDatePdf(pdf: urlDownload, dateDoc: widget.date);
                  break;
              }
            }
          },
          child: Icon(
            Icons.upload,
            color: kText1Color.withOpacity(1),
          ),
        ),
      ],
    );
  }
}
