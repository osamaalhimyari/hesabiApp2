import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hesabi_app/contents/Settings.dart';
import 'package:hesabi_app/contents/Syslist.dart';
import 'package:hesabi_app/contents/image_container.dart';
// import 'package:hesabi_app/contents/image_container.dart';
import 'package:hesabi_app/contents/tools.dart';

// import 'package:hesabi_app/contents/image_container.dart';
import 'package:hesabi_app/contents/theme.dart';
import 'package:hesabi_app/main.dart';

import 'package:hesabi_app/pages/pageForDrower.dart';
import '../models/select.dart';
import '../pages/DetailsPage.dart';
// import '../contents/tools.dart';
import '../models/routes.dart';
// import '../contents/image_container.dart';

// import 'package:hesabi_app/DataClass.dart';

class DrawerFb2 extends StatelessWidget {
  const DrawerFb2(
      this.index, this.id, this.name, this.email, this.number, this.imageUrl,
      {super.key});
  final int index;
  final int id;
  final String name;
  final String email;
  final String number;
  final File imageUrl;
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
                height: AppBar().preferredSize.height -
                    (AppBar().preferredSize.height / 100)),
            SizedBox(
              height: 30,
            ),
            // themeMode(),
            // SysMenuItem(context, 0),
            // const SizedBox(height: 5),

            SizedBox(
              // height: 150,
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      // mainAxisSize: MainAxisSize.max,
                      // crossAxisAlignment: CrossAxisAlignment.,
                      children: [
                        Expanded(
                          flex: 2,
                          child: InkWell(
                            onTap: () {
                              sysRouting(
                                  context,
                                  detailspage(index, id, name, email, number,
                                      File(imageUrl.path), 'user', 'nothing'));

                              print("$name   ====");
                            },
                            child: SysCircularImage(
                                File(
                                    "${defoultFilePath!.path}/${imageUrl.path}"),
                                70,
                                70,
                                0,
                                50),
                          ),
                        ),
                        Expanded(
                            flex: 3,
                            child: SizedBox(
                              width: double.minPositive,
                            )),
                        Expanded(
                          flex: 2,
                          child: SizedBox(
                            child: themeMode(iconColor: Colors.white),
                          ),
                        )
                      ],
                    ),
                    SysgreatText(name, 20, Colors.white, FontWeight.normal, 0),
                    SysgreatText(email, 20, Colors.white, FontWeight.normal, 0),
                    // SizedBox(
                    //   height: 10,
                    // ),
                    Divider(
                      thickness: 2,
                    )
                  ],
                ),
              ),
            ),
            // UserAccountsDrawerHeader(
            //   // currentAccountPictureSize: Size(80, 80),
            //   // otherAccountsPictures: [],
            //   accountName: Text(name),
            //   accountEmail: Text(email),
            //   currentAccountPicture: InkWell(
            //     onTap: () {
            //       sysRouting(
            //           context,
            //           detailspage(index, id, name, email, number,
            //               File(imageUrl.path), 'user', 'nothing'));

            //       print("$name   ====");
            //     },
            //     child: SysCircularImage(
            //         File("${defoultFilePath!.path}/${imageUrl.path}"),
            //         50,
            //         50,
            //         0,
            //         50),
            //   ),
            //   decoration: BoxDecoration(
            //       // color: Color.fromRGBO(27, 30, 92, 0.6),
            //       ),

            //   // onDetailsPressed: () {
            //   //   Container(
            //   //     height: 100,
            //   //     width: 100,
            //   //     color: Colors.red,
            //   //   );
            //   // }
            // ),
            // // const Divider(),
            const SizedBox(height: 12),

            MenuItem(
              text: 'frieds',
              icon: Icons.people,
              onClicked: () {
                sysRouting(
                    context,
                    PageForDrower(SysList(
                      static: true,
                      list: person + arciveList,
                      canBePressed: false,
                      alterScreen: alterScreen(
                          text: 'nothing is here currently',
                          buttonicon: Icons.people_alt_outlined,
                          onpressed: () {}),
                      archivedval: 0,
                      active: 0,
                      trashedval: 1,
                      iconArchive: Icons.home_outlined,
                      iconDelete: Icons.delete_outline,
                      txtArchive: 'send back',
                      txtdelete: 'delete',
                    )));
              },
            ),
            const SizedBox(height: 5),
            MenuItem(
              text: ' trashList',
              icon: Icons.delete_outline,
              onClicked: () {
                sysRouting(
                    context,
                    PageForDrower(SysList(
                      static: true,
                      list: trashList,
                      canBePressed: false,
                      alterScreen: alterScreen(
                          text: ' trashList is empty',
                          buttonicon: Icons.delete,
                          onpressed: () {}),
                      archivedval: 0,
                      active: 0,
                      trashedval: 0,
                      iconArchive: Icons.home_outlined,
                      iconDelete: Icons.delete_outline,
                      txtArchive: 'send back',
                      txtdelete: 'delete',
                    )));
              },
            ),
            const SizedBox(height: 5),
            MenuItem(
              text: 'Workflow',
              icon: Icons.workspaces_outline,
              onClicked: () => selectedItem(context, 2),
            ),
            const SizedBox(height: 5),
            MenuItem(
              text: 'Updates',
              icon: Icons.update,
              onClicked: () => selectedItem(context, 3),
            ),
            const SizedBox(height: 8),
            const Divider(),
            const SizedBox(height: 8),
            MenuItem(
              text: 'Notifications',
              icon: Icons.notifications_outlined,
              onClicked: () => selectedItem(context, 5),
            ),
            const SizedBox(height: 5),
            MenuItem(
              text: 'Settings',
              icon: Icons.settings,
              onClicked: () => sysRouting(context, const SqlComands()),
              // selectedItem(context, 6),
            ),
            // ButtonMenue(),
          ],
        ),
      ),
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();
    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Scaffold(), // Page 1
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Scaffold(), // Page 2
        ));
        break;
    }
  }
}

class MenuItem extends StatefulWidget {
  final String text;
  final IconData icon;
  final VoidCallback? onClicked;

  const MenuItem({
    required this.text,
    required this.icon,
    this.onClicked,
    Key? key,
  }) : super(key: key);

  @override
  State<MenuItem> createState() => _MenuItemState();
}

class _MenuItemState extends State<MenuItem> {
  @override
  void initState() {
    //

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      tileColor: Colors.transparent,
      leading: Icon(
        widget.icon,
        color: Colors.white,
      ),
      title: Text(
        widget.text,
        style: TextStyle(
          color: Colors.white,
        ),
      ),
      // hoverColor: hoverColor,
      onTap: widget.onClicked,
    );
  }
}

class UserIcon extends StatelessWidget {
  const UserIcon(this.imageurl, {Key? key}) : super(key: key);
  final String imageurl;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 50,
      decoration: BoxDecoration(
        color: Colors.blue,
        shape: BoxShape.circle,
        image: DecorationImage(image: AssetImage(imageurl), fit: BoxFit.cover),
      ),
    );
  }
}
