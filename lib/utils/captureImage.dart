import 'dart:async';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:interviewVoiceApp/properties/colors.dart';
import 'package:interviewVoiceApp/properties/images.dart';

class ImageCapture extends StatefulWidget {
  final String page;

  ImageCapture({this.page});

  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  /// Active image file
  File _imageFile;
  bool _isLoading = false;

  /// Cropper plugin
  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
        sourcePath: _imageFile.path,
        aspectRatioPresets: Platform.isAndroid
            ? [
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio16x9
              ]
            : [
                CropAspectRatioPreset.original,
                CropAspectRatioPreset.square,
                CropAspectRatioPreset.ratio3x2,
                CropAspectRatioPreset.ratio4x3,
                CropAspectRatioPreset.ratio5x3,
                CropAspectRatioPreset.ratio5x4,
                CropAspectRatioPreset.ratio7x5,
                CropAspectRatioPreset.ratio16x9
              ],
        androidUiSettings: AndroidUiSettings(
            toolbarTitle: 'Crop Image',
            toolbarColor: BLACK,
            toolbarWidgetColor: Colors.white,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        iosUiSettings: IOSUiSettings(
          title: 'Crop Image',
        ));

    setState(() {
      _imageFile = cropped ?? _imageFile;
    });
  }

  /// Select an image via gallery or camera
  Future<void> _pickImage(ImageSource source) async {
    // ignore: deprecated_member_use
    File selected = await ImagePicker.pickImage(source: source);

    setState(() {
      _imageFile = selected;
    });
  }

  /// Remove image
  void _clear() {
    setState(() => _imageFile = null);
  }

  Future<void> _done(BuildContext context) async {}

  @override
  void initState() {
    // _pickImage(ImageSource.gallery);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          actions: <Widget>[
            if (_imageFile != null) ...[
              Container(
                child: Row(
                  children: <Widget>[
                    FlatButton(
                      child: Icon(Icons.refresh, color: BLUE),
                      onPressed: _isLoading ? null : _clear,
                    ),
                    FlatButton(
                      child: Icon(Icons.crop, color: BLUE),
                      onPressed: _isLoading ? null : _cropImage,
                    ),
                    RaisedButton(
                      color: BLUE,
                      textColor: WHITE,
                      child: Text("Upload"),
                      onPressed: () => _isLoading ? null : _done(context),
                    ),
                  ],
                ),
              ),
            ]
          ],
        ),

        // Select an image from the camera or gallery
        bottomNavigationBar: Container(
          height: 100,
          color: WHITE,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(
                  Icons.photo_camera,
                  size: 50,
                ),
                label: Text("Camera"),
                onPressed: () =>
                    _isLoading ? null : _pickImage(ImageSource.camera),
              ),
              SizedBox(width: 50),
              FlatButton.icon(
                label: Text("Gallery"),
                icon: Icon(
                  Icons.photo_library,
                  size: 50,
                ),
                onPressed: () =>
                    _isLoading ? null : _pickImage(ImageSource.gallery),
              ),
            ],
          ),
        ),

        body: Container(
          color: PRIMARYCOLOR,
          child: Stack(
            children: <Widget>[
              Center(
                child: ListView(
                  children: <Widget>[
                    if (_imageFile != null) ...[
                      Container(
                        height: MediaQuery.of(context).size.height * .7,
                        margin: EdgeInsets.all(20),
                        child: Image.file(_imageFile),
                      ),
                    ] else
                      Container(
                        height: MediaQuery.of(context).size.height * .7,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Container(
                                margin: EdgeInsets.all(20),
                                child: ClipOval(
                                  child: Image.asset(BLANKIMAGE,
                                      width: 100, height: 100),
                                ),
                              ),
                              SizedBox(height: 20),
                              Text(
                                "Upload ${widget.page != "addproduct" ? 'profile' : ''} picture",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                  ],
                ),
              ),
              _isLoading
                  ? Container(
                      color: WHITE.withOpacity(.8),
                      child: Center(
                        child: CircularProgressIndicator(
                          valueColor: new AlwaysStoppedAnimation<Color>(BLACK),
                        ),
                      ),
                    )
                  : Container(width: 0, height: 0)
            ],
          ),
        ),
      ),
    );
  }
}
