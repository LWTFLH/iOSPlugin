import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class IosPlayer extends StatefulWidget {
  IosPlayer({Key? key}) : super(key: key);

  @override
  _IosPlayer createState() => _IosPlayer();
}

class _IosPlayer extends State<IosPlayer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 270,
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 270,
            child: _playerView(context),
          )
        ],
      ),
    );
  }

  Widget? _playerView(cxt) {
    if (Platform.isIOS) {
      return UiKitView(
        viewType: 'plugins/player',
        onPlatformViewCreated: _onPlatformViewCreated,
        creationParams: {
          'url':
              'https://www.apple.com/105/media/cn/researchkit/2016/a63aa7d4_e6fd_483f_a59d_d962016c8093/films/carekit/researchkit-carekit-cn-20160321_848x480.mp4'
        },
        creationParamsCodec: JSONMessageCodec(),
      );
    }
  }

  Future<void> _onPlatformViewCreated(int id) async {
    print("*****_onPlatformViewCreated*id=" + id.toString());
  }
}
