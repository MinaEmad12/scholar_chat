import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gap/flutter_gap.dart';
import 'package:scholar_chat/features/auth/views/register_view.dart';
import 'package:scholar_chat/features/chat/views/chat_view.dart';
import 'package:scholar_chat/shared/custom_text.dart';
import 'package:scholar_chat/shared/custom_text_form_field.dart';
import 'package:scholar_chat/shared/show_snack_bar.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);
  String? email = "";
  String? password = "";
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
              Column(
                children: [
                  SizedBox(
                    height: 150,
                    width: 150,
                    child: Image.asset(
                      "assets/images/scholar.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                ],
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
                    textFont: "Login",
                    textSize: 24,
                  ),
                ],
              ),
              const Gap(15),
              CustomTextFormField(
                onChanged: (value) {
                  email = value;
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
              const Gap(25),
              CustomTextFormField(
                onChanged: (value) {
                  password = value;
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
              const Gap(40),
              ElevatedButton(
                onPressed: () async {
                  try {
                    await loginInputDataUser(
                        password: password!, email: email!);
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => ChatView(email:email!,)));
                  } on FirebaseAuthException catch (e) {
                    switch (e.code) {
                      case 'invalid-credential':
                        showSnackBar(context,
                            message: 'The Exception in Email or password');
                        break;
                      default:
                        null;
                    }
                  } catch (e) {
                    print("++++++++++$e");
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
                    textFont: "Login",
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
                    textFont: "if you dont have account ?",
                    textSize: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RegisterView(),
                          ));
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
        ));
  }

  Future<void> loginInputDataUser(
      {required String? password, required String? email}) async {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        password: password!.trim(), email: email!.trim());
  }
}
