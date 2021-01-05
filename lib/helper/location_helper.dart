import 'package:permission_handler/permission_handler.dart';

class LocationHelper {
  Future<PermissionStatus> getPermissionStatus(Permission permission) async {
    return await permission.status;
  }
}