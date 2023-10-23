import 'dart:async';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:hesabi_app/main.dart';
import '../contents/Syslist.dart';
// import 'package:hesabi_app/data.dart';
// // import 'package:hesabi_app/DetailsPage.dart';
// import 'package:hesabi_app/list.dart';
import '../contents/dialog.dart';
import '../contents/tools.dart';
import '../layout/appBar.dart';
import '../layout/drawer.dart';
import '../layout/header.dart';
// import 'package:persistent_header_adaptive/adaptive_height_sliver_persistent_header.dart';
import 'package:persistent_header_adaptive/persistent_header_adaptive.dart';

import '../models/sqldb.dart';

/// header
///

// class slideHeader extends StatelessWidget {
//   const slideHeader({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return ;
//   }
// }

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

const primaryColor = Color.fromARGB(255, 43, 45, 118);

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (person.length != differentLength) {
        differentLength = person.length;
        setState(() {});
      } else {}
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // isVerified = true;

    return Directionality(
      textDirection: TextDirection.ltr,
      child: DefaultTabController(
          initialIndex: 0,
          length: 2,
          child: Scaffold(
            appBar: AppBarFb2(
              title: "حساباتي",
              actions: [
                Builder(
                  builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        child: Icon(
                          Icons.add,
                          color: Colors.white,
                          size: 30,
                        ),
                        // iconSize: 50,
                        onTap: () {
                          dialogForm(context);
                          print('hello');
                        },
                      ),
                    );
                  },
                )
              ],
              bottom: const TabBar(
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.home_outlined),
                  ),
                  Tab(
                    icon: Icon(Icons.archive_outlined),
                  ),
                  // Tab(
                  //   icon: Icon(Icons.brightness_5_sharp),
                  // ),
                ],
              ),
            ),
            drawer: DrawerFb2(0, 1, users.first['name'], users.first['email'],
                users.first['number'], File(users.first['imagePath'])),
            body: TabBarView(
              children: <Widget>[
                _body(
                    AdaptiveHeightSliverPersistentHeader(
                        floating: true,
                        child: Header(
                          child: SearchInputFb2(
                              searchController: TextEditingController(),
                              hintText: 'ابحث بالاسم'),
                          margin: 5,
                        )),
                    SysList(
                      static: false,
                      list: person,
                      canBePressed: true,
                      alterScreen: alterScreen(
                          text: 'click to add new friend',
                          buttonicon: Icons.add_circle,
                          onpressed: () {
                            dialogForm(context);
                          }),
                      active: 1,
                      archivedval: 1,
                      trashedval: 1,
                      txtArchive: 'archve',
                      iconArchive: Icons.archive_outlined,
                      txtdelete: 'delete',
                      iconDelete: Icons.delete_outline,
                    )),
                _body(
                    null,
                    SysList(
                      static: false,
                      list: arciveList,
                      canBePressed: false,
                      alterScreen: alterScreen(
                          text: 'archive page',
                          buttonicon: Icons.archive_outlined,
                          onpressed: () {
                            dialogForm(context);
                          }),
                      archivedval: 0,
                      active: 0,
                      trashedval: 1,
                      iconArchive: Icons.home_outlined,
                      iconDelete: Icons.delete_outline,
                      txtArchive: 'send back',
                      txtdelete: 'delete',
                    ))
              ],
            ),
          )),
    );
  }

/**
 * 

 IconButton(
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

       

* 
 */
  Widget _body(widget1, widget2) {
    setState(() {});
    return SafeArea(
      child: CustomScrollView(
        slivers: [widget1 ??= SliverToBoxAdapter(child: Text('')), widget2],
      ),
    );
  }
}

////