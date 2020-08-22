import 'dart:typed_data';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageView extends StatefulWidget {

  final String imgUrl;
  ImageView({@required this.imgUrl});

  @override
  _ImageViewState createState() => _ImageViewState();
}

class _ImageViewState extends State<ImageView> {
  var filePath;
  @override
  Widget build(BuildContext context) {
    return Scaffold( body: Stack(
      children: [
        Hero( tag: widget.imgUrl, child: Container( height: MediaQuery
            .of( context )
            .size
            .height,
            width: MediaQuery
                .of( context )
                .size
                .width,
            child: Image.network( widget.imgUrl, fit: BoxFit.cover, ) ), ),
        Container( alignment: Alignment.bottomCenter,
          child: Column( mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector( onTap: () {
                _save( );
              },
                child: Stack( children: [
                  Container( decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular( 30 ), color: Color(
                      0xFF1C1818 ).withOpacity( 0.8 ), ),
                    height: 50,
                    width: MediaQuery
                        .of( context )
                        .size
                        .width / 2, ),
                  Container(
                    height: 50,
                    width: MediaQuery
                        .of( context )
                        .size
                        .width / 2,
                    padding: EdgeInsets.symmetric( vertical: 8, horizontal: 8 ),
                    decoration: BoxDecoration( border: Border.all( color: Colors
                        .pink[300], width: 1 ),
                      borderRadius: BorderRadius.circular( 30 ),
                      gradient: LinearGradient( colors: [
                        Color( 0x36FFFFFF ),
                        Color( 0x0FFFFFFF ),
                      ],
                      begin: FractionalOffset.topLeft,
                      end: FractionalOffset.bottomRight),),
                    child: Column( children: [
                      Text( 'Set as Wallpaper', style: TextStyle(
                          fontSize: 16, color: Colors.white70 ) ),
                      Text( 'Image will be saved in gallery', style: TextStyle(
                          fontSize: 10, color: Colors.white70 ), )
                    ], ), ),
                ], ), ),
              SizedBox( height: 10 ),
              GestureDetector( onTap: () => Navigator.pop( context ),
                  child: Text(
                    'Cancel', style: TextStyle( color: Colors.white60),) ),
              SizedBox( height: 50, )
            ], ), )
      ], ), );
  }

  _save() async {
    await _askPermission( );
    var response = await Dio( ).get(
        widget.imgUrl, options: Options( responseType: ResponseType.bytes ) );
    final result = await ImageGallerySaver.saveImage(
        Uint8List.fromList( response.data ) );
    print(result);
    Navigator.pop(context);
  }

  _askPermission() async {
    var status = await Permission.storage.status;
    if (status.isUndetermined) {
      //You can request multiple permission at once
      Map<Permission, PermissionStatus> statuses = await [
        Permission.storage,
        Permission.photos
      ].request( );
      print( statuses[Permission.storage] );
    }
    /*if (Platform.isAndroid && Platform.isAndroid) {
      Map<Permission, PermissionStatus> permission =
          await [Permission.photos,Permission.storage].request();
    } else {
       PermissionStatus permission = await PermissionHandler()
          .checkPermissionStatus(Permission.storage);
      Map<Permission, PermissionStatus> permission = await [Permission.storage].request();
    }
  }*/

  }
}
