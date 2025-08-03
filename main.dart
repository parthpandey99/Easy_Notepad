import 'package:flutter/material.dart';
import 'package:flutter_painter/flutter_painter.dart';

void main() => runApp(const EasyNotepad());

class EasyNotepad extends StatelessWidget {
  const EasyNotepad({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NotepadScreen(),
    );
  }
}

class NotepadScreen extends StatefulWidget {
  @override
  _NotepadScreenState createState() => _NotepadScreenState();
}

class _NotepadScreenState extends State<NotepadScreen> {
  late FlutterPainterController controller;

  @override
  void initState() {
    super.initState();
    controller = FlutterPainterController();
  }

  void clearCanvas() {
    setState(() {
      controller.clearDrawables();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Easy Notepad")),
      body: FlutterPainter(controller: controller),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.clear),
        onPressed: clearCanvas,
      ),
    );
  }
}