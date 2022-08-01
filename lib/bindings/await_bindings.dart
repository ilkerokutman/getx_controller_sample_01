import 'package:get/get.dart';
import 'package:getx_controller_sample_01/controllers/user.dart';

import '../controllers/app.dart';

class AwaitBindings extends Bindings {


  @override
  Future<void> dependencies() async {
    await Get.putAsync(() async => AppController(), permanent: true);
    await Get.putAsync(() async => UserController(), permanent: true);


    
  }
}
