import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lapangankita_user/services/services.dart';
import 'package:path/path.dart';

class UploadImagetoFirebase extends StatefulWidget {
  UploadImagetoFirebase({Key key}) : super(key: key);

  @override
  _UploadImagetoFirebaseState createState() => _UploadImagetoFirebaseState();
}

class _UploadImagetoFirebaseState extends State<UploadImagetoFirebase> {
  UploadTask task;
  File file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Expanded(
            child: Column(
              children: [
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    selectFile();
                  },
                  child: new Text("Choose Image"),
                ),
                RaisedButton(
                  padding: const EdgeInsets.all(8.0),
                  textColor: Colors.white,
                  color: Colors.blue,
                  onPressed: () {
                    uploadFile();
                  },
                  child: new Text("Upload"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;
    final path = result.files.single.path;

    setState(() => file = File(path));
  }

  Future uploadFile() async {
    if (file == null) return;

    final fileName = basename(file.path);
    final destination = 'files/$fileName';

    task = FirebaseApi.uploadFile(destination, file);
    setState(() {});

    if (task == null) return;

    final snapshot = await task.whenComplete(() {});
    final urlDownload = await snapshot.ref.getDownloadURL();

    print('Download-Link: $urlDownload');
  }
}
