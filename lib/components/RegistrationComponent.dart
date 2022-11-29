import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:select_form_field/select_form_field.dart';
import 'package:student_clearance/controllers/authcontroller.dart';
import 'package:student_clearance/models/account.dart';

import 'package:student_clearance/widgets/RequiredLabel.dart';

class RegistrationComponent extends StatefulWidget {
  final Function login;
  const RegistrationComponent({Key? key, required this.login})
      : super(key: key);

  @override
  State<RegistrationComponent> createState() => _RegistrationComponentState();
}

class _RegistrationComponentState extends State<RegistrationComponent> {
  String school = "";
  String department = "";
  String role = "";
  bool registeringAStudent = false;
  bool termsAndConditionsChecked = false;
  bool obscureText = true;
  final List<Map<String, dynamic>> schools = [
    {
      'value': 'scit',
      'label': 'School of Computing and Information Technology',
    },
    {
      'value': 'library',
      'label': 'Library',
    },
    {
      'value': 'games',
      'label': 'Games & Sports',
    },
    {
      'value': 'hostels',
      'label': 'Hostels',
    },
    {
      'value': 'finance',
      'label': 'Finance',
    },
    {
      'value': 'dean',
      'label': 'Dean',
    }
  ];

  final List<Map<String, dynamic>> departments = [
    {
      'value': 'it',
      'label': 'Information Technology',
    },
    {
      'value': 'cs',
      'label': 'Computer Science',
    },
    {
      'value': 'games',
      'label': 'Games & Sports',
    },
    {
      'value': 'hostels',
      'label': 'Hostels',
    },
    {
      'value': 'finance',
      'label': 'Finance',
    },
    {
      'value': 'dean',
      'label': 'Dean',
    }
  ];
  final List<Map<String, dynamic>> roles = [
    {
      'value': 'student',
      'label': 'Student',
    },
    {
      'value': 'librarian',
      'label': 'Librarian',
    },
    {
      'value': 'dean of students',
      'label': 'Dean of Students',
    },
    {
      'value': 'director of sports & games',
      'label': 'Director of Sports & Games',
    },
    {
      'value': 'house keeper',
      'label': 'House Keeper',
    },
    {
      'value': 'charperson',
      'label': 'Charperson',
    },
    {
      'value': 'registrar',
      'label': 'Registrar',
    },
    {
      'value': 'students’ finance office',
      'label': 'Students’ Finance Officer',
    },
  ];
  final TextEditingController firstNameTextEditingController =
      TextEditingController();
  final TextEditingController lastNameTextEditingController =
      TextEditingController();
  final TextEditingController emailTextEditingController =
      TextEditingController();
  final TextEditingController phoneTextEditingController =
      TextEditingController();
  final TextEditingController registrationTextEditingController =
      TextEditingController();
  final TextEditingController yearAndLevelTextEditingController =
      TextEditingController();
  final TextEditingController passwordTextEditingController =
      TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          const Text(
            "Adventure starts here",
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Make your clearance process easy and fun!",
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getRequiredLabel("First Name"),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: firstNameTextEditingController,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              getRequiredLabel("Last Name"),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: lastNameTextEditingController,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              getRequiredLabel("Email"),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: emailTextEditingController,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              getRequiredLabel("Phone"),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: phoneTextEditingController,
                onChanged: (value) {},
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              getRequiredLabel("Select Your School/Faculty/Institute"),
              const SizedBox(
                height: 10,
              ),
              SelectFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                items: schools,
                onChanged: (val) {
                  setState(() {
                    school = val;
                  });
                },
                onSaved: (val) {
                  setState(() {
                    school = val!;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              getRequiredLabel("Select Your Department"),
              const SizedBox(
                height: 10,
              ),
              SelectFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                items: departments,
                onChanged: (val) {
                  setState(() {
                    department = val;
                  });
                },
                onSaved: (val) {
                  setState(() {
                    department = val!;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              getRequiredLabel("Select Your Role"),
              const SizedBox(
                height: 10,
              ),
              SelectFormField(
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  border: OutlineInputBorder(),
                ),
                items: roles,
                onChanged: (val) {
                  setState(() {
                    role = val;
                  });
                  if (role == "student") {
                    setState(() {
                      registeringAStudent = true;
                    });
                  } else {
                    setState(() {
                      registeringAStudent = false;
                    });
                  }
                },
                onSaved: (val) {
                  setState(() {
                    role = val!;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              Visibility(
                visible: registeringAStudent,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    getRequiredLabel("Registration Number"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: registrationTextEditingController,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    getRequiredLabel("Year and Level e.g 4.2"),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: yearAndLevelTextEditingController,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        filled: true,
                        fillColor: Colors.white,
                        border: OutlineInputBorder(),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              getRequiredLabel("Password"),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: passwordTextEditingController,
                obscureText: obscureText,
                onChanged: (value) {},
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        obscureText ? obscureText = false : obscureText = true;
                      });
                    },
                    icon: const Icon(Icons.remove_red_eye),
                  ),
                  filled: true,
                  fillColor: Colors.white,
                  border: const OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  InkWell(
                    onTap: () {
                      setState(() {
                        termsAndConditionsChecked
                            ? termsAndConditionsChecked = false
                            : termsAndConditionsChecked = true;
                      });
                    },
                    child: Container(
                      width: 20,
                      height: 20,
                      decoration: BoxDecoration(
                        color: termsAndConditionsChecked
                            ? Colors.teal
                            : Colors.white,
                        borderRadius: BorderRadius.circular(3),
                        border: Border.all(
                            width: 1.0,
                            color: termsAndConditionsChecked
                                ? Colors.teal
                                : Colors.grey),
                      ),
                      child: Center(
                        child: termsAndConditionsChecked
                            ? const Icon(
                                Icons.check,
                                color: Colors.white,
                                size: 10,
                              )
                            : const SizedBox(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {},
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(color: Colors.black, fontSize: 36),
                          children: <TextSpan>[
                            TextSpan(text: 'I agree to '),
                            TextSpan(
                                text: ' privacy policy & terms',
                                style: TextStyle(color: Colors.blue))
                          ],
                        ),
                        textScaleFactor: 0.5,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              InkWell(
                onTap: () async {
                  if (validate()) {
                    Account account = Account(
                      id: "",
                      firstName: firstNameTextEditingController.text.trim(),
                      lastName: lastNameTextEditingController.text.trim(),
                      email: emailTextEditingController.text.trim(),
                      phone: phoneTextEditingController.text.trim(),
                      institute: school,
                      department: department,
                      role: role,
                      registrationNo:
                          registrationTextEditingController.text.trim(),
                      yearAndLevel:
                          yearAndLevelTextEditingController.text.trim(),
                    );

                    await AuthController.registerNewUser(context, account,
                        passwordTextEditingController.text.trim());
                  }
                },
                child: Container(
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.teal,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: const Center(
                    child: Text(
                      "Get started",
                      style: TextStyle(color: Colors.white, fontSize: 16),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          InkWell(
            onTap: () {
              widget.login.call();
            },
            child: RichText(
              text: const TextSpan(
                style: TextStyle(color: Colors.black, fontSize: 36),
                children: <TextSpan>[
                  TextSpan(text: 'Already have an account? '),
                  TextSpan(
                      text: ' Sign in instead',
                      style: TextStyle(color: Colors.blue))
                ],
              ),
              textScaleFactor: 0.5,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    );
  }

  bool validate() {
    if (firstNameTextEditingController.text.isEmpty) {
      return false;
    } else if (lastNameTextEditingController.text.isEmpty) {
      return false;
    } else if (emailTextEditingController.text.isEmpty) {
      return false;
    } else if (phoneTextEditingController.text.isEmpty) {
      return false;
    } else if (school.isEmpty) {
      return false;
    } else if (department.isEmpty) {
      return false;
    } else if (role.isEmpty) {
      return false;
    } else if (passwordTextEditingController.text.isEmpty) {
      return false;
    } else {
      return true;
    }
  }
}
