import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class UploadBannerScreen extends StatefulWidget {
  const UploadBannerScreen({super.key});

  static const String routName = '/UploadBannerScreen';

  @override
  State<UploadBannerScreen> createState() => _UploadBannerScreenState();
}

class _UploadBannerScreenState extends State<UploadBannerScreen> {

  final FirebaseStorage _firebaseStorage = FirebaseStorage.instance;
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;

  dynamic _image;
  String? fileName;

  _pickImage() async {
    print('Subiendo archivo..........');
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        allowMultiple: false,
        type: FileType.image
    );

    if (result != null) {
      setState(() {
        _image = result.files.first.bytes;
        fileName = result.files.first.name;
      });
    }
  }

  _uploadBannerToStorage(image) async {
    var ref = _firebaseStorage.ref().child('banners').child(fileName!);
    UploadTask uploadTask = ref.putData(image);
    TaskSnapshot taskSnapshot = await uploadTask;
    String downloadURL = await taskSnapshot.ref.getDownloadURL();
    return downloadURL;
  }

  _uploadToFireStore() async {
    EasyLoading.show();
    if (_image != null) {
      var imageURL = await _uploadBannerToStorage(_image);
      await _firebaseFirestore.collection('banner').doc(fileName).set({
        'image' : imageURL
      }).whenComplete(() {
        EasyLoading.dismiss();
        _image = null;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(10.0),
            child: const Text(
              'Upload Banner',
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 36
              ),
            ),
          ),
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  children: [
                    Container(
                        width: 140,
                        height: 140,
                        decoration: BoxDecoration(
                            color: Colors.grey[500],
                            borderRadius: BorderRadius.circular(10.0)
                        ),
                        margin: const EdgeInsets.only(bottom: 30.0),
                        child: _image != null
                            ? Image.memory(
                          _image!,
                          fit: BoxFit.cover,
                        )
                            : const Center(child: Text('Upload Banner...'),)
                    ),
                    ElevatedButton(
                      onPressed: _pickImage,
                      child: const Text('Load Banner'),
                    )
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  _uploadToFireStore();
                },
                child: const Text('Save'),
              )
            ],
          )
        ],
      ),
    );
  }
}
