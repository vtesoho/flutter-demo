// import 'dart:typed_data';

// import 'package:flutter/material.dart';
// import 'package:image_tailor/image_tailor.dart';

// class ImageTailorDemo extends StatefulWidget {
//   ImageTailorDemo({Key key}) : super(key: key);

//   _ImageTailorDemoState createState() => _ImageTailorDemoState();
// }

// class _ImageTailorDemoState extends State<ImageTailorDemo> {
//   List _images = [];
//   _previewPhoto() {
//     return Container(
//       width: 300,
//       height: 300,
//       child: ListView.builder(
//         itemBuilder: (context, i) {
//           Uint8List image = _images[i];
//           print(image);
//           print(image.lengthInBytes.toString());

//           return Container(
//             width: 300,
//             child: Image.memory(
//               image,
//               fit: BoxFit.fitWidth,
//             ),
//           );
//         },
//         itemCount: _images.length,
//       ),
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Plugin example app'),
//       ),
//       body: Stack(
//         children: <Widget>[
//           Column(
//             children: <Widget>[
//               _previewPhoto(),
              
//             ],
//           ),
//           Positioned(
//             top:400,
//             child: FlatButton(  
//               child: Text('FlatButton'),
//               onPressed: () {
//                 ImageTailor.finish;
//               },
//             ),
//           )
//         ],
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           final result = await ImageTailor.selectImg(
//             maxImages: 4,
//             quality: 0.5,
//             width: 1024,
//             height: 100,
//             videos: false,
//           );

//           if (result is List) {
//             setState(() {
//               _images = result;
//             });
//           }
//         },
//       ),
//     );
//   }
// }