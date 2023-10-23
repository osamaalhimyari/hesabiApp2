// ignore_for_file: file_names, slash_for_doc_comments, avoid_print

import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:jiffy/jiffy.dart';
// import 'package:flutter/rendering.dart';
// import 'package:hesabi_app/layout/drawer.dart';

// import 'package:hesabi_app/main.dart';

// import 'package:hesabi_app/models/routes.dart';
import '../models/sqldb.dart';
import 'Settings.dart';
import 'list.dart';

int differentLength = 0;
late int pageHolder = 0;

class SysList extends StatefulWidget {
  final bool static;
  final List<dynamic> list;
  final bool canBePressed;
  // final Widget? iconButton;
  final Widget alterScreen;
  // final int page;

  final int active;
  final int archivedval;
  final int trashedval;
  final String txtArchive;
  final IconData iconArchive;
  final String txtdelete;
  final IconData iconDelete;
  const SysList(
      {required this.static,
      required this.list,
      required this.canBePressed,
      // required this.iconButton,
      required this.alterScreen,
      required this.active,
      required this.archivedval,
      required this.trashedval,
      required this.txtArchive,
      required this.iconArchive,
      required this.txtdelete,
      required this.iconDelete,
      super.key});

  @override
  State<SysList> createState() => _SysListState();
}

final List person = [];
final List trashList = [];
final List arciveList = [];

class _SysListState extends State<SysList> {
  SqlDb sqlDb = SqlDb();
  bool isLoading2 = true;

  Future fetchData() async {
    List<Map> response =
        await sqlDb.customFetch('SELECT * FROM people WHERE active=0');

    person.clear();
    person.addAll(response);
    differentLength = person.length;
    isLoading2 = false;

    // for (int i = 0; i > person.length; i++) {
    //   if (person[i]['archived'] == 0) {
    //     trashList.add(person[i]);
    //   }
    // }
    if (mounted) {
      setState(() {});
      // fetchTrashData();
    } else {}
  }

  Future fetchTrashData() async {
    List<Map> response2 =
        await sqlDb.customFetch('SELECT * FROM people WHERE trashed=1');
    trashList.clear();
    trashList.addAll(response2);
    // differentLength = person.length;

    isLoading2 = false;

//  arciveList.addAll(response2.)

    if (mounted) {
      setState(() {});
      // fetchArchiveData();
    } else {}
  }

  Future fetchArchiveData() async {
    List<Map> response3 =
        await sqlDb.customFetch('SELECT * FROM people WHERE archived=1');
    arciveList.clear();
    arciveList.addAll(response3);
    isLoading2 = false;
    if (mounted) {
      setState(() {});
    } else {}
  }

