import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';
// ignore: depend_on_referenced_packages
import 'package:syncfusion_flutter_pdf/pdf.dart';
// ignore: depend_on_referenced_packages
import 'package:universal_io/io.dart';

class ApprovedRequestsComponent extends StatelessWidget {
  const ApprovedRequestsComponent({super.key});

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
                      child: DataTable2(
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
                            label: Text('COURSE'),
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
                        rows: List<DataRow>.generate(
                          20,
                          (index) => DataRow(
                            cells: [
                              const DataCell(
                                Text("Elias"),
                              ),
                              const DataCell(
                                Text("Baya"),
                              ),
                              const DataCell(Text("254712695820")),
                              const DataCell(Text("BIT")),
                              const DataCell(Text("4.2")),
                              DataCell(
                                InkWell(
                                  onTap: () async {
                                    //Load the existing PDF document.
                                    final PdfDocument document = PdfDocument(
                                        inputBytes: File(
                                                'assets/students-clearance-form.pdf')
                                            .readAsBytesSync());
                                    //Get the existing PDF page.
                                    final PdfPage page = document.pages[0];
                                    //Draw text in the PDF page.
                                    page.graphics.drawString(
                                        'Hello World!',
                                        PdfStandardFont(
                                            PdfFontFamily.helvetica, 12),
                                        brush: PdfSolidBrush(PdfColor(0, 0, 0)),
                                        bounds:
                                            const Rect.fromLTWH(0, 0, 150, 20));
                                    //Save the document.
                                    File('assets/output.pdf')
                                        .writeAsBytes(await document.save());
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
    );
  }
}
