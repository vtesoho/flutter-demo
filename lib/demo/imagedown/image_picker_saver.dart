import 'dart:io';


// import 'package:image_picker/image_picker.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker_saver/image_picker_saver.dart';

class ImgSaver extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<ImgSaver> {
  // File _image;
  var _imageFile;

  // Future getImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.camera);
    
  //   setState(() {
  //     _image = image;
  //     print(_image);
  //   });
  // }
  void _onImageSaveButtonPressed() async {
      print("_onImageSaveButtonPressed");
      var response = await http
          .get('http://upload.art.ifeng.com/2017/0425/1493105660290.jpg');
  
      debugPrint(response.statusCode.toString());
  
      var filePath = await ImagePickerSaver.saveFile(
          fileData: response.bodyBytes);
  
      var savedFile= File.fromUri(Uri.file(filePath));
      setState(() {
        _imageFile = Future<File>.sync(() => savedFile);
      });
    }
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: Text('data'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){print(_imageFile);},
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}