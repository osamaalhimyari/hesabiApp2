// import 'package:hesabi_app/auth/Animation/FadeAnimation.dart';
// ignore_for_file: unused_import

import 'dart:io';

import 'package:dropdown_button2/dropdown_button2.dart';
// import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hesabi_app/auth/authPage.dart';

import 'package:hesabi_app/contents/Settings.dart';
import 'package:hesabi_app/contents/image_container.dart';

// import 'package:hesabi_app/contents/Globals.dart'
import 'package:hesabi_app/contents/tools.dart';
import 'package:hesabi_app/main.dart';
import 'package:hesabi_app/models/routes.dart';
import 'package:hesabi_app/pages/homepage.dart';
import 'package:jiffy/jiffy.dart';
import 'package:path/path.dart';

import '../layout/drawer.dart';
import '../models/UserModel.dart';

// import '../models/UserModel.dart';
// import 'package:hesabi_app/models/routes.dart';
// import 'package:hesabi_app/pages/homepage.dart';
// import 'package:hesabi_app/auth/Animation/FadeAnimation.dart';
// import 'package:path/path.dart';

class UserProfilePage extends StatefulWidget {
  const UserProfilePage({super.key});
//   final int id;
// required this.id,
  @override
  State<UserProfilePage> createState() => _UserProfilePageState();
}

late int tapped = 0;

class _UserProfilePageState extends State<UserProfilePage> {
  final GlobalKey<FormState> authFormState = GlobalKey();
  var image = File("${defoultFilePath!.path}/defoult.jpg");
  TextEditingController name = TextEditingController();
  late bool submitted = true;
  // TextEditingController nmber = TextEditingController();

  // TextEditingController CPassword = TextEditingController();

  // UserAuthClass user = UserAuthClass();

  PickAnImage pickAnImage = PickAnImage();

  var pickedImage;

  // var image = File("${defaultPath}/defoult.jpg");

  String imageType = '';
  late String imageNewName = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          // backgroundColor: Colors.white,
          elevation: 0,
          leadingWidth: 100,
          leading: const themeMode(iconColor: null),

          // margin: EdgeInsets.only(left: 10, right: 10),
          // child: ButtonMenue()),
        ),
        // backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.only(left: 30, right: 30),
            child: Form(
              key: authFormState,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 30,
                  ),
                  SizedBox(
                    height: 70,
                    child: Text('Set Up Profile'),
                  ),
                  InkWell(
                      onTap: (() async {
                        // up();
                        await pickAnImage.pickImagefrom();

                        setState(() {
                          tapped++;

                          if (pickAnImage.pickedImage == null) {
                            image =
                                File("${defoultFilePath!.path}/defoult.jpg");
                            tapped = 0;
                          } else {
                            image = pickAnImage.image!;
                          }

                          pickedImage = pickAnImage.pickedImage;
                        });
                      }),
                      child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                                width: 2,
                              ),
                              borderRadius: BorderRadius.circular(100)),
                          child: tapped == 0
                              ? CircleAvatar(
                                  radius: 50,
                                  backgroundImage:
                                      AssetImage('images/defoult.jpg'),
                                )
                              : SysCircularImage(image, 100, 100, 0, 50))),

                  // child: CircleAvatar(
                  //     radius: 50, backgroundImage: FileImage(image)
                  //     // child: ,
                  //     ))),

                  const SizedBox(
                    height: 30,
                    // child: Text(
                    //   '________________________',
                    // style: TextStyle(color: Colors.deepPurple),
                    // ),
                  ),
                  TextFormField(
                    controller: name,

                    // textDirection: ,
                    onChanged: (value) {
                      submitted == true;
                    },

                    validator: (String? value) {
                      if (value == null || value.isEmpty) {
                        return 'name is requierd !!';
                      }

                      return null;
                    },
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.all(16),
                      // hintText: 'enter your name.',
                      label: Text('name'),
                      hintStyle: const TextStyle(fontSize: 14),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  // TextFormField(
                  //   controller: email,
                  //   onChanged: (value) {
                  //     allow = true;
                  //   },
                  //   // onChanged: (value) {
                  //   //   email.text = value;
                  //   // },

                  //   decoration: InputDecoration(
                  //     contentPadding: const EdgeInsets.all(16),
                  //     hintText: 'Enter Your email.',
                  //     hintStyle: const TextStyle(fontSize: 14),
                  //     border: OutlineInputBorder(
                  //       borderRadius: BorderRadius.circular(15),
                  //     ),
                  //   ),
                  // ),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  InkWell(
                    onTap: () async {
                      print('$submitted==================');
                      if (authFormState.currentState!.validate() &&
                          submitted == true) {
                        print(imageNewName);
                        print(image.path);
                        // print(pickedImage);

                        var imagetype = pickAnImage.imageType.split(".").last;
                        imageNewName =
                            "${Jiffy.now().yMd.replaceAll('/', '')}:${Jiffy.now().hour}(${name.text}).${imagetype}";

                        if (pickAnImage.pickedImage != null) {
                          pickAnImage.pickedImage
                              .saveTo("${defoultFilePath!.path}/$imageNewName");
                        } else {
                          imageNewName = 'defoult.jpg';
                        }

                        print('==================');
                        // print(password.text);
                        // print(number.text);  'email': '${email.text}',

                        int response = await sqlDb.insertData('user', {
                          'name': name.text,
                          'ImagePath': imageNewName,
                          'locked': 0,
                          'email': '-',
                          'number': '-',
                        });

                        if (response > 0) {
                          submitted = false;
                          changed = true;
                          isVerified = true;

                          // Navigator.of(context).;
                          //   print(response);

                          print('==added ================');
                          // sysRouting(context, InitApp());
                          // setState(() {});

                          ///
                          // if (true) {

                          //   int resp = await sqlDb.updatehData(
                          //       'user',
                          //       {
                          //         'name': '${name.text}',
                          //         'email': '${email.text}',
                          //         'ImagePath': "${imageNewName}",
                          //       },
                          //       '${widget.id}');

                          // if (resp > 0) {
                          //   print('$resp    changed===========4===');
                          //   print(resp);

                          //   setState(() {
                          //     // UserAuthClass user = UserAuthClass();
                          //     isVerified = true;
                          //     allow = false;
                          //   });
                          // }
                        }
                      }
                    },
                    child: Container(
                      height: 50,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(colors: [
                            Color.fromRGBO(71, 78, 205, 1),
                            Color.fromRGBO(40, 44, 135, 0.6),
                          ])),
                      child: Center(
                        child: Text(
                          "enter",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 70,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
