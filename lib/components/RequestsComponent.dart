import 'package:data_table_2/data_table_2.dart';
import 'package:flutter/material.dart';

class RequestsComponent extends StatefulWidget {
  const RequestsComponent({super.key});

  @override
  State<RequestsComponent> createState() => _RequestsComponentState();
}

class _RequestsComponentState extends State<RequestsComponent> {
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
                    InkWell(
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
                          20,
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
                            onTap: () {},
                            child: Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  color: Colors.tealAccent,
                                  border: Border.all(color: Colors.tealAccent),
                                  borderRadius: BorderRadius.circular(3)),
                              child: const Center(child: Text("Choose file")),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        const Expanded(flex: 4, child: Text("No file chosen")),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    onTap: () {},
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
          },
        ),
      ),
    );
  }
}
