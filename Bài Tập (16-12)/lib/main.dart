import 'package:flutter/material.dart';
import './Screen/NoteList.dart';
import './Screen/WelcomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple Notes',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WelcomeScreen(),
    );
  }
}

class NotesScreen extends StatefulWidget {
  @override
  _NotesScreenState createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  List<String> notes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ghi chú'),
      ),
      body: ListView.builder(
        itemCount: notes.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(notes[index]),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _addNote(context);
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void _addNote(BuildContext context) async {
    final result = await showDialog<Map<String, String>>(
      context: context,
      builder: (context) {
        String newTitle = '';
        String newContent = '';
        return AlertDialog(
          title: Text('Thêm ghi chú mới'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                decoration: InputDecoration(hintText: 'Tiêu đề'),
                onChanged: (value) {
                  newTitle = value;
                },
              ),
              TextField(
                decoration: InputDecoration(hintText: 'Nội dung'),
                onChanged: (value) {
                  newContent = value;
                },
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('Hủy'),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, {'title': newTitle, 'content': newContent}),
              child: Text('Thêm'),
            ),
          ],
        );
      },
    );
    if (result != null && result['title']!.isNotEmpty && result['content']!.isNotEmpty) {
      setState(() {
        notes.add('${result['title']}\n${result['content']}');
      });
    }
  }
}