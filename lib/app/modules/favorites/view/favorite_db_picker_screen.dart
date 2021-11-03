import 'package:fisio_app/app/modules/favorites/store/utility.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import '../store/db_helper.dart';
import '../model/photo_model.dart';
import 'dart:async';

class SaveImageDemoSQLite extends StatefulWidget {
  const SaveImageDemoSQLite() : super();

  @override
  _SaveImageDemoSQLiteState createState() => _SaveImageDemoSQLiteState();
}

class _SaveImageDemoSQLiteState extends State<SaveImageDemoSQLite> {
  Future<File>? imageFile;
  Image? image;
  late DBHelper dbHelper;
  List<PhotoModel> images = [];
  final ImagePicker _imagePicker = ImagePicker();

  @override
  void initState() {
    super.initState();
    images = [];
    dbHelper = DBHelper.dbHelper;
    refreshImages();
  }

  refreshImages() {
    dbHelper.getPhotoModels().then((imgs) {
      setState(() {
        images.clear();
        images.addAll(imgs);
      });
    });
  }

  void pickImageFromGallery() {
    _imagePicker.pickImage(source: ImageSource.gallery).then((imgFile) {
      if (imgFile != null) {
        final File file = File(imgFile.path);
        String imgString = Utility.base64String(file.readAsBytesSync());
        PhotoModel photo = PhotoModel(0, imgString);
        dbHelper.save(photo);
        refreshImages();
      }
    });
  }

  gridView() {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: GridView.count(
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 4.0,
        crossAxisSpacing: 4.0,
        children: images.map((photo) {
          return Utility.imageFromBase64String(photo.photoName);
        }).toList(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Image DB'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              pickImageFromGallery();
            },
          )
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Flexible(
              child: gridView(),
            )
          ],
        ),
      ),
    );
  }
}
