import 'dart:ui';

import 'package:algoriza_task1/login_screen.dart';
import 'package:algoriza_task1/my_button.dart';
import 'package:algoriza_task1/my_text_form_field.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final formKey = GlobalKey<FormState>();

  var emailController = TextEditingController();

  var phoneController = TextEditingController();

  var passwordController = TextEditingController();

  bool isPassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Stack(
                alignment: Alignment.centerLeft,
                children: [
                  SizedBox(
                    height: MediaQuery.of(context).size.height * .13,
                    width: double.infinity,
                    child: const Image(
                      width: double.infinity,
                      image: AssetImage(
                        'assets/images/333.jpg',
                      ),
                      fit: BoxFit.cover,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const CircleAvatar(
                        backgroundColor: Colors.black,
                        radius: 18,
                        child: Padding(
                          padding: EdgeInsetsDirectional.only(
                            start: 10,
                          ),
                          child: Icon(
                            Icons.arrow_back_ios,
                            size: 26,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                decoration: const BoxDecoration(color: Colors.white),
                child: Form(
                  key: formKey,
                  child: Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Welcome to Fashion Daily',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 13.0,
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        buildRegisterAndHelpRow(),
                        const SizedBox(
                          height: 15,
                        ),
                        //-----------------------------------
                        const Text(
                          'Email',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        buildEmailForm(),
                        const SizedBox(
                          height: 18,
                        ),
                        //-----------------------------------
                        const Text(
                          'Phone Number',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        buildPhoneForm(),
                        const SizedBox(
                          height: 18,
                        ),
                        //------------------------------------
                        const Text(
                          'Password',
                          style: TextStyle(
                            color: Colors.grey,
                            fontWeight: FontWeight.w600,
                            fontSize: 15.0,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        buildPasswordForm(),
                        const SizedBox(
                          height: 15,
                        ),
                        //------------------------------------
                        MyButton(
                          buttonBorder: 5,
                          buttonColor: Colors.blue,
                          text: 'Sign in',
                          onTap: () {},
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        const Center(
                          child: Text(
                            'Or',
                            style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.w600,
                              fontSize: 16.0,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        buildSignWithGoogle(),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text('Has any account? '),
                            const SizedBox(
                              width: 3,
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/login');
                              },
                              child: const Text(
                                'Sign in here',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        const Center(
                          child: Text(
                            'By registering your account ,you are agree to our',
                            style: TextStyle(fontSize: 15, color: Colors.grey),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: const Center(
                            child: Text(
                              'terms and conditions',
                              style:
                                  TextStyle(fontSize: 15, color: Colors.blue),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildRegisterAndHelpRow() => Row(
        children: const [
          Text(
            'Register',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 35,
            ),
          ),
          Spacer(),
          Text(
            'Help',
            style: TextStyle(
              color: Colors.blue,
              fontSize: 15.0,
            ),
          ),
          SizedBox(
            width: 3,
          ),
          CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 8,
            child: Icon(
              Icons.question_mark_sharp,
              color: Colors.white,
              size: 13,
            ),
          ),
        ],
      );

  Widget buildEmailForm() => SizedBox(
        height: 50,
        child: MyTextFormField(
          labelText: 'Email',
          emptyText: 'Eg. example@gmail.com',
          hintText: 'Eg. example@gmail.com',
          controller: emailController,
          validation: 'email Must Not be Empty',
          keyboardType: TextInputType.emailAddress,
        ),
      );

  Widget buildPhoneForm() => SizedBox(
        height: 50,
        child: MyTextFormField(
          labelText: 'Phone Number',
          emptyText: 'Eg. 812345678',
          hintText: 'Eg. 812345678',
          preFix: CountryCodePicker(
            showDropDownButton: true,
            showFlag: false,
          ),
          controller: phoneController,
          validation: 'Phone Must Not be Empty',
          keyboardType: TextInputType.phone,
        ),
      );

  Widget buildPasswordForm() => SizedBox(
        height: 50,
        child: MyTextFormField(
          labelText: 'Password',
          emptyText: 'Password',
          hintText: 'password',
          controller: passwordController,
          validation: 'Password Must Not be Empty',
          isPassword: isPassword,
          keyboardType: TextInputType.visiblePassword,
          suffix:
              isPassword ? Icons.remove_red_eye : Icons.visibility_off_rounded,
          suffixPressed: () {
            isPassword = !isPassword;
            setState(() {
              isPassword;
            });
          },
        ),
      );

  Widget buildSignWithGoogle() => InkWell(
        onTap: () {},
        child: Container(
          height: 47,
          padding: const EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              width: 1,
              color: Colors.blue,
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 10,
                child: Image(
                  image: AssetImage('assets/images/google.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(
                width: 7,
              ),
              Text(
                'Sign with by google',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 15.0,
                ),
              ),
            ],
          ),
        ),
      );
}
