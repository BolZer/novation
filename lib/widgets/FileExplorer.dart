import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class FileExplorer extends StatefulWidget {
  FileExplorer({Key key}) : super(key: key);

  @override
  _FileExplorerState createState() => _FileExplorerState();
}

class _FileExplorerState extends State<FileExplorer> {
  @override
  Widget build(BuildContext context) {

    var _files = FilePicker.getMultiFilePath(type: FileType.AUDIO, fileExtension: 'mp3').then((Map<String, String> files) {
      var test = 0;
    });

    return Scaffold(
        body: SafeArea(
      child: Column(
        children: <Widget>[
          Expanded(
            child: Center(child: Text("FileExplorer")),
          )
        ],
      ),
    ));
  }
}
