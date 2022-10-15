import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:student_clearance/components/OfficersComponent.dart';
import 'package:student_clearance/components/RequestsComponent.dart';
import 'package:student_clearance/constants/pages.dart';
import 'package:student_clearance/providers/application.dart';

import '../components/ApprovedRequestsComponent.dart';
import '../components/PageNotFoundComponent.dart';
import '../widgets/SideBarItem.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    Application app = Provider.of<Application>(context);
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
                      backgroundColor: Colors.white,
                    ),
                    title: Text(
                      "Neema Mutheu",
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
                    title: "Requests",
                    page: requestsPage,
                    icon: Icons.pages,
                    onTap: () {
                      app.switchPage(requestsPage);
                    },
                    onHover: (value) {
                      if (value) {
                        app.switchActivePage(requestsPage);
                      } else {
                        app.switchActivePage(app.selectedPage);
                      }
                    },
                  ),
                  SideBarItem(
                    title: "Approved",
                    page: approvedPage,
                    icon: Icons.handshake,
                    onTap: () {
                      app.switchPage(approvedPage);
                    },
                    onHover: (value) {
                      if (value) {
                        app.switchActivePage(approvedPage);
                      } else {
                        app.switchActivePage(app.selectedPage);
                      }
                    },
                  ),
                  SideBarItem(
                    title: "Officers",
                    page: officersPage,
                    icon: Icons.group,
                    onTap: () {
                      app.switchPage(officersPage);
                    },
                    onHover: (value) {
                      if (value) {
                        app.switchActivePage(officersPage);
                      } else {
                        app.switchActivePage(app.selectedPage);
                      }
                    },
                  ),
                  SideBarItem(
                    title: "Change Password",
                    page: changePasswordPage,
                    icon: Icons.settings,
                    onTap: () {
                      app.switchPage(changePasswordPage);
                    },
                    onHover: (value) {
                      if (value) {
                        app.switchActivePage(changePasswordPage);
                      } else {
                        app.switchActivePage(app.selectedPage);
                      }
                    },
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
                //page Contents
                getCurrentPage(app.selectedPage),
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

  Widget getCurrentPage(String page) {
    switch (page) {
      case requestsPage:
        return const RequestsComponent();
      case approvedPage:
        return const ApprovedRequestsComponent();
      case officersPage:
        return const OfficersComponent();
      case changePasswordPage:
        return const PageNotFountPage();
      default:
        return const PageNotFountPage();
    }
  }
}
