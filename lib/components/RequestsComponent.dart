import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:image_picker_web/image_picker_web.dart';
import 'package:student_clearance/controllers/authcontroller.dart';
import 'package:student_clearance/models/account.dart';
import 'package:student_clearance/models/clearence.dart';
import 'package:student_clearance/services/clearence.dart';
import 'package:student_clearance/utils/appconfig.dart';
import 'package:universal_io/io.dart';

import '../utils/toastDialog.dart';

class RequestsComponent extends StatefulWidget {
  const RequestsComponent({super.key});

  @override
  State<RequestsComponent> createState() => _RequestsComponentState();
}

class _RequestsComponentState extends State<RequestsComponent> {
  String userRole = "student";
  String userDepartment = "";

  @override
  void initState() {
    getUser();
    super.initState();
  }

  getUser() async {
    final user =
        await AuthController.getAccount(AppConfig.auth.currentUser!.uid);

    setState(() {
      userRole = user.role;
    });

    if (userRole == "chairperson" || userRole == "registrar") {
      setState(() {
        userDepartment = user.department;
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
                  "Requests",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 120,
                  child: RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Home ',
                          style: TextStyle(color: Colors.teal, fontSize: 25),
                        ),
                        TextSpan(
                          text: ' / Requests',
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
                    userRole.toLowerCase() == "student"
                        ? InkWell(
                            onTap: () {
                              showMyDialog();
                            },
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
                          )
                        : Container(),
                    Expanded(
                      child: StreamBuilder(
                          stream: AppConfig.firebaseFiretore
                              .collection("requests")
                              .snapshots(),
                          builder: (context, snapshot) {
                            List<Clearance> forms = [];
                            if (snapshot.hasData) {
                              final items = snapshot.data!.docs;
                              items.map((e) {
                                switch (userRole) {
                                  case "student":
                                    if (Clearance.fromMap(e.data()).studentId ==
                                        AppConfig.auth.currentUser!.uid) {
                                      forms.add(Clearance.fromMap(e.data()));
                                    }
                                    break;
                                  case "librarian":
                                    if (Clearance.fromMap(e.data())
                                            .libraryStatus !=
                                        "completed") {
                                      forms.add(Clearance.fromMap(e.data()));
                                    }
                                    break;
                                  case "dean of students":
                                    if (Clearance.fromMap(e.data())
                                            .deanStatus !=
                                        "completed") {
                                      forms.add(Clearance.fromMap(e.data()));
                                    }
                                    break;
                                  case "director of sports & games":
                                    if (Clearance.fromMap(e.data())
                                            .sportsStatus !=
                                        "completed") {
                                      forms.add(Clearance.fromMap(e.data()));
                                    }
                                    break;
                                  case "house keeper":
                                    if (Clearance.fromMap(e.data())
                                            .houseKeeperStatus !=
                                        "completed") {
                                      forms.add(Clearance.fromMap(e.data()));
                                    }
                                    break;
                                  case "chairperson":
                                    if (Clearance.fromMap(e.data())
                                                .chairmanStatus !=
                                            "completed" &&
                                        Clearance.fromMap(e.data())
                                                .student
                                                .department ==
                                            userDepartment) {
                                      forms.add(Clearance.fromMap(e.data()));
                                    }
                                    break;
                                  case "registrar":
                                    if (Clearance.fromMap(e.data())
                                                .registrarStatus !=
                                            "completed" &&
                                        Clearance.fromMap(e.data())
                                                .student
                                                .department ==
                                            userDepartment) {
                                      forms.add(Clearance.fromMap(e.data()));
                                    }
                                    break;
                                  case "students’ finance office":
                                    if (Clearance.fromMap(e.data())
                                            .financeStatus !=
                                        "completed") {
                                      forms.add(Clearance.fromMap(e.data()));
                                    }
                                    break;
                                  default:
                                }
                              }).toList();
                            }
                            return DataTable2(
                              columnSpacing: 12,
                              horizontalMargin: 12,
                              minWidth: 600,
                              columns: const [
                                DataColumn2(
                                  label: Text('NO'),
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
                              rows: allforms(forms),
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

  Future<void> showMyDialog() async {
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
            final titleController = TextEditingController();
            final descriptionController = TextEditingController();
            late File image;
            String filePath = "No file chosen";
            return StatefulBuilder(builder: (BuildContext context,
                StateSetter setState /*You can rename this!*/) {
              return SizedBox(
                height: 450,
                width: 500,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      color: Colors.teal,
                      height: 50,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 120,
                            child: Row(
                              children: const [
                                Icon(
                                  Icons.add_circle,
                                  color: Colors.white,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Add Request",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: const Icon(Icons.close),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Request Title",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: titleController,
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          hintText: 'Clearance',
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Request Description",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: TextField(
                        controller: descriptionController,
                        onChanged: (value) {},
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        "Send Proof of payment",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: 50,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: InkWell(
                              onTap: () async {
                                //pick file
                                File? image1 =
                                    (await ImagePickerWeb.getImageAsFile())
                                        as File?;
                                // upload(picture);
                                if (image1!.path.isNotEmpty) {
                                  // ignore: use_build_context_synchronously
                                  final path = 'attachments/${image1.path}';

                                  setState(() {
                                    image = image1;
                                    filePath = path;
                                  });
                                }
                              },
                              child: Container(
                                height: 30,
                                decoration: BoxDecoration(
                                    color: Colors.tealAccent,
                                    border:
                                        Border.all(color: Colors.tealAccent),
                                    borderRadius: BorderRadius.circular(3)),
                                child: const Center(child: Text("Choose File")),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(flex: 4, child: Text(filePath)),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () async {
                        ClearenceServices clearenceServices =
                            ClearenceServices();
                        if (filePath == "No file chosen") {
                          Clearance clearance = Clearance(
                              id: DateTime.now()
                                  .millisecondsSinceEpoch
                                  .toString(),
                              title: titleController.text.trim(),
                              description: descriptionController.text.trim(),
                              filepath: "",
                              studentId: AppConfig.auth.currentUser!.uid,
                              status: "in progress",
                              chairmanStatus: "pending",
                              chairmanComments: "",
                              facultyStatus: "pending",
                              facultyComments: "",
                              libraryStatus: "pending",
                              libraryComments: "",
                              houseKeeperStatus: "pending",
                              houseKeeperComments: "",
                              deanStatus: "pending",
                              deanComments: "",
                              sportsStatus: "pending",
                              sportsComments: "",
                              registrarStatus: "pending",
                              registrarComments: "",
                              financeStatus: "pending",
                              financeComments: "",
                              student: await AuthController.getAccount(
                                  AppConfig.auth.currentUser!.uid),
                              chairmanSignature: '',
                              deanSignature: '',
                              financeSignature: '',
                              houseKeeperSignature: '',
                              librarianSignature: '',
                              registrarSignature: '',
                              sportsSignature: '');

                          ToastDialogue().showToast("Sending request...", 0);
                          clearenceServices.createClearenceRequest(clearance);
                          ToastDialogue().showToast("Success", 0);
                          // ignore: use_build_context_synchronously
                          Navigator.pop(context);
                        } else {
                          // File file = File(image.path);
                          // final storageRef =
                          //     FirebaseStorage.instance.ref().child(filePath);
                          // UploadTask task = storageRef.putFile(file);
                          // final snapshot = await task.whenComplete(() {
                          //   log("File Uploaded==========");
                          // });
                          // final fileUrl = await snapshot.ref.getDownloadURL();

                          // if (kDebugMode) {
                          //   print("Download URL: $fileUrl");
                          // }
                          // Clearance clearance = Clearance(
                          //     id: DateTime.now()
                          //         .millisecondsSinceEpoch
                          //         .toString(),
                          //     title: titleController.text.trim(),
                          //     description: descriptionController.text.trim(),
                          //     filepath: fileUrl,
                          //     studentId: AppConfig.auth.currentUser!.uid,
                          //     status: "in progress",
                          //     chairmanStatus: "pending",
                          //     chairmanComments: "",
                          //     facultyStatus: "pending",
                          //     facultyComments: "",
                          //     libraryStatus: "pending",
                          //     libraryComments: "",
                          //     houseKeeperStatus: "pending",
                          //     houseKeeperComments: "",
                          //     deanStatus: "pending",
                          //     deanComments: "",
                          //     sportsStatus: "pending",
                          //     sportsComments: "",
                          //     registrarStatus: "pending",
                          //     registrarComments: "",
                          //     financeStatus: "pending",
                          //     financeComments: "",
                          //     student: await AuthController.getAccount(
                          //         AppConfig.auth.currentUser!.uid));

                          // ToastDialogue().showToast("Sending request...", 0);
                          // clearenceServices.createClearenceRequest(clearance);
                          // ToastDialogue().showToast("Success", 0);
                          // // ignore: use_build_context_synchronously
                          // Navigator.pop(context);
                        }
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        margin: const EdgeInsets.symmetric(horizontal: 20),
                        decoration: BoxDecoration(
                          color: Colors.teal,
                          borderRadius: BorderRadius.circular(3),
                        ),
                        child: const Center(
                          child: Text(
                            "Submit your clearance Request",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            });
          },
        ),
      ),
    );
  }

  List<DataRow> allforms(List<Clearance> forms) {
    List<DataRow> widgets = [];
    for (int index = 0; index < forms.length; index++) {
      widgets.add(DataRow(
        cells: [
          DataCell(TextButton(
              onPressed: () async {
                final user = await AuthController.getAccount(
                    AppConfig.auth.currentUser!.uid);
                if (user.role.toLowerCase() != "student") {
                  final account =
                      await AuthController.getAccount(forms[index].studentId);
                  showReviewDialog(forms[index], account);
                }
              },
              child: Text(forms[index].title))),
          DataCell(
            TextButton(
              onPressed: (() async {
                final user = await AuthController.getAccount(
                    AppConfig.auth.currentUser!.uid);
                if (user.role.toLowerCase() == "student") {
                  showOfficerCommentDialog(forms[index].chairmanComments);
                }
              }),
              child: Text(forms[index].chairmanStatus),
            ),
          ),
          DataCell(
            TextButton(
              onPressed: (() async {
                final user = await AuthController.getAccount(
                    AppConfig.auth.currentUser!.uid);
                if (user.role.toLowerCase() == "student") {
                  showOfficerCommentDialog(forms[index].facultyComments);
                }
              }),
              child: Text(forms[index].facultyStatus),
            ),
          ),
          DataCell(
            TextButton(
              onPressed: (() async {
                final user = await AuthController.getAccount(
                    AppConfig.auth.currentUser!.uid);
                if (user.role.toLowerCase() == "student") {
                  showOfficerCommentDialog(forms[index].libraryComments);
                }
              }),
              child: Text(forms[index].libraryStatus),
            ),
          ),
          DataCell(
            TextButton(
              onPressed: (() async {
                final user = await AuthController.getAccount(
                    AppConfig.auth.currentUser!.uid);
                if (user.role.toLowerCase() == "student") {
                  showOfficerCommentDialog(forms[index].houseKeeperComments);
                }
              }),
              child: Text(forms[index].houseKeeperStatus),
            ),
          ),
          DataCell(
            TextButton(
              onPressed: (() async {
                final user = await AuthController.getAccount(
                    AppConfig.auth.currentUser!.uid);
                if (user.role.toLowerCase() == "student") {
                  showOfficerCommentDialog(forms[index].deanComments);
                }
              }),
              child: Text(forms[index].deanStatus),
            ),
          ),
          DataCell(
            TextButton(
              onPressed: (() async {
                final user = await AuthController.getAccount(
                    AppConfig.auth.currentUser!.uid);
                if (user.role.toLowerCase() == "student") {
                  showOfficerCommentDialog(forms[index].sportsComments);
                }
              }),
              child: Text(forms[index].sportsStatus),
            ),
          ),
          DataCell(
            TextButton(
              onPressed: (() async {
                final user = await AuthController.getAccount(
                    AppConfig.auth.currentUser!.uid);
                if (user.role.toLowerCase() == "student") {
                  showOfficerCommentDialog(forms[index].registrarComments);
                }
              }),
              child: Text(forms[index].registrarStatus),
            ),
          ),
          DataCell(
            TextButton(
              onPressed: (() async {
                final user = await AuthController.getAccount(
                    AppConfig.auth.currentUser!.uid);
                if (user.role.toLowerCase() == "student") {
                  showOfficerCommentDialog(forms[index].financeComments);
                }
              }),
              child: Text(forms[index].financeStatus),
            ),
          ),
        ],
      ));
    }
    return widgets;
  }

  Future<void> showReviewDialog(Clearance clearance, Account account) async {
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
            final commentsController = TextEditingController();
            return SizedBox(
              height: MediaQuery.of(context).size.height,
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.teal,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 150,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Clearence Form",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 20,
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Name",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                                "${account.firstName} ${account.lastName}"),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Registration",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(account.registrationNo),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Email",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(account.email),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Phone Number",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(account.phone),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Request Title",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(clearance.title),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Request Description",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Text(clearance.description),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          const Divider(),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20),
                            child: Text(
                              "Comment",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: commentsController,
                              onChanged: (value) {},
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                              ),
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
                                InkWell(
                                  onTap: () {
                                    ClearenceServices clearenceServices =
                                        ClearenceServices();
                                    ToastDialogue()
                                        .showToast("Sending request...", 0);
                                    switch (userRole.toLowerCase()) {
                                      case "chairperson":
                                        Map<String, dynamic> data = {
                                          "id": clearance.id,
                                          "chairmanStatus": "rejected",
                                          "facultyStatus": "rejected",
                                          "chairmanComments":
                                              commentsController.text.trim(),
                                          "facultyComments":
                                              commentsController.text.trim(),
                                          "chairmanSignature":
                                              AppConfig.auth.currentUser!.uid,
                                        };
                                        clearenceServices
                                            .updateClearanceData(data);
                                        clearenceServices
                                            .updateClearenceFormStatus(
                                                clearance.id);
                                        ToastDialogue().showToast("Success", 0);
                                        Navigator.pop(context);
                                        break;
                                      case "librarian":
                                        Map<String, dynamic> data = {
                                          "id": clearance.id,
                                          "libraryStatus": "rejected",
                                          "libraryComments":
                                              commentsController.text.trim(),
                                          "librarianSignature":
                                              AppConfig.auth.currentUser!.uid,
                                        };
                                        clearenceServices
                                            .updateClearanceData(data);
                                        clearenceServices
                                            .updateClearenceFormStatus(
                                                clearance.id);
                                        ToastDialogue().showToast("Success", 0);
                                        Navigator.pop(context);
                                        break;
                                      case "dean of students":
                                        Map<String, dynamic> data = {
                                          "id": clearance.id,
                                          "deanStatus": "rejected",
                                          "deanComments":
                                              commentsController.text.trim(),
                                          "deanSignature":
                                              AppConfig.auth.currentUser!.uid,
                                        };
                                        clearenceServices
                                            .updateClearanceData(data);
                                        ToastDialogue().showToast("Success", 0);
                                        clearenceServices
                                            .updateClearenceFormStatus(
                                                clearance.id);
                                        Navigator.pop(context);
                                        break;
                                      case "director of sports & games":
                                        Map<String, dynamic> data = {
                                          "id": clearance.id,
                                          "sportsStatus": "rejected",
                                          "sportsComments":
                                              commentsController.text.trim(),
                                          "sportsSignature":
                                              AppConfig.auth.currentUser!.uid,
                                        };
                                        clearenceServices
                                            .updateClearanceData(data);
                                        clearenceServices
                                            .updateClearenceFormStatus(
                                                clearance.id);
                                        ToastDialogue().showToast("Success", 0);
                                        Navigator.pop(context);
                                        break;
                                      case "house keeper":
                                        Map<String, dynamic> data = {
                                          "id": clearance.id,
                                          "houseKeeperStatus": "rejected",
                                          "houseKeeperComments":
                                              commentsController.text.trim(),
                                          "houseKeeperSignature":
                                              AppConfig.auth.currentUser!.uid,
                                        };
                                        clearenceServices
                                            .updateClearanceData(data);
                                        clearenceServices
                                            .updateClearenceFormStatus(
                                                clearance.id);
                                        ToastDialogue().showToast("Success", 0);
                                        Navigator.pop(context);
                                        break;
                                      case "registrar":
                                        Map<String, dynamic> data = {
                                          "id": clearance.id,
                                          "registrarStatus": "rejected",
                                          "registrarComments":
                                              commentsController.text.trim(),
                                          "registrarSignature":
                                              AppConfig.auth.currentUser!.uid,
                                        };
                                        clearenceServices
                                            .updateClearanceData(data);
                                        clearenceServices
                                            .updateClearenceFormStatus(
                                                clearance.id);
                                        ToastDialogue().showToast("Success", 0);
                                        Navigator.pop(context);
                                        break;
                                      case "students’ finance office":
                                        Map<String, dynamic> data = {
                                          "id": clearance.id,
                                          "financeStatus": "rejected",
                                          "financeComments":
                                              commentsController.text.trim(),
                                          "financeSignature":
                                              AppConfig.auth.currentUser!.uid,
                                        };
                                        clearenceServices
                                            .updateClearanceData(data);
                                        clearenceServices
                                            .updateClearenceFormStatus(
                                                clearance.id);
                                        ToastDialogue().showToast("Success", 0);
                                        Navigator.pop(context);
                                        break;
                                      default:
                                        Navigator.pop(context);
                                    }
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.red,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Reject Request",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    ClearenceServices clearenceServices =
                                        ClearenceServices();
                                    ToastDialogue()
                                        .showToast("Sending request...", 0);
                                    switch (userRole.toLowerCase()) {
                                      case "chairperson":
                                        Map<String, dynamic> data = {
                                          "id": clearance.id,
                                          "chairmanStatus": "completed",
                                          "facultyStatus": "completed",
                                          "chairmanComments":
                                              commentsController.text.trim(),
                                          "facultyComments":
                                              commentsController.text.trim(),
                                          "chairmanSignature":
                                              AppConfig.auth.currentUser!.uid,
                                        };
                                        clearenceServices
                                            .updateClearanceData(data);
                                        clearenceServices
                                            .updateClearenceFormStatus(
                                                clearance.id);
                                        ToastDialogue().showToast("Success", 0);
                                        Navigator.pop(context);
                                        break;
                                      case "librarian":
                                        Map<String, dynamic> data = {
                                          "id": clearance.id,
                                          "libraryStatus": "completed",
                                          "libraryComments":
                                              commentsController.text.trim(),
                                          "librarianSignature":
                                              AppConfig.auth.currentUser!.uid,
                                        };
                                        clearenceServices
                                            .updateClearanceData(data);
                                        clearenceServices
                                            .updateClearenceFormStatus(
                                                clearance.id);
                                        ToastDialogue().showToast("Success", 0);
                                        Navigator.pop(context);
                                        break;
                                      case "dean of students":
                                        Map<String, dynamic> data = {
                                          "id": clearance.id,
                                          "deanStatus": "completed",
                                          "deanComments":
                                              commentsController.text.trim(),
                                          "deanSignature":
                                              AppConfig.auth.currentUser!.uid,
                                        };
                                        clearenceServices
                                            .updateClearanceData(data);
                                        clearenceServices
                                            .updateClearenceFormStatus(
                                                clearance.id);
                                        ToastDialogue().showToast("Success", 0);
                                        Navigator.pop(context);
                                        break;
                                      case "director of sports & games":
                                        Map<String, dynamic> data = {
                                          "id": clearance.id,
                                          "sportsStatus": "completed",
                                          "sportsComments":
                                              commentsController.text.trim(),
                                          "sportsSignature":
                                              AppConfig.auth.currentUser!.uid,
                                        };
                                        clearenceServices
                                            .updateClearanceData(data);
                                        clearenceServices
                                            .updateClearenceFormStatus(
                                                clearance.id);
                                        ToastDialogue().showToast("Success", 0);
                                        Navigator.pop(context);
                                        break;
                                      case "house keeper":
                                        Map<String, dynamic> data = {
                                          "id": clearance.id,
                                          "houseKeeperStatus": "completed",
                                          "houseKeeperComments":
                                              commentsController.text.trim(),
                                          "houseKeeperSignature":
                                              AppConfig.auth.currentUser!.uid,
                                        };
                                        clearenceServices
                                            .updateClearanceData(data);
                                        clearenceServices
                                            .updateClearenceFormStatus(
                                                clearance.id);
                                        ToastDialogue().showToast("Success", 0);
                                        Navigator.pop(context);
                                        break;
                                      case "registrar":
                                        Map<String, dynamic> data = {
                                          "id": clearance.id,
                                          "registrarStatus": "completed",
                                          "registrarComments":
                                              commentsController.text.trim(),
                                          "registrarSignature":
                                              AppConfig.auth.currentUser!.uid,
                                        };
                                        clearenceServices
                                            .updateClearanceData(data);
                                        clearenceServices
                                            .updateClearenceFormStatus(
                                                clearance.id);
                                        ToastDialogue().showToast("Success", 0);
                                        Navigator.pop(context);
                                        break;
                                      case "students’ finance office":
                                        Map<String, dynamic> data = {
                                          "id": clearance.id,
                                          "financeStatus": "completed",
                                          "financeComments":
                                              commentsController.text.trim(),
                                          "financeSignature":
                                              AppConfig.auth.currentUser!.uid,
                                        };
                                        clearenceServices
                                            .updateClearanceData(data);
                                        clearenceServices
                                            .updateClearenceFormStatus(
                                                clearance.id);
                                        ToastDialogue().showToast("Success", 0);
                                        Navigator.pop(context);
                                        break;
                                      default:
                                        Navigator.pop(context);
                                    }
                                  },
                                  child: Container(
                                    width: 200,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      color: Colors.teal,
                                      borderRadius: BorderRadius.circular(3),
                                    ),
                                    child: const Center(
                                      child: Text(
                                        "Approve Request",
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> showOfficerCommentDialog(String comment) async {
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
              height: 200,
              width: 500,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.teal,
                    height: 50,
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: 200,
                          child: Row(
                            children: const [
                              Icon(
                                Icons.remove_red_eye,
                                color: Colors.white,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Officer Comment",
                                style: TextStyle(color: Colors.white),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(Icons.close),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: Text(
                      "Review",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Text(comment),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
