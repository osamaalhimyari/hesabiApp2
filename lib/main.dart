// ignore_for_file: prefer_const_constructors, use_key_in_widget_constructors, prefer_const_literals_to_create_immutables

// import 'dart:io';

import 'dart:async';
import 'dart:io';
// import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:hesabi_app/auth/UserProfile.dart';

import 'package:hesabi_app/auth/authPage.dart';
import 'package:hesabi_app/contents/Settings.dart';
import 'package:hesabi_app/contents/theme.dart';

// import 'package:hesabi_app/auth/SignUpPage.dart';
// import 'package:hesabi_app/auth/UserProfile.dart';

// import 'package:hesabi_app/auth/authPage.dart';
//
// import 'package:hesabi_app/contents/Syslist.dart';

// import 'package:hesabi_app/models/UserModel.dart';
import 'package:hesabi_app/models/sqldb.dart';
// import 'package:jiffy/jiffy.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

import 'pages/homepage.dart';
// import 'package:jiffy/jiffy.dart';

void main() {
  runApp(InitApp());
}

class DateAndTime {
  DateAndTime();

  late String Date;
  late String Time;
  late String Day;
}

// class UserAuthClass {
//   UserAuthClass();

//   late int id;
//   late String? name;
//   late String? email;
//   late String? number;
//   late String? password;
//   late File imagePath;

//   late bool state = false;
// }
late bool isVerified;

class InitApp extends StatefulWidget {
  const InitApp({super.key});

  @override
  State<InitApp> createState() => _InitAppState();
}

late List users = [];

class _InitAppState extends State<InitApp> {
  bool isLoading = true;
  SqlDb sqlDb = SqlDb();
  late int id;
  bool delay = true;
  bool empty = true;

  DateTime date = DateTime.now();
  // UserAuthClass user = UserAuthClass();

  Future fetchData() async {
    var response = await sqlDb.fetchData('user');

    users.clear();
    users.addAll(response);

    if (users.length > 0) {
      id = users[0]['id'];
      isVerified = users[0]['locked'] == 0 ? true : false;

      print(users[0]['locked']);
      empty = false;
    }
    if (this.mounted) {
      isLoading = false;

      setState(() {});
    } else {
      users = [
        {
          'name': 'name',
          'email': 'email',
          'number': '123',
          'imagePath': 'defoult.jpg',
        }
      ];
    }
    // setState(() {});
  }

  Future getImageFileFromAssets(String fileName) async {
// String unique, String filename
    defoultFilePath = Platform.isAndroid
        ? await getExternalStorageDirectory()
        : await getApplicationDocumentsDirectory();

    File fullPath = File("${defoultFilePath!.path}/${fileName}".trim());
    // print(fullPath);
    // print(fullPath.exists());
    if (await fullPath.exists()) {
      print("image exists===${fileName}  ===== ");
    } else {
      print("image not exists===${fileName}  ===== ");

      ByteData byteData = await rootBundle.load("images/${fileName}");

      // this creates the file image
      File file = await File('${defoultFilePath!.path}/${fileName}'.trim())
          .create(recursive: true);

      // copies data byte by byte
      await file.writeAsBytes(byteData.buffer
          .asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));

      getImageFileFromAssets('male.png');
      getImageFileFromAssets('female.png');
    }

