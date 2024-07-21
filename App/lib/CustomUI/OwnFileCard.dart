import 'dart:io';

import 'package:flutter/material.dart';

class OwnFileCard extends StatelessWidget {
  const OwnFileCard(
      {super.key,
      required this.path,
      required this.message,
      required this.time});
  final String path;
  final String message;
  final String time;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        child: Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height / 2.5,
            maxWidth: MediaQuery.of(context).size.width / 2,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.green[300],
          ),
          child: Card(
            margin: const EdgeInsets.all(3),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            semanticContainer: true,
            clipBehavior: Clip.antiAliasWithSaveLayer,
            color: Colors.teal[400],
            // child: Column(
            //   children: [
            //     Expanded(
            //       child: ClipRRect(
            //         borderRadius: const BorderRadius.only(
            //           topLeft: Radius.circular(15),
            //           topRight: Radius.circular(15),
            //         ),
            //         child: Image.file(
            //           File(path),
            //           fit: BoxFit.cover,
            //         ),
            //       ),
            //     ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                    child: Image.file(
                  File(path),
                  fit: BoxFit.fitHeight,
                )),
                message.isNotEmpty
                    ? Container(
                        height: 40,
                        padding: const EdgeInsets.only(left: 15, top: 8),
                        child: Text(
                          message,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600),
                        ),
                      )
                    : Container()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
