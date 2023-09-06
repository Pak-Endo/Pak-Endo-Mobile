import 'package:flutter_easyloading/flutter_easyloading.dart';

getLoader() async => await EasyLoading.show(status: 'Loading...');

getSuccess() async => await EasyLoading.showSuccess('Success');

getError(String error) async => await EasyLoading.showError('Error: $error');

getDismiss() async => await EasyLoading.dismiss();