    // return File(defoultFilePath!.path);
  }

  PermissionStorageHolder() async {
    var PermissionStorageStatus = await Permission.storage.status;
    if (!PermissionStorageStatus.isGranted) {
      await Permission.storage.request();
    }
    if (PermissionStorageStatus.isGranted) {
      createFolder('hesabiApp');
    }
  }

  Future<String> createFolder(String folderName) async {
    final dir = Directory("storage/emulated/0/$folderName");

    if ((await dir.exists())) {
      print('exists');
      // print('${dir.path}');
      return dir.path;
    } else {
      print('not exists');

      dir.create();
      // print('${dir.path}');
      return dir.path;
    }
  }

  fetchtheme() async {
    List<Map> theme =
        await sqlDb.customFetch('select color from theme where id=1');
    print('theme is ${theme}');
    print('theme is ${theme[0]['color']}');
    if (theme[0]['color'] == 0) {
      iconofTheme = Icons.dark_mode;
    } else {
      iconofTheme = Icons.light_mode;
    }
  }

  @override
  void initState() {
    // to fetch user data
    fetchtheme();
    getImageFileFromAssets('defoult.jpg');

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (users.length == 0 || didchanges == true) {
        didchanges = false;
        fetchData();
      } else {}
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (changed == true) {
        changed == false;
        setState(() {});
      } else {}
    });
    // to create a folder if none
    PermissionStorageHolder();

    Future.delayed(Duration(seconds: 4), () {
      setState(() {
        isLoading = false;
        // user.isVerified = false;
        delay = false;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: delay == true
            ? Scaffold(
                // backgroundColor: Colors.white,

                body: Center(child: CircularProgressIndicator()))
            : (empty == true) //true
                ? UserProfilePage()
                : (isVerified == false)
                    ? AuthPage()
                    : Homepage(),
        theme: iconofTheme == Icons.dark_mode ? DarkTheme() : LightTheme());
  }

  ThemeData DarkTheme() {
    return ThemeData(
        colorScheme: ColorScheme(
            brightness: Brightness.dark,
            primary: Color.fromARGB(255, 4, 4, 4),
            onPrimary: Color.fromARGB(255, 255, 255, 255),
            secondary: Color.fromARGB(255, 255, 255, 255),
            onSecondary: Color.fromARGB(255, 3, 3, 4),
            error: Color.fromARGB(255, 140, 24, 24),
            onError: Color.fromARGB(255, 87, 95, 106),
            background: Color.fromARGB(255, 38, 45, 85),
            onBackground: Color.fromARGB(255, 176, 157, 176),
            surface: Color.fromARGB(255, 19, 23, 37),
            onSurface: Color.fromARGB(255, 255, 255, 255),
            outline: Color.fromARGB(255, 4, 5, 6),
            onTertiary: Color.fromARGB(255, 185, 202, 199)),
        drawerTheme:
            DrawerThemeData(backgroundColor: Color.fromARGB(255, 27, 32, 51)),
        scaffoldBackgroundColor: Color.fromARGB(255, 27, 32, 51),
        listTileTheme: ListTileThemeData(
            iconColor: MyThemes.accentColorDark,
            textColor: MyThemes.accentColorDark,
            tileColor: Color.fromARGB(255, 22, 22, 59),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        appBarTheme: AppBarTheme(
          backgroundColor: MyThemes.primaryColorDark,
          iconTheme: IconThemeData(color: MyThemes.accentColorDark),
        ),
        textSelectionTheme: TextSelectionThemeData(
          selectionHandleColor: Color.fromARGB(255, 235, 222, 222),
        ),
        progressIndicatorTheme: ProgressIndicatorThemeData(
            refreshBackgroundColor: Color.fromARGB(255, 27, 32, 51),
            color: Colors.white));
  }

  ThemeData LightTheme() {
    return ThemeData(
        secondaryHeaderColor: Colors.white,
        colorScheme: ColorScheme(
          brightness: Brightness.light,
          primary: Color.fromARGB(255, 42, 32, 128),
          onPrimary: Color.fromARGB(255, 255, 255, 255),
          secondary: Color.fromARGB(255, 239, 239, 239),
          onSecondary: Color.fromARGB(255, 235, 235, 235),
          error: Color.fromARGB(255, 140, 24, 24),
          onError: Color.fromARGB(255, 29, 108, 211),
          background: Color.fromARGB(255, 27, 26, 31),
          onBackground: Color.fromARGB(255, 21, 14, 21),
          surface: Color.fromARGB(255, 19, 23, 37),
          onSurface: Color.fromARGB(255, 26, 20, 20),
          outline: Color.fromARGB(255, 4, 5, 6),
          onTertiary: Color.fromARGB(255, 4, 181, 154),
        ),
        drawerTheme:
            DrawerThemeData(backgroundColor: Color.fromARGB(255, 20, 28, 94)),
        scaffoldBackgroundColor: Color.fromARGB(255, 251, 251, 251),
        cardTheme: CardTheme(color: Color.fromARGB(255, 239, 239, 242)),
        listTileTheme: ListTileThemeData(
            iconColor: Color.fromARGB(255, 27, 23, 23),
            textColor: Color.fromARGB(255, 17, 15, 15),
            tileColor: Color.fromARGB(255, 208, 208, 216),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20))),
        dividerColor: Color.fromARGB(255, 128, 132, 147),
        appBarTheme: AppBarTheme(
            backgroundColor: Color.fromARGB(255, 20, 28, 94),
            iconTheme: IconThemeData(color: MyThemes.accentColorDark)),
        textSelectionTheme: TextSelectionThemeData(
            selectionHandleColor: Color.fromARGB(255, 58, 56, 173)),
        progressIndicatorTheme: ProgressIndicatorThemeData(
            refreshBackgroundColor: Color.fromARGB(255, 27, 32, 51),
            color: Color.fromARGB(255, 34, 49, 153)),
        checkboxTheme: CheckboxThemeData(
            checkColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 17, 58, 99)),
            fillColor:
                MaterialStatePropertyAll(Color.fromARGB(255, 252, 252, 252))));
  }
}
