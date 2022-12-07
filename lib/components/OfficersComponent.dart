import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:student_clearance/controllers/authcontroller.dart';
import 'package:student_clearance/models/account.dart';

import '../utils/appconfig.dart';

class OfficersComponent extends StatefulWidget {
  const OfficersComponent({super.key});

  @override
  State<OfficersComponent> createState() => _OfficersComponentState();
}

class _OfficersComponentState extends State<OfficersComponent> {
  String studentDepartment = "";
  @override
  void initState() {
    getStudentDepartment();
    super.initState();
  }

  getStudentDepartment() async {
    final user =
        await AuthController.getAccount(AppConfig.auth.currentUser!.uid);

    if (user.role == "student") {
      setState(() {
        studentDepartment = user.department;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "Officers",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 100,
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Home ',
                          style: TextStyle(color: Colors.teal, fontSize: 25),
                        ),
                        TextSpan(
                          text: ' / Officers',
                          style: TextStyle(color: Colors.grey, fontSize: 25),
                        ),
                      ],
                    ),
                    textScaleFactor: 0.5,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: Card(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: StreamBuilder(
                          stream: AppConfig.firebaseFiretore
                              .collection("users")
                              .snapshots(),
                          builder: (context, snapshot) {
                            List<Account> users = [];
                            if (snapshot.hasData) {
                              final items = snapshot.data!.docs;
                              items.map((e) {
                                if (Account.fromMap(e.data())
                                        .role
                                        .toLowerCase() !=
                                    "student") {
                                  if (Account.fromMap(e.data())
                                              .role
                                              .toLowerCase() ==
                                          "chairperson" ||
                                      Account.fromMap(e.data())
                                              .role
                                              .toLowerCase() ==
                                          "registrar") {
                                    if (studentDepartment.isEmpty) {
                                      users.add(Account.fromMap(e.data()));
                                    } else {
                                      if (Account.fromMap(e.data())
                                              .department
                                              .toLowerCase() ==
                                          studentDepartment) {
                                        users.add(Account.fromMap(e.data()));
                                      }
                                    }
                                  } else {
                                    users.add(Account.fromMap(e.data()));
                                  }
                                }
                              }).toList();
                            }
                            return DataTable2(
                              columnSpacing: 12,
                              horizontalMargin: 12,
                              minWidth: 600,
                              columns: const [
                                DataColumn2(
                                  label: Text('NO.'),
                                  size: ColumnSize.L,
                                ),
                                DataColumn(
                                  label: Text('FIRST NAME'),
                                ),
                                DataColumn(
                                  label: Text('LAST NAME'),
                                ),
                                DataColumn(
                                  label: Text('PHONE'),
                                ),
                                DataColumn(
                                  label: Text('ROLE'),
                                  numeric: true,
                                ),
                                DataColumn(
                                  label: Text('ACTION'),
                                  numeric: true,
                                ),
                              ],
                              rows: allofficers(users),
                            );
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  List<DataRow> allofficers(List<Account> users) {
    List<DataRow> widgets = [];
    for (int index = 0; index < users.length; index++) {
      widgets.add(DataRow(
        cells: [
          DataCell(Text((index + 1).toString())),
          DataCell(
            Text(users[index].firstName),
          ),
          DataCell(
            Text(users[index].lastName),
          ),
          DataCell(
            Text(users[index].phone),
          ),
          DataCell(Text(users[index].role)),
          DataCell(
            InkWell(
              onTap: () {
                showMyDialog(users[index]);
              },
              child: Container(
                width: 120,
                height: 30,
                decoration: BoxDecoration(
                    color: Colors.teal, borderRadius: BorderRadius.circular(3)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(
                      Icons.remove_red_eye,
                      color: Colors.white,
                      size: 18,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Text(
                      "View Details",
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ));
    }
    return widgets;
  }

  Future<void> showMyDialog(Account account) async {
    return showDialog(
      context: context,
      builder: (_) => AlertDialog(
        insetPadding: EdgeInsets.zero,
        contentPadding: EdgeInsets.zero,
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(3.0))),
        content: Builder(
          builder: (context) {
            return SizedBox(
              height: 450,
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.teal,
                    width: MediaQuery.of(context).size.width,
                    height: 200,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircleAvatar(
                          radius: 50,
                          backgroundColor: Colors.white,
                          child: Icon(
                            Icons.person,
                            size: 50,
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text(
                          "${account.firstName} ${account.lastName}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 25),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Phone",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          account.phone,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Email",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          account.email,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "School/Institute",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          account.institute.toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Department",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          account.department.toUpperCase(),
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Role",
                          style: TextStyle(fontSize: 18),
                        ),
                        Text(
                          account.role.toUpperCase(),
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
