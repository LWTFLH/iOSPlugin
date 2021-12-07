import 'package:flutter/material.dart';
import 'package:flutter_plugin_test/flutter_player_plugin.dart';
import 'package:flutter_plugin_test/ios_player.dart';

class PlayPage extends StatefulWidget {
  const PlayPage({Key? key}) : super(key: key);

  @override
  _PlayPageState createState() => _PlayPageState();
}

class _PlayPageState extends State<PlayPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
          child: Column(children: [
        Container(
          height: 30,
          child: InkWell(
            onTap: () {
              FlutterPlayerPlugin.fullScreen();
            },
            child: Text("tap"),
          ),
          color: Colors.amber,
        ),
        Expanded(child: IosPlayer())
      ])),
    );
  }
}
