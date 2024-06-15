import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '/flutter_flow/flutter_flow_theme.dart';
import '/generated/assets.dart';


class CustomCircleAvatar extends StatelessWidget {
  dynamic imageUrl;
  final double radius;

  CustomCircleAvatar({
     this.imageUrl,
    this.radius = 18.0,
  });

  Future<ImageProvider> getImageProvider(String url) async {
   if(url == 'null' || url == null){
     return AssetImage(Assets.assetsDefault);
   }
    try {
      if (url.contains('http')) {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 403) {
          return AssetImage(Assets.assetsDefault);
        } else {
          return NetworkImage(url);
        }
      } else if (base64Decode(url) != null) {
        return MemoryImage(base64Decode(url));
      } else if (url is ImageProvider) {
        return url as ImageProvider<Object>;
      } else {
        return AssetImage(Assets.assetsDefault);
      }
    } catch (e) {
      return AssetImage(Assets.assetsDefault);
    }
  }
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<ImageProvider>(
      future: getImageProvider(imageUrl, ),
      builder: (BuildContext context, AsyncSnapshot<ImageProvider> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          if (snapshot.hasError) {
            return CircleAvatar(
              radius: radius,
              backgroundImage: AssetImage(Assets.assetsDefault),
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            );
          } else {
            return CircleAvatar(
              radius: radius,
              backgroundImage: snapshot.data,
              backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            );
          }
        } else {
          return Container(
            height: radius * 2,
            width: radius *2,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(radius),
              color: FlutterFlowTheme.of(context).primary
            ),
          );
        }
      },
    );
  }
}
