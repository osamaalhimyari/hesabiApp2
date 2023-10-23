// - - - - - - - - - - - - Instructions - - - - - - - - - - - - - -
// Place AppBarFhesabi_app inside the app bar property of a Scaffold
// - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

// import 'package:flutter/cupertino.dart';

// ignore_for_file: unused_local_variable, file_names

import 'package:flutter/material.dart';
// import 'package:hesabi_app/contents/image_container.dart';
// import '../contents/systemCore.dart';

// import '../contents/theme.dart';

// import '../contents/theme.dart';

// import '../contents/dialog.dart';
import '../contents/form.dart';
// import 'package:hesabi_app/drawer.dart';

class AppBarFb2 extends StatefulWidget implements PreferredSizeWidget {
  @override
  final Size preferredSize;
  final String title;
  final List<Widget> actions;
  final PreferredSizeWidget? bottom;
  const AppBarFb2({
    this.bottom,
    required this.title,
    required this.actions,
    Key? key,
  })  : preferredSize = bottom == null
            ? const Size.fromHeight(56.0)
            : const Size.fromHeight(100.0),
        super(key: key);

  @override
  State<AppBarFb2> createState() => _AppBarFb2State();
}

class _AppBarFb2State extends State<AppBarFb2> {
  var sys = SystemInsertForm();
  //for calling  this widget
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(widget.title, style: const TextStyle(color: Colors.white)),
      actions: widget.actions,
      bottom: widget.bottom,
    );
  }
}
