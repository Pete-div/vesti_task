import 'package:get/get.dart';
import 'package:vesti_task/app/controller/form_controller.dart';

class StaffBinding extends Bindings {
  @override
  void dependencies() {
    // TODO: implement dependencies
    Get.lazyPut(() => StaffController());
  }
}
