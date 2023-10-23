import 'dart:io';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:hesabi_app/models/UserModel.dart';
import 'package:hesabi_app/models/sqldb.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:flutter/services.dart';
// import 'package:simple_animations/animation_controller_extension/animation_controller_extension.dart';

late Directory? defoultFilePath;

String? language;
late bool didchanges = false;
late Color backColor;
late Color? pinTheme = ThemeData().listTileTheme.textColor;
// late Color? ColorContainer;
late IconData iconofTheme = Icons.light_mode;
late bool appthemeislight;
late bool changed = true;

var PermissionStorageStatus = Permission.storage.status;

late bool trashed = false;
late bool archived = false;

Image fetchImage(File gavinImage) {
  Image image;

  image = Image.file(File('${defoultFilePath!.path}/${gavinImage.path}'),
      height: double.infinity,
      width: double.infinity,
      alignment: Alignment.center,
      fit: BoxFit.cover, errorBuilder: (context, error, stackTrace) {
    return image = Image.file(File('${defoultFilePath!.path}/defoult.jpg'));
  });

  return image;
}

class ButtonMenue extends StatelessWidget {
  ButtonMenue({super.key});
  final List<String> lang = [
    'english',
    'العربية',
  ];

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    language ??= lang.first;
    return Container(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const SizedBox(height: 30),
              DropdownButtonFormField2<String>(
                // isExpanded: true,
                decoration: InputDecoration(
                  // Add Horizontal padding using menuItemStyleData.padding so it matches
                  // the menu padding when button's width is not specified.
                  contentPadding: const EdgeInsets.symmetric(vertical: 0),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // Add more decoration..
                ),
                hint: Text(
                  language!,
                  style: TextStyle(fontSize: 14),
                ),
                items: lang
                    .map((item) => DropdownMenuItem<String>(
                          value: item,
                          child: Text(
                            item,
                            style: const TextStyle(
                              fontSize: 14,
                            ),
                          ),
                        ))
                    .toList(),

                onChanged: (value) {
                  language = value;
                  _formKey.currentState!.save();
                },
                onSaved: (value) {
                  language = value.toString();
                },
                buttonStyleData: const ButtonStyleData(
                  padding: EdgeInsets.only(right: 8),
                ),
                iconStyleData: const IconStyleData(
                  icon: Icon(
                    Icons.arrow_drop_down,
                    color: Colors.black45,
                  ),
                  iconSize: 24,
                ),
                dropdownStyleData: DropdownStyleData(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                menuItemStyleData: const MenuItemStyleData(
                  padding: EdgeInsets.symmetric(horizontal: 16),
                ),
              ),
              // const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