  @override
  void initState() {
    fetchData();
    fetchTrashData();
    fetchArchiveData();

    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (person.length < differentLength || person.length == 0) {
        trashed == false;
        archived = false;

        fetchData();
        // setState(() {});  trashed == true ||
        // archived == true
      }
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (trashed == true) {
        trashed == false;
        fetchTrashData();
        // setState(() {});
      } else {}
    });
    Timer.periodic(const Duration(seconds: 1), (timer) {
      if (archived == true) {
        archived == false;
        fetchArchiveData();
        // setState(() {});
      } else {}
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isOption = (widget.static == true) ? true : false;
    return (isLoading2 == true)
        ? SliverToBoxAdapter(
            child: Center(
            child: CircularProgressIndicator(

                // backgroundColor: Colors.white,
                ),

            // backgroundColor: Colors.white,
            // ),
          ))
        : (widget.list.isEmpty || widget.list.length == 0)
            ? widget.alterScreen
            : SliverList.builder(
                addAutomaticKeepAlives: isLoading2,
                itemCount: widget.list.length,
                itemBuilder: (context, reversedIndex) {
                  final index = widget.list.length - reversedIndex - 1;
                  return widget.static == false
                      ? SwapeForList(
                          index,
                          widget.list,
                          widget.active,
                          widget.archivedval,
                          widget.trashedval,
                          widget.txtArchive,
                          widget.iconArchive,
                          widget.txtdelete,
                          widget.iconDelete,
                        )
                      : nonSwaplist(index, widget.list, isOption);
                },
              );
  }

  Widget nonSwaplist(index, List<dynamic> list, isOption) {
    int holdID = list[index]['id'];
    return cardlistFB2(
      index: index,
      id: list[index]['id'],
      name: ' ${list[index]['name']}',
      email: ' ${list[index]['email']}',
      number: ' ${list[index]['number']}', //'${person['name']}',
      imageUrl: File('${list[index]['imagePath']}'),
      title: '${list[index]['title']}', //'${person['title']}' '$index',
      canBePressed: widget.canBePressed,
      iconButtonOption: isOption,
      onselectMenue: (value) async {
        widget.list.removeAt(index);

        if (value == '0') {
          if (mounted) {
            await sqlDb.updatehData(
                'people',
                {
                  'archived': 0,
                  'trashed': 0,
                  'active': 0,
                  'dateModify': '${Jiffy.now().yMEd}:${Jiffy.now().hour}',
                },
                'id=$holdID');

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
      },
    );
  }

  GestureDetector SwapeForList(
      int index,
      List<dynamic> list,
      int active,
      int archivedval,
      int trashedval,
      String txtArchive,
      IconData iconArchive,
      String txtdelete,
      IconData iconDelete) {
    // pageHolder = page;
    //  final int archivedval = 0;
    //  final int trashedval = 0;
    //  final int active = 0;
    //  final String txtArchive = '';
    //  final String txtdelete = '';
    //  final IconData iconArchive = Icons.architecture;
    //  final IconData iconDelete = Icons.deblur;
    // switch (page) {
    //   case 1: // home page
    //     archivedval = 1;
    //     active = 1;
    //     trashedval = 1;
    //     iconArchive = Icons.archive_outlined;
    //     iconDelete = Icons.delete_outline;
    //     txtArchive = 'archve';
    //     txtdelete = 'delete';
    //     break;
    //   case 2: // archive page
    //     archivedval = 0;
    //     active = 0;
    //     trashedval = 1;
    //     iconArchive = Icons.home_outlined;
    //     iconDelete = Icons.delete_outline;
    //     txtArchive = 'send back';
    //     txtdelete = 'delete';
    //     break;
    //   case 3: //  trashList page
    //     archivedval = 0;
    //     active = 0;
    //     trashedval = 0;
    //     iconArchive = Icons.square;
    //     iconDelete = Icons.square;

    //     break;
    // }
    return GestureDetector(
      onTap: () {},
      child: Dismissible(

          // direction: DismissDirection.endToSta
          onUpdate: (details) {},
          confirmDismiss: (direction) {
            return Future.value(true);
          },

          // Each Dismissible must contain a Key. Keys allow Flutter to
          // uniquely identify widgets.
          key: Key("$index"),
          // Provide a function that tells the app
          // what to do after an item has been swiped away.
          onDismissed: (direction) async {
            // Remove the item from the data source.
            // setState(() {
            //   //  this.(widget.index);
            // });
            int holdId = list[index]['id'];
            widget.list.removeAt(index);
            // print(
            //     'active =$active , archive = $archivedval ,trash = $trashedval ');
            if (direction == DismissDirection.startToEnd) {
              await sqlDb.updatehData(
                  'people',
                  {
                    'archived': 0,
                    'trashed': 1,
                    'active': 1,
                    'dateModify': '${Jiffy.now().yMEd}:${Jiffy.now().hour}',
                  },
                  'id=$holdId');

              // print('$index    delete   $res     ==');

              if (this.mounted) {
                setState(() {
                  trashed = true;
                  differentLength++;
                });
              }
            } else {
              // widget.list.removeAt(index);
              print(
                  'active =$active , archive = $archivedval ,trash = $trashedval ');
              await sqlDb.updatehData(
                  'people',
                  {
                    'archived': archivedval,
                    'active': active,
                    'dateModify': '${Jiffy.now().yMEd}:${Jiffy.now().hour}',
                  },
                  'id=$holdId');

              // print('$index    delete   $res     ==');
              if (this.mounted) {
                ;
                setState(() {
                  archived = true;
                  differentLength++;
                  // page = page;
                });
              }
            }

            // Then show a snackbar.
          },
          // Show a red background as the item is swiped away.
          background: swipeAction(
              Colors.red, iconDelete, 'Delete', MainAxisAlignment.start),
          secondaryBackground: swipeAction(
              Colors.green, iconArchive, 'Archive', MainAxisAlignment.end),
          child: cardlistFB2(
            index: index,
            id: list[index]['id'],
            name: ' ${list[index]['name']}',
            email: ' ${list[index]['email']}',
            number: ' ${list[index]['number']}', //'${person['name']}',
            imageUrl: File('${list[index]['imagePath']}'),
            title: '${list[index]['title']}', //'${person['title']}' '$index',
            canBePressed: widget.canBePressed,
            iconButtonOption: widget.static == true ? true : false,
            onselectMenue: (value) {
              if (value == '0') {
                print('value = 0');
              } else if (value == '1') {
                print('value = 1');
              }
            },
          )),
    );
  }

  Container swipeAction(Color backgrooundcolor, IconData icon, String text,
      MainAxisAlignment alignment) {
    return Container(
      color: backgrooundcolor,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: alignment,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 15),
            )
          ],
        ),
      ),
    );
  }
}

