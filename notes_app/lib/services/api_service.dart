import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/note.dart';

class ApiService {
  // ⚙️ Your Spring Boot backend base URL
  static const String baseUrl = "http://10.189.33.73:8080";

  // 🟢 GET all notes
  static Future<List<Note>> getNotes() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/notes'));

      if (response.statusCode == 200) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((e) => Note.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load notes. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching notes: $e');
    }
  }

  // 🟡 POST add new note
  static Future<void> addNote(String title, String content) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/notes'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'title': title, 'content': content}),
      );

      if (response.statusCode != 200 && response.statusCode != 201) {
        throw Exception('Failed to add note. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error adding note: $e');
    }
  }

  // 🔴 DELETE note by ID
  static Future<void> deleteNote(String id) async {
    try {
      final response = await http.delete(Uri.parse('$baseUrl/notes/$id'));

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Failed to delete note. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error deleting note: $e');
    }
  }

  // 🟣 PUT update note by ID
  static Future<void> updateNote(String id, String title, String content) async {
    try {
      final response = await http.put(
        Uri.parse('$baseUrl/notes/$id'),
        headers: {'Content-Type': 'application/json'},
        body: json.encode({'title': title, 'content': content}),
      );

      if (response.statusCode != 200 && response.statusCode != 204) {
        throw Exception('Failed to update note. Status: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error updating note: $e');
    }
  }
}
