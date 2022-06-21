import 'package:flutter/material.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';

void main() => runApp(Xylophone());

class Xylophone extends StatelessWidget {
  final colors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
    Colors.teal,
    Colors.blue,
    Colors.purple
  ];

  List<Widget> buildNotesWidgets() {
    var wids = <Widget>[];
    for (var color in colors) {
      var wid = Expanded(
        child: TextButton(
          child: Container(
            color: color,
          ),
        onPressed: () => playNoteNumber(colors.indexOf(color)+1),
      ),);
      wids.add(wid);
    }
    return wids;
  }

  void playNoteNumber(int i) {
    FlutterRingtonePlayer.play(fromAsset: 'assets/note$i.wav');
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        body: SafeArea(
          child: Column(
            children: buildNotesWidgets(),
          ),
        ),
      ),
    );
  }
}