//  static const TextTheme whiteCupertino = TextTheme(
//     display4   : TextStyle(debugLabel: 'whiteCupertino display4',   fontFamily: '.SF UI Display', inherit: true, color: Colors.white70, decoration: TextDecoration.none),
//     display3   : TextStyle(debugLabel: 'whiteCupertino display3',   fontFamily: '.SF UI Display', inherit: true, color: Colors.white70, decoration: TextDecoration.none),
//     display2   : TextStyle(debugLabel: 'whiteCupertino display2',   fontFamily: '.SF UI Display', inherit: true, color: Colors.white70, decoration: TextDecoration.none),
//     display1   : TextStyle(debugLabel: 'whiteCupertino display1',   fontFamily: '.SF UI Display', inherit: true, color: Colors.white70, decoration: TextDecoration.none),
//     headline   : TextStyle(debugLabel: 'whiteCupertino headline',   fontFamily: '.SF UI Display', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     title      : TextStyle(debugLabel: 'whiteCupertino title',      fontFamily: '.SF UI Display', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     subhead    : TextStyle(debugLabel: 'whiteCupertino subhead',    fontFamily: '.SF UI Text',    inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     body2      : TextStyle(debugLabel: 'whiteCupertino body2',      fontFamily: '.SF UI Text',    inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     body1      : TextStyle(debugLabel: 'whiteCupertino body1',      fontFamily: '.SF UI Text',    inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     caption    : TextStyle(debugLabel: 'whiteCupertino caption',    fontFamily: '.SF UI Text',    inherit: true, color: Colors.white70, decoration: TextDecoration.none),
//     button     : TextStyle(debugLabel: 'whiteCupertino button',     fontFamily: '.SF UI Text',    inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     subtitle   : TextStyle(debugLabel: 'whiteCupertino subtitle',   fontFamily: '.SF UI Text',    inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     overline   : TextStyle(debugLabel: 'whiteCupertino overline',   fontFamily: '.SF UI Text',    inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//   );

//  static const TextTheme whiteMountainView = TextTheme(
//     display4   : TextStyle(debugLabel: 'whiteMountainView display4',   fontFamily: 'Roboto', inherit: true, color: Colors.white70, decoration: TextDecoration.none),
//     display3   : TextStyle(debugLabel: 'whiteMountainView display3',   fontFamily: 'Roboto', inherit: true, color: Colors.white70, decoration: TextDecoration.none),
//     display2   : TextStyle(debugLabel: 'whiteMountainView display2',   fontFamily: 'Roboto', inherit: true, color: Colors.white70, decoration: TextDecoration.none),
//     display1   : TextStyle(debugLabel: 'whiteMountainView display1',   fontFamily: 'Roboto', inherit: true, color: Colors.white70, decoration: TextDecoration.none),
//     headline   : TextStyle(debugLabel: 'whiteMountainView headline',   fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     title      : TextStyle(debugLabel: 'whiteMountainView title',      fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     subhead    : TextStyle(debugLabel: 'whiteMountainView subhead',    fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     body2      : TextStyle(debugLabel: 'whiteMountainView body2',      fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     body1      : TextStyle(debugLabel: 'whiteMountainView body1',      fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     caption    : TextStyle(debugLabel: 'whiteMountainView caption',    fontFamily: 'Roboto', inherit: true, color: Colors.white70, decoration: TextDecoration.none),
//     button     : TextStyle(debugLabel: 'whiteMountainView button',     fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     subtitle   : TextStyle(debugLabel: 'whiteMountainView subtitle',   fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//     overline   : TextStyle(debugLabel: 'whiteMountainView overline',   fontFamily: 'Roboto', inherit: true, color: Colors.white,   decoration: TextDecoration.none),
//   );
