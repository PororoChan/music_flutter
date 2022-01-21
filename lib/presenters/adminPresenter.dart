import 'package:music_flutter/contract/adminContract.dart';
import 'package:music_flutter/models/adminModel.dart';
import 'package:music_flutter/services/adminService.dart';

class AdminPresenter {
  AdminService adminService = AdminService();
  late AdminContract _adminContract;

  void loadData() async {
    adminService
        .loadData()
        .then((value) => _adminContract.onAddSuccess(value))
        .catchError((message) {
      _adminContract.onAddFailed(message);
    });
  }

  set adminContract(AdminContract adminContract) {
    _adminContract = adminContract;
  }
}
