import 'dart:isolate';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_downloader/flutter_downloader.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';


class MovieDetailsButtons extends StatefulWidget {
  const MovieDetailsButtons({Key? key,required this.url}) : super(key: key);

  final String url;
  @override
  State<MovieDetailsButtons> createState() => _MovieDetailsButtonsState();
}

class _MovieDetailsButtonsState extends State<MovieDetailsButtons> {

  int progress = 0;
  final ReceivePort _receivePort = ReceivePort();
  
  static downloadingCallback(id, status, progress) {
    //Looking up for a send port
    SendPort? sendPort = IsolateNameServer.lookupPortByName("downloading");

    //Sending the data
    sendPort?.send([id, status, progress]);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    //register a send port for the other isolates
    IsolateNameServer.registerPortWithName(_receivePort.sendPort, "downloading");

    //Listening for the data that is coming from other isolates
    _receivePort.listen((message) {
      setState(() {
        progress = message[2];
      });
    });
    FlutterDownloader.registerCallback(downloadingCallback);
  }
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color(0xFF292837),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color(0xFF292837).withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 4,
                ),
              ],
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
              size: 35,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color(0xFF292837),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF292837).withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                  ),
                ]
            ),
            child: const Icon(
              Icons.share,
              color: Colors.white,
              size: 35,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color(0xFF292837),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF292837).withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                  ),
                ]
            ),
            child: const Icon(
              Icons.thumb_up,
              color: Colors.white,
              size: 35,
            ),
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
                color: const Color(0xFF292837),
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: const Color(0xFF292837).withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 4,
                  ),
                ]
            ),
            child: InkWell(
              child: const Icon(
                Icons.download,
                color: Colors.white,
                size: 35,
              ),
              onTap: () async {
                final status = await Permission.storage.request();

                if(status.isGranted) {
                  final externalDirectory = await getExternalStorageDirectory();

                  final id = await FlutterDownloader.enqueue(
                    url: widget.url?? "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4",
                    savedDir: externalDirectory!.path,
                    fileName: "Download",
                    showNotification: true,
                    openFileFromNotification: true,

                  );
                }
                else {
                  print("Permission Denied");
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

