import 'dart:convert';

import 'package:flutter/material.dart';
import '../Model/Note.dart';
import '../Database/database.dart';
import 'NoteDetail.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NoteListScreen extends StatefulWidget {
  const NoteListScreen({Key? key}) : super(key: key);

  @override
  State<NoteListScreen> createState() => _NoteListScreenState();
}

class _NoteListScreenState extends State<NoteListScreen> {
  final DatabaseHelper _dbHelper = DatabaseHelper.instance;
  late Future<List<Note>> _notesFuture;
  String? _currentUsername;

  @override
  void initState() {
    super.initState();
    _loadCurrentUser();
    _refreshNotes();
  }

  Future<void> _loadCurrentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? currentUser = prefs.getString('current_user');
    if (currentUser != null) {
      final user = Map<String, dynamic>.from(json.decode(currentUser));
      setState(() {
        _currentUsername = user['username'];
      });
    }
  }

  void _refreshNotes() {
    setState(() {
      _notesFuture = _dbHelper.getNotes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Notes'),
        centerTitle: true, // Căn giữa tiêu đề AppBar
      ),
      body: FutureBuilder<List<Note>>(
        future: _notesFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(
                child: Text('Error: ${snapshot.error}',
                    style: const TextStyle(fontSize: 18))); // TextStyle cho error
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(
                child: Text('No notes yet', style: TextStyle(fontSize: 18))); // TextStyle cho "No notes yet"
          }

          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              final note = snapshot.data![index];
              final bool isOwner = _currentUsername == note.username;

              return Card(
                margin: const EdgeInsets.all(8),
                elevation: 3, // Đổ bóng cho Card
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Bo tròn góc Card
                ),
                child: ListTile(
                  title: Text(
                    note.title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ), // TextStyle cho title
                  ),
                  subtitle: Text(
                    'By: ${note.username}\n${note.content}',
                    style: const TextStyle(fontSize: 14),
                  ), // TextStyle cho subtitle
                  isThreeLine: true,
                  trailing: isOwner
                      ? IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red), // Icon màu đỏ cho delete
                    onPressed: () async {
                      await _dbHelper.deleteNote(note.id!);
                      _refreshNotes();
                    },
                  )
                      : null,
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const NoteDetail(), // Không truyền note
            ),
          );
          _refreshNotes();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}