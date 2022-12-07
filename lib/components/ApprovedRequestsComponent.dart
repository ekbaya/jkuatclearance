import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:student_clearance/models/clearence.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_pdf/pdf.dart';
// ignore: depend_on_referenced_packages
import 'package:universal_io/io.dart';

import '../controllers/authcontroller.dart';
import '../utils/appconfig.dart';

class ApprovedRequestsComponent extends StatefulWidget {
  const ApprovedRequestsComponent({super.key});

  @override
  State<ApprovedRequestsComponent> createState() =>
      _ApprovedRequestsComponentState();
}

class _ApprovedRequestsComponentState extends State<ApprovedRequestsComponent> {
  String userRole = "";

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
                  "Approved",
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
                          text: ' / Approved',
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
                                            AppConfig.auth.currentUser!.uid &&
                                        Clearance.fromMap(e.data()).status ==
                                            "completed") {
                                      forms.add(Clearance.fromMap(e.data()));
                                    }
                                    break;
                                  case "librarian":
                                    if (Clearance.fromMap(e.data())
                                                .libraryStatus ==
                                            "completed" &&
                                        Clearance.fromMap(e.data())
                                                .librarianSignature ==
                                            AppConfig.auth.currentUser!.uid) {
                                      forms.add(Clearance.fromMap(e.data()));
                                    }
                                    break;
                                  case "dean of students":
                                    if (Clearance.fromMap(e.data())
                                                .deanStatus ==
                                            "completed" &&
                                        Clearance.fromMap(e.data())
                                                .deanSignature ==
                                            AppConfig.auth.currentUser!.uid) {
                                      forms.add(Clearance.fromMap(e.data()));
                                    }
                                    break;
                                  case "director of sports & games":
                                    if (Clearance.fromMap(e.data())
                                                .sportsStatus ==
                                            "completed" &&
                                        Clearance.fromMap(e.data())
                                                .sportsSignature ==
                                            AppConfig.auth.currentUser!.uid) {
                                      forms.add(Clearance.fromMap(e.data()));
                                    }
                                    break;
                                  case "house keeper":
                                    if (Clearance.fromMap(e.data())
                                                .houseKeeperStatus ==
                                            "completed" &&
                                        Clearance.fromMap(e.data())
                                                .houseKeeperSignature ==
                                            AppConfig.auth.currentUser!.uid) {
                                      forms.add(Clearance.fromMap(e.data()));
                                    }
                                    break;
                                  case "chairperson":
                                    if (Clearance.fromMap(e.data())
                                                .facultyStatus ==
                                            "completed" &&
                                        Clearance.fromMap(e.data())
                                                .chairmanSignature ==
                                            AppConfig.auth.currentUser!.uid) {
                                      forms.add(Clearance.fromMap(e.data()));
                                    }
                                    break;
                                  case "registrar":
                                    if (Clearance.fromMap(e.data())
                                                .registrarStatus ==
                                            "completed" &&
                                        Clearance.fromMap(e.data())
                                                .registrarSignature ==
                                            AppConfig.auth.currentUser!.uid) {
                                      forms.add(Clearance.fromMap(e.data()));
                                    }
                                    break;
                                  case "students’ finance office":
                                    if (Clearance.fromMap(e.data())
                                                .financeStatus ==
                                            "completed" &&
                                        Clearance.fromMap(e.data())
                                                .financeSignature ==
                                            AppConfig.auth.currentUser!.uid) {
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
                                  label: Text('REGISTRATION'),
                                  numeric: true,
                                ),
                                DataColumn(
                                  label: Text('YEAR LEVEL'),
                                  numeric: true,
                                ),
                                DataColumn(
                                  label: Text('REQUESTED CLEARANCE'),
                                  numeric: true,
                                ),
                              ],
                              rows: approvedForms(forms),
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

  List<DataRow> approvedForms(List<Clearance> forms) {
    List<DataRow> widgets = [];
    for (var index = 0; index < forms.length; index++) {
      widgets.add(
        DataRow(
          cells: [
            DataCell(
              Text(forms[index].student.firstName),
            ),
            DataCell(
              Text(forms[index].student.lastName),
            ),
            DataCell(Text(forms[index].student.phone)),
            DataCell(Text(forms[index].student.registrationNo)),
            DataCell(Text(forms[index].student.yearAndLevel)),
            DataCell(
              InkWell(
                onTap: () async {
                  //Load the existing PDF document.
                  final PdfDocument document = PdfDocument(
                      inputBytes: File('assets/students-clearance-form.pdf')
                          .readAsBytesSync());
                  //Get the existing PDF page.
                  final PdfPage page = document.pages[0];
                  //Draw text in the PDF page.
                  page.graphics.drawString('Hello World!',
                      PdfStandardFont(PdfFontFamily.helvetica, 12),
                      brush: PdfSolidBrush(PdfColor(0, 0, 0)),
                      bounds: const Rect.fromLTWH(0, 0, 150, 20));
                  //Save the document.
                  File('assets/output.pdf').writeAsBytes(await document.save());
                  //Dispose the document.
                  document.dispose();
                },
                child: Container(
                  width: 100,
                  height: 30,
                  decoration: BoxDecoration(
                      color: Colors.teal,
                      borderRadius: BorderRadius.circular(3)),
                  child: const Center(
                    child: Text(
                      "Download",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
    }
    return widgets;
  }
}
