import 'package:flutter/material.dart';
import 'package:product_app/model/user.dart';
import 'package:product_app/viewmodel/city_vm.dart';
import 'package:product_app/viewmodel/user_vm.dart';

import '../../utils/regular excepression.dart';
import '../../widget/my_buttom.dart';
import '../../widget/my_textformfield.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  GlobalKey<FormState> formKey = GlobalKey();
  String? gender;
  String? selectedCity;
  CityVm cityVm = CityVm();
  User? user;
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController phone = TextEditingController();
  bool isVisuble = true;
  bool? isCheck1 = false;
  bool? isCheck2 = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            key: formKey,
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Colors.indigo[800]),
                    child: const Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 50,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  MyTextFormField(
                    controller: name,
                    hintText: 'Your Name',
                    validator: RegularExceprationsConstants().isUserNameValide,
                  ),
                  MyTextFormField(
                    controller: email,
                    hintText: 'Your Email',
                    validator: RegularExceprationsConstants().isUserEmailValide,
                  ),
                  MyTextFormField(
                    controller: phone,
                    hintText: 'Your Phone',
                    validator: RegularExceprationsConstants().isUserPhoneValide,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField(
                        decoration: InputDecoration(
                            labelText: 'City',
                            contentPadding: const EdgeInsets.symmetric(
                                vertical: 8, horizontal: 10),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10))),
                        value: selectedCity,
                        items: cityVm.cities.map((c) {
                          return DropdownMenuItem(
                            value: c.value,
                            child: Text(c.name),
                          );
                        }).toList(),
                        onChanged: (x) {
                          selectedCity = x;

                          setState(() {});
                        }),
                  ),
                  MyTextFormField(
                    controller: password,
                    obscureText: isVisuble,
                    hintText: 'Your Password',
                    validator:
                        RegularExceprationsConstants().isUserPassworValide,
                    suffixIcon: InkWell(
                      onTap: () {
                        isVisuble = !isVisuble;
                        setState(() {});
                      },
                      child: Icon(!isVisuble
                          ? Icons.visibility_sharp
                          : Icons.visibility_off_sharp),
                    ),
                  ),
                  Row(
                    children: [
                      Radio(
                        value: 'Mele',
                        groupValue: gender,
                        onChanged: (value) {
                          gender = value;
                          setState(() {});
                        },
                      ),
                      const Text('Male'),
                      Radio(
                        value: 'Female',
                        groupValue: gender,
                        onChanged: (value) {
                          gender = value;
                          setState(() {});
                        },
                      ),
                      const Text('FeMale'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: isCheck1,
                          onChanged: (c) {
                            isCheck1 = c;
                            setState(() {});
                          }),
                      const Text('I Accept The Terms'),
                    ],
                  ),
                  Row(
                    children: [
                      Checkbox(
                          value: isCheck2,
                          onChanged: (c) {
                            isCheck2 = c;
                            setState(() {});
                          }),
                      const Text('I do not Accept terms'),
                    ],
                  ),
                  MyButtom(
                    name: 'Sign Up',
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        UserVm uservm = UserVm();
                        User user = User(
                            name: name.text,
                            email: email.text,
                            password: password.text,
                            phone: phone.text,
                            city: selectedCity!);

                        uservm.addUser(user);
                        Navigator.pushReplacementNamed(context, '/productView');
                        print(uservm.users);
                      }
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
