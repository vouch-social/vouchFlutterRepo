//
// import 'package:flutter/material.dart';
// import '../../../flutter_flow/flutter_flow_theme.dart';
//
//
// class ImageText extends StatelessWidget {
//
//   const ImageText({super.key, });
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       height: 92,
//       color: Colors.red,
//       width: MediaQuery.of(context).size.width - 24,
//       child: ListView.builder(
//         //padding: const EdgeInsets.all(4.0),
//         physics: const NeverScrollableScrollPhysics(),
//         scrollDirection: Axis.horizontal,
//         itemCount: 4,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//             child:Column(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       Container(
//                         width: 60,
//                         height: 60,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(30.0),
//                         ),
//                         child: Image.asset('assets/image951.png'),
//                       ),
//                       const SizedBox(height: 4),
//                       SizedBox(
//                         width: 60,
//                         child: Text(
//                           'Chitranjan Ramakuru',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                               fontFamily: 'Bricolage Grotesque',
//                               fontSize: 12,
//                               fontWeight: FontWeight.w500,
//                               color: FlutterFlowTheme.of(context).primaryText
//                           ),
//                         ),
//                       )
//                       // Text(
//                       //   '',
//                       //   textAlign: TextAlign.center,
//                       //   style: TextStyle(
//                       //       fontFamily: 'Bricolage Grotesque',
//                       //       fontSize: 12,
//                       //       fontWeight: FontWeight.w500,
//                       //       color: FlutterFlowTheme.of(context).primaryText
//                       //   ),
//                       // ),
//                     ],
//
//             ),
//             onTap: (){},
//           );
//         },
//       ),
//     );
//   }
// }