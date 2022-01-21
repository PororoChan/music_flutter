import 'package:music_flutter/models/adminModel.dart';

abstract class AdminContract {
  void onAddSuccess(List<Admin> admin);
  void onAddFailed(String message);
}
