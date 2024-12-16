import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../Model/Note.dart';

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._();
  static const String notesKey = 'notes'; // Khóa dùng để lưu danh sách ghi chú

  DatabaseHelper._();

  /// Thêm ghi chú
  Future<void> insertNote(Note note) async {
    final prefs = await SharedPreferences.getInstance();

    // Lấy danh sách ghi chú hiện tại
    final String? existingNotes = prefs.getString(notesKey);
    List<Map<String, dynamic>> notes = existingNotes != null
        ? List<Map<String, dynamic>>.from(json.decode(existingNotes))
        : [];

    // Lấy ID cuối cùng và tăng lên
    int lastId = prefs.getInt('last_note_id') ?? 0;
    note.id = lastId + 1;

    // Cập nhật ID cuối cùng
    await prefs.setInt('last_note_id', note.id!);

    // Thêm ghi chú mới
    notes.add(note.toMap());

    // Lưu danh sách ghi chú
    await prefs.setString(notesKey, json.encode(notes));
  }

  /// Lấy danh sách ghi chú
  Future<List<Note>> getNotes() async {
    final prefs = await SharedPreferences.getInstance();
    final String? existingNotes = prefs.getString(notesKey);

    if (existingNotes != null) {
      // Chuyển chuỗi JSON thành danh sách Map
      List<Map<String, dynamic>> notes = List<Map<String, dynamic>>.from(json.decode(existingNotes));
      return notes.map((noteMap) => Note.fromMap(noteMap)).toList();
    }
    return [];
  }

  /// Xóa ghi chú theo ID
  Future<void> deleteNote(int id) async {
    final prefs = await SharedPreferences.getInstance();
    final String? existingNotes = prefs.getString(notesKey);

    if (existingNotes != null) {
      // Chuyển chuỗi JSON thành danh sách Map
      List<Map<String, dynamic>> notes = List<Map<String, dynamic>>.from(json.decode(existingNotes));

      // Xóa ghi chú theo ID
      notes.removeWhere((noteMap) => noteMap['id'] == id);

      // Lưu lại danh sách ghi chú sau khi xóa
      await prefs.setString(notesKey, json.encode(notes));
    }
  }

}
