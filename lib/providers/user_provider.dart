import 'dart:convert';
import 'dart:io'; // Untuk deteksi platform selain web
import 'package:flutter/foundation.dart'; // Untuk kIsWeb
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../models/user.dart';

class UserProvider extends ChangeNotifier {
  String _userName = '';
  String _selectedUserName = '';
  List<User> _users = [];
  bool _isLoading = false;
  bool _hasMore = true;
  int _currentPage = 1;

  String get userName => _userName;
  String get selectedUserName => _selectedUserName;
  List<User> get users => _users;
  bool get isLoading => _isLoading;
  bool get hasMore => _hasMore;

  void setUserName(String name) {
    _userName = name;
    notifyListeners();
  }

  void setSelectedUserName(String name) {
    _selectedUserName = name;
    notifyListeners();
  }

  Future<void> fetchUsers({bool refresh = false}) async {
    if (_isLoading) return;

    if (refresh) {
      _currentPage = 1;
      _users.clear();
      _hasMore = true;
    }

    _isLoading = true;
    notifyListeners();

    try {
      // Default endpoint
      String baseUrl = 'https://reqres.in/api/users?page=$_currentPage&per_page=10';

      // 🔁 Gunakan proxy bypass jika dijalankan di web
      if (kIsWeb) {
        baseUrl =
            'https://cors-anywhere.herokuapp.com/https://reqres.in/api/users?page=$_currentPage&per_page=10';
        // ❗ Jika sudah dites, comment baris di atas & aktifkan baris bawah untuk akses normal
        // baseUrl = 'https://reqres.in/api/users?page=$_currentPage&per_page=10';
      }

      final response = await http.get(Uri.parse(baseUrl));

      print('Status Code: ${response.statusCode}');

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> usersData = data['data'];
        final List<User> newUsers =
            usersData.map((user) => User.fromJson(user)).toList();

        if (refresh) {
          _users = newUsers;
        } else {
          _users.addAll(newUsers);
        }

        _hasMore = _currentPage < data['total_pages'];
        _currentPage++;
      } else {
        print('❌ Gagal fetch data: ${response.statusCode}');
      }
    } catch (e) {
      print('❌ Exception saat fetch users: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
