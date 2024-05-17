import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:vouch/flutter_flow/flutter_flow_theme.dart';
import 'package:vouch/generated/assets.dart';

// Future<ImageProvider> getImageProvider(String url, String assetPath) async {
//   if (url.contains('http')) {
//     try {
//       final response = await http.get(Uri.parse(url));
//       if (response.statusCode == 403) {
//         return AssetImage(assetPath);
//       } else {
//         return NetworkImage(url);
//       }
//     } catch (e) {
//       return AssetImage(assetPath);
//     }
//   } else if (url is ImageProvider) {
//     return url as ImageProvider<Object>;
//   } else {
//     return AssetImage(assetPath);
//   }
// }


class CustomCircleAvatar extends StatelessWidget {
  dynamic imageUrl;
  final double radius;

  CustomCircleAvatar({
     this.imageUrl,
    this.radius = 18.0,
  });

  Future<ImageProvider> getImageProvider(String url) async {
   if(url == null){
     return AssetImage(Assets.assetsImage951);
   }
    try {
      if (url.contains('http')) {
        final response = await http.get(Uri.parse(url));
        if (response.statusCode == 403) {
          return AssetImage(Assets.assetsImage951);
        } else {
          return NetworkImage(url);
        }
      } else if (base64Decode(url) != null) {
        return MemoryImage(base64Decode(url));
      } else if (url is ImageProvider) {
        return url as ImageProvider<Object>;
      } else {
        return AssetImage(Assets.assetsImage951);
      }
    } catch (e) {
      return AssetImage(Assets.assetsImage951);
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
              backgroundImage: AssetImage(Assets.assetsImage951),
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
