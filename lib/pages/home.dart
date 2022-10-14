import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../widgets/SideBarItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.teal,
              child: Column(
                children: [
                  const ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.teal,
                      backgroundImage: AssetImage("assets/jkuat-logo.png"),
                    ),
                    title: Text(
                      "JKUAT Clearance",
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  const ListTile(
                    leading: CircleAvatar(
                      radius: 16,
                    ),
                    title: Text(
                      "Elias Baya",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    subtitle: Text(
                      "Student",
                      style: TextStyle(color: Colors.white, fontSize: 13),
                    ),
                  ),
                  const Divider(
                    color: Colors.grey,
                  ),
                  SideBarItem(
                    onHover: (value) {},
                    title: "Requests",
                    icon: Icons.pages,
                    index: 0,
                  ),
                  SideBarItem(
                    onHover: (value) {},
                    title: "Approved",
                    icon: Icons.handshake,
                    index: 1,
                  ),
                  SideBarItem(
                    onHover: (value) {},
                    title: "Officers",
                    icon: Icons.group,
                    index: 1,
                  ),
                  SideBarItem(
                    onHover: (value) {},
                    title: "Change Password",
                    icon: Icons.settings,
                    index: 1,
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 50,
                  color: Colors.teal,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Home",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Contact",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          Container(
                            width: 300,
                            height: 40,
                            padding: const EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: TextField(
                              onChanged: (value) {},
                              decoration: const InputDecoration(
                                hintText: 'Search',
                                border: InputBorder.none,
                                suffixIcon: Icon(Icons.search),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          InkWell(
                            onTap: () {},
                            child: SizedBox(
                              width: 25,
                              height: 30,
                              child: Stack(
                                children: const [
                                  Icon(
                                    Icons.notifications,
                                  ),
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: CircleAvatar(
                                      radius: 6,
                                      backgroundColor: Colors.red,
                                      child: Text(
                                        "2",
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 6),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(
                              Icons.dashboard,
                            ),
                          ),
                          const SizedBox(
                            width: 30,
                          ),
                          InkWell(
                            onTap: () {},
                            hoverColor: Colors.white,
                            child: Row(
                              children: const [
                                Icon(Icons.logout),
                                Text(
                                  "Logout",
                                  style: TextStyle(fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "Requests",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
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
                          InkWell(
                            onTap: () {},
                            child: Container(
                              width: 120,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.teal,
                                  borderRadius: BorderRadius.circular(3)),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon(
                                    Icons.add_circle,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                  Text(
                                    "Add Request",
                                    style: TextStyle(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            child: DataTable2(
                              columnSpacing: 12,
                              horizontalMargin: 12,
                              minWidth: 600,
                              columns: const [
                                DataColumn2(
                                  label: Text('NO.'),
                                  size: ColumnSize.L,
                                ),
                                DataColumn(
                                  label: Text('CHAIRMAN'),
                                ),
                                DataColumn(
                                  label: Text('FACULTY'),
                                ),
                                DataColumn(
                                  label: Text('LIBRARY'),
                                ),
                                DataColumn(
                                  label: Text('HOUSE KEEPER'),
                                  numeric: true,
                                ),
                                DataColumn(
                                  label: Text('DEAN'),
                                  numeric: true,
                                ),
                                DataColumn(
                                  label: Text('SPORTS'),
                                  numeric: true,
                                ),
                                DataColumn(
                                  label: Text('REGISTRAR'),
                                  numeric: true,
                                ),
                                DataColumn(
                                  label: Text('FINANCE'),
                                  numeric: true,
                                ),
                              ],
                              rows: List<DataRow>.generate(
                                100,
                                (index) => DataRow(
                                  cells: [
                                    DataCell(Text((index + 1).toString())),
                                    DataCell(
                                      TextButton(
                                        onPressed: (() {}),
                                        child: const Text("Completed"),
                                      ),
                                    ),
                                    DataCell(
                                      TextButton(
                                        onPressed: (() {}),
                                        child: const Text("Completed"),
                                      ),
                                    ),
                                    DataCell(
                                      TextButton(
                                        onPressed: (() {}),
                                        child: const Text("Completed"),
                                      ),
                                    ),
                                    DataCell(
                                      TextButton(
                                        onPressed: (() {}),
                                        child: const Text("Completed"),
                                      ),
                                    ),
                                    DataCell(
                                      TextButton(
                                        onPressed: (() {}),
                                        child: const Text("Completed"),
                                      ),
                                    ),
                                    DataCell(
                                      TextButton(
                                        onPressed: (() {}),
                                        child: const Text("Completed"),
                                      ),
                                    ),
                                    DataCell(
                                      TextButton(
                                        onPressed: (() {}),
                                        child: const Text("Completed"),
                                      ),
                                    ),
                                    DataCell(
                                      TextButton(
                                        onPressed: (() {}),
                                        child: const Text("Completed"),
                                      ),
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
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        height: 30,
        color: Colors.white,
        child: Row(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                color: Colors.teal,
                child: Row(children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.facebook,
                      size: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.github,
                      size: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.linkedin,
                      size: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.twitter,
                      size: 20,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      FontAwesomeIcons.googlePlus,
                      size: 20,
                    ),
                  ),
                ]),
              ),
            ),
            Expanded(
              flex: 5,
              child: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: RichText(
                  text: const TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                        text: 'Copyright \u00a9 2022-2023',
                      ),
                      TextSpan(
                          text: ' JKUAT Clearance System.',
                          style: TextStyle(
                              color: Colors.teal, fontWeight: FontWeight.bold)),
                      TextSpan(
                        text: ' All rights reserved.',
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
