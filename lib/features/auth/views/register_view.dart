import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:scholar_chat/shared/custom_text.dart';
import 'package:scholar_chat/shared/custom_text_form_field.dart';
import 'package:scholar_chat/shared/show_snack_bar.dart';

class RegisterView extends StatelessWidget {
  RegisterView({Key? key}) : super(key: key);
  String? email;
  String? password;
  // createPasswordEmail() async {
  //   try {
  //     UserCredential credential = await FirebaseAuth.instance
  //         .createUserWithEmailAndPassword(
  //             email: email!.trim(), password: password!.trim());
  //   } on FirebaseAuthException catch (e) {
  //     if (condition) {}
  //   }
  // }
  GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff2B475E),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: ListView(
          children: [
            const Gap(70),
            Form(
              key: formKey,
              child: Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      "assets/images/scholar.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  const CustomText(
                    alignment: Alignment.center,
                    textFont: "Scholar Chat",
                    textSize: 30,
                    fontFamily: 'Pacifico',
                  ),
                  const Gap(30),
                  const Row(
                    children: [
                      CustomText(
                        textFont: "Register",
                        textSize: 24,
                      ),
                    ],
                  ),
                  const Gap(15),
                  //Custom Text Field 1
                  CustomTextFormField(
                    height: true,
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "The Email is Empty";
                      }
                      return null;
                    },
                    hint_text: "Email",
                    color_hint: Colors.white,
                    horizontal_Padding: 25,
                    textFieldColor: Colors.white,
                    dataOutlineInputBorder: DataOutlineInputBorder(
                      width: 2,
                      fillcolor: Colors.white,
                    ),
                  ),
                  const Gap(10),
                  //Custom Text Field 2
                  CustomTextFormField(
                    height: true,
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (data) {
                      if (data!.isEmpty) {
                        return "The Email is Empty";
                      }
                      return null;
                    },
                    hint_text: "Password",
                    color_hint: Colors.white,
                    horizontal_Padding: 25,
                    textFieldColor: Colors.white,
                    dataOutlineInputBorder: DataOutlineInputBorder(
                      width: 2,
                      fillcolor: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(19),
            ElevatedButton(
              onPressed: () async {
                if (formKey.currentState!.validate()) {
                  try {
                    await registerInputDataUser(
                        password: password!.trim(), email: email!.trim());
                    showSnackBar(context, message: "sucess");
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      showSnackBar(context,
                          message: 'The password provided is too weak');
                    } else if (e.code == 'email-already-in-use') {
                      showSnackBar(context,
                          message: 'The account already exists for that email');
                    } else if (e.code == 'invalid-email') {
                      showSnackBar(context, message: 'Email fomatt');
                    }
                  }
                }
              },
              style: ElevatedButton.styleFrom(
                  overlayColor: const Color.fromARGB(82, 4, 88, 127),
                  splashFactory: InkRipple.splashFactory,
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadiusGeometry.circular(10),
                  )),
              child: const SizedBox(
                width: double.infinity,
                height: 60,
                child: CustomText(
                  alignment: Alignment.center,
                  textFont: "Register",
                  textSize: 20,
                  textColor: Colors.black,
                  fontWeight1: true,
                ),
              ),
            ),
            const Gap(7),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const CustomText(
                  textFont: "if you have account ?",
                  textSize: 15,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const CustomText(
                    textFont: " click here",
                    textSize: 15,
                    fontWeight1: true,
                    textColor: Color.fromARGB(255, 164, 219, 246),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  Future<void> registerInputDataUser(
      {required String password, required String email}) async {
    await FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: email.trim(), password: password.trim());
  }
}
