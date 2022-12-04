import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
import 'package:student_clearance/models/account.dart';
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
  String userRole = "student";

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
                                if (userRole == "student") {
                                  if (Clearance.fromMap(e.data()).studentId ==
                                          AppConfig.auth.currentUser!.uid &&
                                      Clearance.fromMap(e.data()).status ==
                                          "completed") {
                                    forms.add(Clearance.fromMap(e.data()));
                                  }
                                } else {
                                  if (Clearance.fromMap(e.data()).status ==
                                      "completed") {
                                    forms.add(Clearance.fromMap(e.data()));
                                  }
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
    for (var i = 0; i < forms.length; i++) {
      Account student =
          AuthController.getAccount(forms[i].studentId) as Account;
      widgets.add(
        DataRow(
          cells: [
            DataCell(
              Text(student.firstName),
            ),
            DataCell(
              Text(student.lastName),
            ),
            DataCell(Text(student.phone)),
            DataCell(Text(student.registrationNo)),
            DataCell(Text(student.yearAndLevel)),
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
