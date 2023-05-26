// ignore_for_file: annotate_overrides, unrelated_type_equality_checks

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:vesti_task/app/controller/form_controller.dart';
import 'package:vesti_task/app/ui/widget/base_button.dart';
import 'package:vesti_task/app/ui/widget/custom_textfield.dart';
import 'package:vesti_task/app/utilis/style/dimension.dart';
import 'package:vesti_task/app/utilis/style/spacing.dart';

class StaffFormFieldView extends GetView<StaffController> {
  const StaffFormFieldView({Key? key}) : super(key: key);

  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: TheDimensions.medium,
            left: TheDimensions.medium,
            right: TheDimensions.medium,
            bottom: TheDimensions.big,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VestiSpacing.veryLargeHeight(),
              Text(
                "Staff List",
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
              Obx(() {
                return controller.itemCount.value == 0
                    ? Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const VestiSpacing.bigHeight(),
                          Text(
                            "User 1",
                            style: Theme.of(context)
                                .textTheme
                                .labelMedium!
                                .copyWith(
                                    fontSize: 16,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700),
                          ),
                        ],
                      )
                    : Container();
              }),
              Obx(() {
                return controller.itemCount.value == 0
                    ? Container()
                    : SizedBox(
                        height: controller.skillCount.value == 1
                            ? (controller.skillCount.value == 1 ? 400 : 400)
                            : 400,
                        child: ListView.builder(
                            // physics: NeverScrollableScrollPhysics(),
                            itemCount: controller.itemCount.value,
                            itemBuilder: (context, index) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const VestiSpacing.bigHeight(),
                                  Text(
                                    "User ${index + 1}",
                                    style: Theme.of(context)
                                        .textTheme
                                        .labelMedium!
                                        .copyWith(
                                            fontSize: 16,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                  ),
                                  const VestiSpacing.bigHeight(),
                                  CustomTextField(
                                    readOnly: true,
                                    labelTxt:
                                        // controller.fullNameController.text,
                                        'Full name',
                                    hintText:
                                        controller.fullNameController.text,
                                    // controller: controller.fullNameController,
                                  ),
                                  const VestiSpacing.bigHeight(),
                                  CustomTextField(
                                    keyboardType: TextInputType.emailAddress,
                                    labelTxt: 'Email Address',
                                    readOnly: true,
                                    hintText:
                                        controller.emailAddyController.text,
                                    // controller: controller.emailAddyController,
                                  ),
                                  const VestiSpacing.bigHeight(),
                                  CustomTextField(
                                    labelTxt: "Skill One",
                                    hintText: controller.skillController1.text,
                                    readOnly: true,
                                  ),
                                  const VestiSpacing.bigHeight(),
                                  controller.skillCount == 0
                                      ? Container()
                                      : SizedBox(
                                          height: controller.skillCount == 1
                                              ? 50
                                              : 130,
                                          child: ListView.builder(
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  controller.skillCount.value,
                                              itemBuilder: (context, index) {
                                                return Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    CustomTextField(
                                                      readOnly: true,
                                                      labelTxt:
                                                          'Skill ${controller.getSkillNumber()}',
                                                      hintText: controller
                                                          .skillController2
                                                          .text,
                                                    ),
                                                    const VestiSpacing
                                                        .bigHeight(),
                                                  ],
                                                );
                                              }),
                                        ),
                                  const VestiSpacing.bigHeight(),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Expanded(
                                        child: CustomTextField(
                                            labelTxt: "Skill two",
                                            controller:
                                                controller.skillController2),
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                      ),
                                      Expanded(
                                          child: Padding(
                                        padding:
                                            const EdgeInsets.only(left: 6.0),
                                        child: BaseButton(
                                          isOutlined: true,
                                          borderRadius: 10,
                                          borderColor: Colors.green.shade900,
                                          bgColor: const Color(0xffF7FFF3),
                                          onPress: () {
                                            controller.addSkills(
                                              controller.skillController2.text,
                                            );
                                          },
                                          text: "+Add skill",
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800),
                                        ),
                                      )),
                                      Expanded(
                                        child: BaseButton(
                                          borderRadius: 10,
                                          isOutlined: true,
                                          borderColor: const Color(0xFF3E6F26),
                                          bgColor: const Color(0xffefe8e8),
                                          onPress: () {
                                            controller.removeSkills(
                                              controller.skillController1.text,
                                            );
                                          },
                                          text: "-Remove skill",
                                          textStyle: Theme.of(context)
                                              .textTheme
                                              .bodyMedium!
                                              .copyWith(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.w800),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const VestiSpacing.bigHeight(),
                                ],
                              );
                            }),
                      );
              }),
              const VestiSpacing.bigHeight(),
              CustomTextField(
                labelTxt: "Full Name",
                controller: controller.fullNameController,
              ),
              const VestiSpacing.bigHeight(),
              CustomTextField(
                keyboardType: TextInputType.emailAddress,
                labelTxt: "Emaill Address",
                controller: controller.emailAddyController,
              ),
              const VestiSpacing.bigHeight(),
              CustomTextField(
                labelTxt: "Skill One",
                controller: controller.skillController1,
              ),
              const VestiSpacing.bigHeight(),
              const VestiSpacing.bigHeight(),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    child: CustomTextField(
                        labelTxt: "Skill one",
                        controller: controller.skillController1),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                  ),
                  Expanded(
                      child: Padding(
                    padding: const EdgeInsets.only(left: 6.0),
                    child: BaseButton(
                      isOutlined: true,
                      borderRadius: 10,
                      borderColor: Colors.green.shade900,
                      bgColor: const Color(0xffF7FFF3),
                      onPress: () {},
                      text: "+Add skill",
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                  )),
                  Expanded(
                    child: BaseButton(
                      borderRadius: 10,
                      isOutlined: true,
                      borderColor: const Color(0xFF3E6F26),
                      bgColor: const Color(0xffefe8e8),
                      onPress: () {},
                      text: "-Remove skill",
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              ),
              const VestiSpacing.bigHeight(),
              Row(
                children: [
                  Expanded(
                    child: BaseButton(
                      minHeight: 60,
                      borderRadius: 10,
                      isOutlined: true,
                      borderColor: const Color(0xFF3E6F26),
                      bgColor: const Color(0xffefe8e8),
                      onPress: () {
                        // controller.removeStaff(Staff([],
                        //     controller.fullNameController.text,
                        //     controller.emailAddyController.text));
                        controller.removeSttaff(
                            controller.emailAddyController.text,
                            controller.fullNameController.text,
                            controller.skillController1.text);
                      },
                      text: "Remove User",
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: Colors.black, fontWeight: FontWeight.w800),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: BaseButton(
                      minHeight: 60,
                      borderRadius: 10,
                      isOutlined: true,
                      borderColor: const Color(0xFF3E6F26),
                      bgColor: const Color(0xFF89C06F),
                      onPress: () {
                        controller.addSttaff(
                            controller.emailAddyController.text,
                            controller.fullNameController.text,
                            controller.skillController1.text);
                      },
                      text: "Add Another User",
                      textStyle: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(
                              color: Colors.white, fontWeight: FontWeight.w800),
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
