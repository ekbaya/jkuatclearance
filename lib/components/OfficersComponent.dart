import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class OfficersComponent extends StatelessWidget {
  const OfficersComponent({super.key});

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
                        rows: List<DataRow>.generate(
                          20,
                          (index) => DataRow(
                            cells: [
                              DataCell(Text((index + 1).toString())),
                              const DataCell(
                                Text("Elias"),
                              ),
                              const DataCell(
                                Text("Baya"),
                              ),
                              const DataCell(
                                Text("254712695820"),
                              ),
                              const DataCell(Text("School Librarian")),
                              DataCell(
                                InkWell(
                                  onTap: () {},
                                  child: Container(
                                    width: 120,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: Colors.teal,
                                        borderRadius: BorderRadius.circular(3)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
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
