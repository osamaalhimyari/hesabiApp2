// import 'dart:js_util';

// import 'dart:ffi';

// ignore_for_file: camel_case_types

// import 'package:flutter/gestures.dart';
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:hesabi_app/contents/Settings.dart';
import 'package:hesabi_app/contents/image_container.dart';
import '../pages/contentpage.dart';
import '../models/sqldb.dart';
import '../models/routes.dart';
import 'dart:math';

import 'tools.dart';

class cardlistFB2 extends StatefulWidget {
  //const cardlistFB2({super.key});
  final int index;
  final int id;
  final String email;
  final String number;
  final String name;
  final File imageUrl;
  final String title;
  final bool canBePressed;
  final bool iconButtonOption;
  final dynamic onselectMenue;

  const cardlistFB2(
      {required this.index,
      required this.id,
      required this.name,
      required this.email,
      required this.number,
      required this.imageUrl,
      required this.title,
      required this.canBePressed,
      required this.iconButtonOption,
      required this.onselectMenue,
      Key? key})
      : super(key: key);
  @override
  State<cardlistFB2> createState() => _cardlistFB2State();
}

class _cardlistFB2State extends State<cardlistFB2> {
  Color? _iconColor = pinTheme;

  List colorlist = [
    Color.fromARGB(255, 50, 50, 177),
    const Color.fromARGB(255, 52, 151, 97),
    const Color.fromARGB(255, 215, 228, 115),
    const Color.fromARGB(255, 209, 38, 49),
    const Color.fromARGB(255, 209, 38, 186),
    const Color.fromARGB(255, 38, 155, 209),
    Color.fromARGB(255, 112, 27, 88),
    const Color.fromARGB(255, 72, 38, 209),
  ];

  SqlDb sqlDb = SqlDb();

  var colorNumber = Random().nextInt(7);

  // var colorNumber = Random().nextInt(8);

  int i = 0;
  bool pin = false;

  late String Dir = widget.imageUrl.path;

  @override
  Widget build(BuildContext context) {
    // print(widget.imageUrl.path);
    // print('00000000000000000000000');
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10, top: 5),
      // color: Colors.white,
      // decoration:
      //     BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(50))),
      child: ListTile(
        //selected: true,

        // splashColor: const Color.fromARGB(255, 177, 184, 177),

        onTap: widget.canBePressed == true
            ? () {
                // splashColor:

                sysRouting(
                    context,
                    containsPage(
                      index: widget.index,
                      id: widget.id,
                      name: widget.name,
                      email: widget.email,
                      number: widget.number,
                      imageUrl: File("${widget.imageUrl.path}"),
                      tableName: 'people',
                      title: widget.title,
                    ));
              }
            : () {},
        contentPadding: const EdgeInsets.all(2),

        // shape: const Border(bottom: BorderSide(width: 1)),
        title: Text(widget.name),
        subtitle: Row(
          children: [
            const Icon(Icons.thumb_up_alt_outlined, size: 20),
            const SizedBox(
              width: 3,
            ),
            // Text(widget.likes),
            Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                ),
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: SizedBox(width: 4, height: 4),
                )),

            Text(
              widget.title,
              textAlign: TextAlign.right,
            )
          ],
        ),

        trailing: widget.iconButtonOption == true
            ? ContextMenuDemo(context, widget.onselectMenue)
            : IconButton(
                // highlightColor: Colors.white,
                onPressed: () {
                  setState(() {
                    // i == 0 ? {} : {};
                    colorNumber = Random().nextInt(7);

                    if (i == 0) {
                      _iconColor = colorlist[colorNumber];
                      pin = true;
                      i++;
                    } else {
                      _iconColor = pinTheme;
                      pin = true;
                      i--;
                    }
                    // Colors.deepPurpleAccent;
                  });
                },
                icon: Icon(
                  Icons.push_pin_outlined,
                  color: _iconColor,
                ),
              ),

        leading: Padding(
          padding: EdgeInsets.only(left: 20, right: 20),
          child: SysCircularImage(
              File("${defoultFilePath!.path}/${widget.imageUrl.path}"),
              50,
              50,
              0,
              100),
        ),
      ),
    );
  }

  // Widget _ListTile() {
  //   return
  //
}
