// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';
import 'package:fooderlich/main.dart';
import '../fooderlich_theme.dart';
import 'circle_image.dart';

class AuthorCard extends StatefulWidget {
  final String? authorName;
  final String? title;
  final ImageProvider? imageProvider;

  const AuthorCard({
    Key? key,
    required this.authorName,
    required this.title,
    this.imageProvider,
  }) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api, no_logic_in_create_state
  _AuthorCardState createState() => _AuthorCardState();
}

class _AuthorCardState extends State<AuthorCard> {
  // bool _isFavorited = false;
  @override
  Widget build(BuildContext context) {
    AppDataProvider? appDataProvider = AppDataProvider.of(context);
    return Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleImage(
                imageProvider: widget.imageProvider,
                imageRadius: 28,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.authorName!,
                    style: FooderlichTheme.lightTextTheme.headline2,
                  ),
                  Text(
                    widget.title!,
                    style: FooderlichTheme.lightTextTheme.headline3,
                  ),
                ],
              ),
            ],
          ),
          IconButton(
            icon: Icon(appDataProvider!.appData.isFavorited
                ? Icons.favorite
                : Icons.favorite_border),
            iconSize: 30,
            color: Colors.red[400],
            onPressed: () {
              setState(() {
                appDataProvider.appData.changeIsFavorited();
                // print(appDataProvider.appData.isFavorited);
              });
            },
          ),
        ],
      ),
    );
  }
}
// import 'package:flutter/material.dart';

// import '../fooderlich_theme.dart';
// import 'circle_image.dart';

// class AuthorCard extends StatefulWidget {
//   final String authorName;
//   final String title;
//   final ImageProvider? imageProvider;

//   const AuthorCard({
//     super.key,
//     required this.authorName,
//     required this.title,
//     this.imageProvider,
//   });

//   @override
//   AuthorCardState createState() => AuthorCardState();
// }

// class AuthorCardState extends State<AuthorCard> {
//   bool _isFavorited = false;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Row(children: [
//             CircleImage(
//               imageProvider: widget.imageProvider,
//               imageRadius: 28,
//             ),
//             const SizedBox(width: 8),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   widget.authorName,
//                   style: FooderlichTheme.lightTextTheme.headline2,
//                 ),
//                 Text(
//                   widget.title,
//                   style: FooderlichTheme.lightTextTheme.headline3,
//                 )
//               ],
//             ),
//           ]),
//           IconButton(
//             icon: Icon(_isFavorited ? Icons.favorite : Icons.favorite_border),
//             iconSize: 30,
//             color: Colors.red[400],
//             onPressed: () {
//               setState(() {
//                 _isFavorited = !_isFavorited;
//               });
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
