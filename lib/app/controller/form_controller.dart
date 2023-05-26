import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vesti_task/app/model/skill_model.dart';
import 'package:vesti_task/app/model/staff_model.dart';

class StaffController extends GetxController {
  final Rx<List<Staff>> _staff = Rx<List<Staff>>([]);
  Rx<List<Staff>> get staff => _staff;
  final Rx<List<Skill>> _skill = Rx<List<Skill>>([]);
  Rx<List<Skill>> get skill => _skill;
  TextEditingController emailAddyController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController skillController1 = TextEditingController();
  TextEditingController skillController2 = TextEditingController();
  TextEditingController skillController3 = TextEditingController();
  late Staff stafff;
  late Skill skilll;
  var itemCount = 0.obs;
  var userNumber = 0.obs;
  var skillNumber = ''.obs;
  var skillCount = 0.obs;
  var emailText = '';

  int getUserNumber() {
    if (itemCount.value == 1) {
      return userNumber.value = 1;
    }
    if (itemCount.value == 2) {
      return userNumber.value = 2;
    }
    if (itemCount.value == 3) {
      return userNumber.value = 3;
    }
    if (itemCount.value == 4) {
      return userNumber.value = 4;
    }
    if (itemCount.value == 5) {
      return userNumber.value = 5;
    }
    if (itemCount.value == 6) {
      return userNumber.value = 6;
    }
    return 0;
  }

  String getSkillNumber() {
    if (skillCount.value == 0) {
      return skillNumber.value = 'One';
    }
    if (skillCount.value == 1) {
      return skillNumber.value = 'Two';
    }
    if (skillCount.value == 2) {
      return skillNumber.value = 'Three';
    }
    if (skillCount.value == 3) {
      return skillNumber.value = 'four';
    }
    return '';
  }

  bool emailAlreadyExists(String email) {
    return staff.value.any((element) => element.emailAddress == email);
  }

  void addStaff(Staff staff) {
    _staff.value.add(staff);
  }

  addSttaff(String emailAddy, String fullName, String skills) {
    stafff = Staff(skills, fullName, emailAddy);
    if (emailAlreadyExists(emailAddyController.text)) {
      return Get.snackbar(
          backgroundColor: Colors.red,
          "Email Address Error",
          "No two User can have the same emaill Address");
    }
    if (emailAddyController.text.isEmpty) {
      return Get.snackbar(
          backgroundColor: Colors.red,
          "Error",
          "Please fill all the required box");
    }
    if (fullNameController.text.isEmpty) {
      return Get.snackbar(
          backgroundColor: Colors.red,
          "Error",
          "Please fill all the required box");
    }
    if (skillController1.text.isEmpty) {
      return Get.snackbar(
          backgroundColor: Colors.red,
          "Error",
          "Please fill all the required box");
    }

    staff.value.add(stafff);
    emailAddyController.text = emailAddy;

    itemCount.value = staff.value.length;
  }

  removeSttaff(String emailAddy, String fullName, String skills) {
    stafff = Staff(skills, fullName, emailAddy);

    staff.value.removeLast();
    itemCount.value = staff.value.length;
  }

  addSkills(
    String description,
  ) {
    skilll = Skill(description);
    skill.value.add(skilll);
    skillCount.value = skill.value.length;
  }

  removeSkills(
    String description,
  ) {
    skilll = Skill(description);
    skill.value.removeLast();
    skillCount.value = skill.value.length;
  }

  remove(int index) {
    staff.value.removeAt(index);
    itemCount.value = staff.value.length;
  }

  void removeStaff(Staff staff) {
    _staff.value.remove(staff);
  }

  // void addSkill(Staff staff, Skill skill) {
  //   staff.skills.add(skill);
  //
  //   print("add");
  // }

  // void removeSkill(Staff staff, String skill) {
  //   staff.skills.remove(skill);
  // }

  @override
  void onClose() {
    // TODO: implement onClose
    emailAddyController.dispose();
    fullNameController.dispose();
    skillController1.dispose();
    skillController2.dispose();
    skillController3.dispose();
    super.onClose();
  }
}
