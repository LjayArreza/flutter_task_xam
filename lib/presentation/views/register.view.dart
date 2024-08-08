import 'package:flutter/material.dart';
import 'package:flutter_task_xam/app/config/color_constants.dart';
import 'package:flutter_task_xam/app/core/base/base_view.dart';
import 'package:flutter_task_xam/app/core/utils/image_utils.dart';
import 'package:flutter_task_xam/app/core/utils/loading_utils.dart';
import 'package:flutter_task_xam/presentation/controllers/upload_photo.controller.dart';
import 'package:flutter_task_xam/presentation/widgets/add_photo_section.widget.dart';
import 'package:flutter_task_xam/presentation/widgets/comments_section.widget.dart';
import 'package:flutter_task_xam/presentation/widgets/details_section.widget.dart';
import 'package:flutter_task_xam/presentation/widgets/link_existing_event_section.widget.dart';
import 'package:email_validator/email_validator.dart';
import '../controllers/user.controller.dart';

class RegisterView extends BaseView<UserController> {
  const RegisterView({super.key});

  @override
  Widget build(BuildContext context) {

    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Registration"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child:(Padding(
          padding: const EdgeInsets.all(12.0),
          child: Form(
            key: _formkey,
            child: Column(
                crossAxisAlignment:CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0),
                    child: TextFormField(
                      controller: controller.emailController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter email';
                        }
                        if (!EmailValidator.validate(value)) {
                          return 'Invalid email format';
                        }
                        return null;
                      },
                      style: const TextStyle(fontSize: 12),
                      decoration: const InputDecoration(
                        hintText: 'Email',
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.all(Radius.circular(9.0))),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.lightBlue,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child:         TextFormField(
                      controller: controller.firstNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter firstName';
                        }
                        return null;
                      },
                      style: const TextStyle(fontSize: 12),
                      decoration: const InputDecoration(
                        hintText: 'First Name',
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.all(Radius.circular(9.0))),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.green,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child:         TextFormField(
                      controller: controller.lastNameController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter lastname';
                        }
                        return null;
                      },
                      style: const TextStyle(fontSize: 12),
                      decoration: const InputDecoration(
                        hintText: 'Last Name',
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.all(Radius.circular(9.0))),
                        prefixIcon: Icon(
                          Icons.person,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top:20.0),
                    child:TextFormField(
                      controller: controller.mobileController,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter mobile';
                        }
                        // RegExp regExp = new RegExp(
                        //   r"(^[0,9]{10}$)",
                        //   caseSensitive: false,
                        //   multiLine: false,
                        // );
                        // if(!regExp.hasMatch(value)){
                        //   return "Invalid format";
                        // }
                        return null;
                      },
                      style: const TextStyle(fontSize: 12),
                      decoration: const InputDecoration(
                        hintText: 'Mobile Number',
                        hintStyle: TextStyle(fontSize: 12),
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red),
                            borderRadius: BorderRadius.all(Radius.circular(9.0))),
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.grey,
                        ),
                      ),
                    ),
                  ),
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Container(
                        child: ElevatedButton(
                          onPressed: () async {
                            if(_formkey.currentState!.validate()){
                              controller.registerUser();
                            }
                          },
                          child: Text("Register",style: TextStyle(color: Colors.white, fontSize: 22)),

                          style:  ElevatedButton.styleFrom(
                            backgroundColor: AppColors.buttonColorBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),

                          ),
                        ),
                      ),
                    ),
                  ),

                ],
            ),
          ),
        )),

      ),
    );
  }
}
