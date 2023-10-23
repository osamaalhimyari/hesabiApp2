// ignore_for_file: non_constant_identifier_names, duplicate_ignore

// import 'dart:io';

import 'dart:io';
// import 'dart:js_util';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';

import '../models/UserModel.dart';
import 'Settings.dart';

// import 'package:hesabi_app/contents/Syslist.dart';
// import 'package:hesabi_app/layout/appBar.dart';
// import 'package:hesabi_app/models/routes.dart';
// import 'package:image_picker/image_picker.dart';
// import 'Syslist.dart';
// import '../pages/homepage.dart';
// import '../models/sqldb.dart';
// import '../layout/drawer.dart';

// class variableshome {
//   static const String imagUrl = '1.jpg';
//   static const double vradius = 0;
//   static const String vtitle = 'Osama';
// }

// ignore: non_constant_identifier_names
Text SysgreatText(
  String vText,
  double vfontsize,
  Color? fontcolor,
  FontWeight vfontWeight,
  int fontnumberOfFamily,
) {
  List fontfamily = <String>['EduSABeginner', 'Roboto'];
  return Text(
    vText,
    style: TextStyle(
      fontSize: vfontsize,
      color: fontcolor != null ? fontcolor : null,
      fontWeight: vfontWeight,
      fontFamily: fontfamily[fontnumberOfFamily],
    ),
  );
}

// MenuItem SysMenuItem(BuildContext context, int page) {
//   return MenuItem(
//     text: 'Friends',
//     icon: Icons.people,
//     onClicked:
//   );
// }

void SysSelectedItem(BuildContext context, int index) {
  Navigator.of(context).pop();
  switch (index) {
    case 0:
      break;
    case 1:
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => const Scaffold(), // Page 2
      ));
      break;
  }
}

class PickAnImage {
  var pickedImage;
  late File? image;
  late String imageType = '';
  ImagePicker picker = ImagePicker();
  //
  pickImagefrom() async {
    pickedImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    if (pickedImage == null) return null;

    File currentPath =
        File(pickedImage!.path); // this just to show it teprary befor saveing
    imageType = basename(pickedImage!.path).split(".").last;

    image = currentPath;
  }
}

PopupMenuButton ContextMenuDemo(BuildContext context, var onselect) {
  List<Map> menues = [
    {'text': 'restore', 'value': '0'},
    {'text': 'delete', 'value': '1'},
    // {'text': '', 'value': ''},
  ];

  return PopupMenuButton<String>(
      padding: EdgeInsets.zero,
      itemBuilder: (context) => <PopupMenuItem<String>>[
            PopupMenuItem<String>(
                value: menues[0]['value'], child: Text(menues[0]['text'])),
            PopupMenuItem<String>(
                value: menues[1]['value'], child: Text(menues[1]['text'])),
            // CheckedPopupMenuItem()
          ],
      onSelected: onselect);
}

class alterScreen extends StatefulWidget {
  final String text;
  final IconData? buttonicon;
  final Function() onpressed;
  const alterScreen(
      {required this.text,
      required this.buttonicon,
      required this.onpressed,
      super.key});

  @override
  State<alterScreen> createState() => _alterScreenState();
}

class _alterScreenState extends State<alterScreen> {
  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 60,
            ),
            SysgreatText(widget.text, 22, null, FontWeight.bold, 1),
            SizedBox(
              height: 30,
            ),
            IconButton(
              iconSize: 100,
              onPressed: widget.onpressed,
              icon: Icon(
                widget.buttonicon,
                // Icons.add_circle,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class SysBottomSheet extends StatelessWidget {
  const SysBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: IconButton(
        // child: const Text('showModalBottomSheet'),
        icon: Icon(Icons.share_outlined),

        onPressed: () {
          showModalBottomSheet<void>(
            context: context,
            builder: (BuildContext context) {
              return SizedBox(
                height: 200,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      // const Text('Modal BottomSheet'),
                      ElevatedButton(
                        child: const Text('Close BottomSheet'),
                        onPressed: () => Navigator.pop(context),
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class themeMode extends StatefulWidget {
  final Color? iconColor;
  const themeMode({required this.iconColor, super.key});

  @override
  State<themeMode> createState() => _themeModeState();
}

class _themeModeState extends State<themeMode> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topRight,
      height: 60,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: IconButton(
            onPressed: () async {
              if (iconofTheme == Icons.dark_mode) {
                appthemeislight = true;
                iconofTheme = Icons.light_mode;
                // int res =
                await sqlDb.updatehData(
                    'theme',
                    {
                      'color': '1',
                    },
                    'id=1');
                // print('theme light $res');
                setState(() {
                  changed = true;
                });
              } else if (iconofTheme == Icons.light_mode) {
                appthemeislight = false;
                iconofTheme = Icons.dark_mode;
                // int res =
                await sqlDb.updatehData(
                    'theme',
                    {
                      'color': '0',
                    },
                    'id=1');
                // print('theme dark $res');
                setState(() {
                  changed = true;
                });
              }
            },
            alignment: Alignment.bottomLeft,
            icon: Icon(
              iconofTheme,
              size: 30,
              color: widget.iconColor,
            )),
      ),
    );
  }
}

/**
 * 
 * 
 * if (value == '0') {
          if (mounted) {
           

            setState(() {
              differentLength++;
            });
          }
        } else if (value == '1') {
          var res2 = await sqlDb.deletData('people', 'id=$holdID');

          if (mounted) {
            print('$res2 =============');
            setState(() {
              archived = true;
              differentLength++;
              // page = page;
            });
          }
        }
 *   
 */