import 'package:flutter/material.dart';

void main() {
  runApp(const EasyNotepadApp());
}

class EasyNotepadApp extends StatelessWidget {
  const EasyNotepadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Easy Notepad',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const NotepadHome(),
    );
  }
}

class NotepadHome extends StatefulWidget {
  const NotepadHome({super.key});

  @override
  State<NotepadHome> createState() => _NotepadHomeState();
}

class _NotepadHomeState extends State<NotepadHome> {
  final TextEditingController _controller = TextEditingController();
  List<String> notes = [];

  void _saveNote() {
    if (_controller.text.trim().isNotEmpty) {
      setState(() {
        notes.add(_controller.text.trim());
        _controller.clear();
      });
    }
  }

  void _clearNotes() {
    setState(() {
      notes.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Easy Notepad'),
        actions: [
          IconButton(onPressed: _clearNotes, icon: const Icon(Icons.delete)),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(12.0),
            child: TextField(
              controller: _controller,
              maxLines: null,
              decoration: const InputDecoration(
                hintText: 'Write your note here...',
                border: OutlineInputBorder(),
              ),
            ),
          ),
          ElevatedButton(onPressed: _saveNote, child: const Text('Save Note')),
          const SizedBox(height: 10),
          Expanded(
            child: ListView.builder(
              itemCount: notes.length,
              itemBuilder: (_, index) => ListTile(
                title: Text(notes[index]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
