import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SnackBarView extends StatefulWidget {
   final String message;
   final int status;
  const SnackBarView(this.message, this.status, {super.key});

  @override
  State<SnackBarView> createState() => _SnackBarState();
}

class _SnackBarState extends State<SnackBarView> {



  void showSnackBar(String message, int status) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      behavior: SnackBarBehavior.floating,
      backgroundColor: status == 1000 ? CupertinoColors.activeGreen : Colors.redAccent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(24),
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 100,
          right: 20,
          left: 20),
    ));
  }


  @override
  Widget build(BuildContext context) {
  showSnackBar(widget.message, widget.status);
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: new Scaffold(
            body: new Text("Simple Text")
        )
    );
  }
}
