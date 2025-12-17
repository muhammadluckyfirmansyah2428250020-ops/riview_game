import 'package:shared_preferences/shared_preferences.dart';
import 'package:crypto/crypto.dart';
import 'dart:convert';

class AuthService {
  static const String _isLoggedInKey = 'isLoggedIn';
  static const String _emailKey = 'email';
  static const String _passwordKey = 'password';  // Disimpan sebagai hash

  // Hash password untuk keamanan dasar
  static String _hashPassword(String password) {
    return sha256.convert(utf8.encode(password)).toString();
  }

  // Simpan data pengguna saat sign up
  static Future<void> signUp(String name, String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_emailKey, email);
    await prefs.setString(_passwordKey, _hashPassword(password));
    // Anda bisa tambahkan penyimpanan nama jika diperlukan
  }

  // Cek login
  static Future<bool> signIn(String email, String password) async {
    final prefs = await SharedPreferences.getInstance();
    final storedEmail = prefs.getString(_emailKey);
    final storedPassword = prefs.getString(_passwordKey);

    if (storedEmail == email && storedPassword == _hashPassword(password)) {
      await prefs.setBool(_isLoggedInKey, true);
      return true;
    }
    return false;
  }

  // Cek apakah user sudah login
  static Future<bool> isLoggedIn() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(_isLoggedInKey) ?? false;
  }

  // Logout
  static Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isLoggedInKey, false);
  }

  // Ambil email user yang sedang login
  static Future<String?> getCurrentUserEmail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getString(_emailKey);
  }
}