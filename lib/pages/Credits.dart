import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Credits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Padding(
              padding: EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      IconButton(
                        onPressed: (){
                          Navigator.pop(context);
                        },
                        icon: Icon(FontAwesomeIcons.arrowLeft),
                      ),
                      Expanded(
                        child: Center(child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 0.0),
                          child: Text("Credits", style: TextStyle(fontSize: 25.0)),
                        )),
                      )
                    ],
                  ),
                  Divider(),
                  Table(
                    defaultVerticalAlignment: TableCellVerticalAlignment.middle,
                    children: [
                      TableRow(children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Padding(padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0), child: Icon(FontAwesomeIcons.userAlt)),
                            ),
                            Expanded(
                              flex: 10,
                              child: Text(
                                "Developer",
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text("Jan Nöhles"),
                            )
                          ],
                        )
                      ]),
                      TableRow(children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Padding(padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0), child: Icon(FontAwesomeIcons.github)),
                            ),
                            Expanded(
                              flex: 10,
                              child: Text(
                                "Repository",
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text("{{Repository}}"),
                            )
                          ],
                        )
                      ]),
                      TableRow(children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Padding(padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0), child: Icon(FontAwesomeIcons.globe)),
                            ),
                            Expanded(
                              flex: 10,
                              child: Text(
                                "Homepage",
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text("{{Homepage}}"),
                            )
                          ],
                        )
                      ]),
                      TableRow(children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Padding(padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0), child: Icon(FontAwesomeIcons.fileSignature)),
                            ),
                            Expanded(
                              flex: 10,
                              child: Text(
                                "License",
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text("{{License}}"),
                            )
                          ],
                        )
                      ]),
                      TableRow(children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Padding(padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0), child: Icon(FontAwesomeIcons.codeBranch)),
                            ),
                            Expanded(
                              flex: 10,
                              child: Text(
                                "Version",
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text("{{Version}}"),
                            )
                          ],
                        )
                      ]),
                      TableRow(children: [
                        Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Padding(padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0), child: Icon(FontAwesomeIcons.calendarCheck)),
                            ),
                            Expanded(
                              flex: 10,
                              child: Text(
                                "Last Updated",
                                style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Expanded(
                              child: Text("{{Last Updated}}"),
                            )
                          ],
                        )
                      ]),
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 0.0),
                    child: Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Morbi ac purus posuere, porta nunc et, egestas felis. Fusce viverra rutrum bibendum. Morbi id tincidunt augue. Duis tempor mauris et dui dignissim, vitae varius est egestas. Nam in convallis augue. Maecenas a ullamcorper nisi, a congue lacus. Integer quis consequat lectus, gravida fringilla neque. Maecenas quam metus, convallis a pretium et, interdum in neque. Integer sapien nisi, vestibulum in porttitor vel, suscipit id velit.",
                        style: TextStyle(fontSize: 11.0)),
                  ),
                ],
              ),
            )));
  }
}
