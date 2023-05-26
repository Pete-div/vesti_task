// ignore_for_file: constant_identifier_names

import 'package:get/get.dart';
import 'package:vesti_task/app/binding/staff_binding.dart';
import 'package:vesti_task/app/ui/staff_form_view.dart';

class RouteHelper {
  static const String INITIAL_ROUTE = '/';

  static List<GetPage> routes = [
    GetPage(
        name: INITIAL_ROUTE,
        page: () => const StaffFormFieldView(),
        binding: StaffBinding()

        // page: () => Dashboard(),
        ),
  ];
}
