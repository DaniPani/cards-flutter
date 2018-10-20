import 'package:flutter/material.dart';
import 'dart:async';

class _HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<_HomePage> {
  Future<List<Map>> _listOfSets;
  @override
  void initState() {
    super.initState();
    _listOfSets = getListOfSets();
  }

  void refreshList() {
    setState(() {
      _listOfSets = getListOfSets();
    });
  }

  Future<List<Map>> getListOfSets() async {
    await Future.delayed(Duration(seconds: 2));

    List<Map> example = [
      {
        "kind": "drive#file",
        "id": "1Yncqd9oRWxqMZ8jLt6G3bdQqBdcWayEGHiT0dE3e6uA",
        "name": "Vocaboli tedesco 3°",
        "mimeType": "application/vnd.google-apps.spreadsheet"
      },
      {
        "kind": "drive#file",
        "id": "1AChafCFqkErcRGNfKsvx3O0ZhtVt_iJORDWNk4nF3cU",
        "name": "Vocaboli Francese",
        "mimeType": "application/vnd.google-apps.spreadsheet"
      },
      {
        "kind": "drive#file",
        "id": "17sv63gD0TDM4Z6hJcmtXRG2QhmI_P3sIyCO6u4yNBLc",
        "name": "Vocaboli Inglese",
        "mimeType": "application/vnd.google-apps.spreadsheet"
      },
    ];
    return example;
  }

  Widget _drawer() {
    return Drawer(
        child: ListView(children: <Widget>[
      ListTile(
        leading: Icon(Icons.folder_open),
        title: Text('Relocate Cards Folder'),
      ),
      ListTile(
        leading: Icon(Icons.assessment),
        title: Text('Analytics'),
      ),
      ListTile(
        leading: Icon(Icons.settings),
        title: Text('Settings'),
      ),
      Divider(color: Colors.black87),
      ListTile(
        leading: Icon(Icons.control_point),
        title: Text('Propose new features'),
      ),
      ListTile(
        leading: Icon(Icons.translate),
        title: Text('Help us translating'),
      ),
      ListTile(
        leading: Icon(Icons.feedback),
        title: Text('Send Feedback'),
      ),
    ]));
  }

  Widget _appBar() {
    return AppBar(
      title: Text('Home'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.add),
          onPressed: () {},
        ),
        IconButton(
          icon: Icon(Icons.edit),
          onPressed: () {},
        )
      ],
    );
  }

  Widget _buildListOfSets() {
    return Expanded(
        child: FutureBuilder(
            future: _listOfSets,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Container(
                    child: ListView.builder(
                  padding: const EdgeInsets.all(16.0),
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return _buildRow(snapshot.data[i]["name"]);
                  },
                ));
              } else if (snapshot.hasError) {
                return Text("${snapshot.error}");
              }

              return Center(child: CircularProgressIndicator());
            }));
  }

  Widget _buildRow(String name) {
    return Card(
        color: Colors.blueGrey[700],
        elevation: 5.9,
        child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
          ListTile(
            leading: const Icon(Icons.album, color: Colors.amber),
            title: Text(
              name,
              style:
                  TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
            ),
          )
        ]));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: _appBar(),
        floatingActionButton: FloatingActionButton(
            backgroundColor: Colors.purple,
            onPressed: refreshList,
            child: Icon(
              Icons.refresh,
            )),
        body: Container(
            padding: const EdgeInsets.fromLTRB(2.0, 20.0, 2.0, 0.0),
            child: Column(children: <Widget>[
              _buildListOfSets(),
            ])),
        backgroundColor: Colors.blueAccent,
        drawer: _drawer());
  }
}
