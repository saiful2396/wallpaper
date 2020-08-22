import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/models/wallpaper_model.dart';
import 'package:wallpaper/views/image_view.dart';

Widget appBar(){
  return RichText(
    text: TextSpan(
      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
      children: <TextSpan>[
        TextSpan(text: 'Wall', style: TextStyle(color: Colors.black54)),
        TextSpan(text: 'paper', style: TextStyle(color: Colors.pink)),
      ],
    ),
  );
}

Widget wallpapersList(List<WallpaperModel> wallpapers, context){
  return Container(
    padding: EdgeInsets.symmetric(horizontal: 16),
    child: GridView.count(
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      crossAxisCount: 2,
      childAspectRatio: 0.6,
      mainAxisSpacing: 6.0,
      crossAxisSpacing: 6.0,
      children: wallpapers.map((wallpaper){
        return GridTile(
          child: GestureDetector(
            onTap: (){
              Navigator.push(context,
                MaterialPageRoute(builder: (_)=> ImageView(
                  imgUrl: wallpaper.src.portrait,
                )
                ),
              );
            },
            child: Hero(
              tag: wallpaper.src.portrait,
              child: Container(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10.0),
                  child: Image.network(wallpaper.src.portrait,
                  fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        );
      }).toList(),
    ),
  );
}