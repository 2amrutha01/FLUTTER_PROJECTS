import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';

class home extends StatefulWidget {
  home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  bool isTypeAheadVisible = false;
  List<String> tests = [
    'Lipid Profile',
    'Thyroid Stimulating Hormone (TSH)',
    'Fasting Blood Suger (FBS)',
    'Vitamin D',
    'Urine Complete Analysis', // Corrected spelling
  ];
  String? selected;
  String? selectedTest;

  String selectedValue = '';
  Map<String, String> sampleTypes = {};

  double totalAmount = 0.0;
  double dueAmount = 0.0;

  Map<String, double> testAmounts = {
    'Lipid Profile': 250.0,
    'Thyroid Stimulating Hormone (TSH)': 600.0,
    'Fasting Blood Suger (FBS)': 450.0,
    'Vitamin D': 300.0,
    'Urine Complete Analysis': 200.0,
  };

  TextEditingController amountController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Details Collection"),
        backgroundColor: Colors.green,
      ),
      body: Container(
        padding: EdgeInsets.fromLTRB(20, 20, 10, 10),
        child: ListView(children: [
          Row(children: [
            Text(
              "Ashwin Baby",
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
            SizedBox(
              width: 190.0,
            ),
            Icon(
              Icons.phone_outlined,
              size: 20.0,
              color: Colors.green,
            ),
          ]),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(children: [
              Text(
                "Gender:",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "Male",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w100),
              ),
              SizedBox(
                width: 25.0,
              ),
              Text(
                "Age:",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "25",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w100),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(children: [
              Text(
                "Location:",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              SizedBox(
                width: 10.0,
              ),
              Text(
                "Koduvathara (h) BTS Road Edappally",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w100,
                    fontSize: 15),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
            child: Row(
              children: [
                Text(
                  "P.O Near Changanpuzha Park 682024",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.w100),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 20, 0, 20),
            child: Row(children: [
              Text(
                "Edit Patient Info",
                style: TextStyle(
                    color: Color.fromARGB(113, 64, 161, 28),
                    fontWeight: FontWeight.w100),
              ),
              SizedBox(
                width: 100,
              ),
              Text(
                "Add Relative Booking",
                style: TextStyle(
                    color: Color.fromARGB(113, 64, 161, 28),
                    fontWeight: FontWeight.w100),
              ),
            ]),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 0, 20),
            child: Row(children: [
              Text(
                "Test Info:",
                style:
                    TextStyle(color: Colors.black, fontWeight: FontWeight.w100),
              ),
              SizedBox(
                width: 100,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Sample Collected",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(0.0),
                    ),
                  ),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ]),
          ),
          Container(
            padding: EdgeInsets.only(top: 10.0),
            color: Color.fromARGB(255, 231, 233, 234),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text(
                    "Test Name",
                    style: TextStyle(color: Colors.grey),
                  ),
                ),
                SizedBox(
                  width: 185,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child: Text("Amount", style: TextStyle(color: Colors.grey)),
                )
              ],
            ),
          ),
          Container(
            height: 100, // Set the height as per your requirement
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Visibility(
                    visible: sampleTypes.isNotEmpty,
                    child: ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: sampleTypes.length,
                      itemBuilder: (context, index) {
                        var entry = sampleTypes.entries.elementAt(index);
                        return Table(
                          columnWidths: {
                            0: FlexColumnWidth(2.0),
                            1: FlexColumnWidth(.5),
                            2: FlexColumnWidth(.3),
                          },
                          border: TableBorder.all(
                            color: Color.fromARGB(255, 225, 227, 228),
                          ),
                          children: [
                            TableRow(
                              children: [
                                TableCell(
                                  child: Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 0, 0, 0),
                                    child: Align(
                                      alignment: Alignment.centerLeft,
                                      child: Padding(
                                        padding: const EdgeInsets.fromLTRB(
                                            0, 10, 0, 0),
                                        child: Text(entry.key),
                                      ),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          0, 10, 0, 0),
                                      child: Text(entry.value),
                                    ),
                                  ),
                                ),
                                TableCell(
                                  child: Center(
                                    child: GestureDetector(
                                      onTap: () {
                                        _openDialog(
                                            context, tests.indexOf(entry.key));
                                      },
                                      child: Padding(
                                        padding:
                                            const EdgeInsets.only(top: 8.0),
                                        child: Icon(
                                          Icons.delete,
                                          color: Colors.red,
                                          size: 20,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(80, 10, 80, 10),
            child: OutlinedButton(
              onPressed: () {
                setState(() {
                  isTypeAheadVisible = true;
                });
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Color.fromARGB(113, 64, 161, 28)),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
              child: Text(
                "+  Add More Tests",
                style: TextStyle(color: Color.fromARGB(113, 64, 161, 28)),
              ),
            ),
          ),
          Visibility(
            visible: isTypeAheadVisible,
            child: TypeAheadFormField<String>(
              textFieldConfiguration: TextFieldConfiguration(
                controller: TextEditingController(text: selectedValue),
                decoration: InputDecoration(
                  labelText: 'Select an item',
                  border: OutlineInputBorder(),
                ),
              ),
              suggestionsCallback: (pattern) {
                return tests
                    .where((item) =>
                        item.toLowerCase().contains(pattern.toLowerCase()))
                    .toList();
              },
              itemBuilder: (context, suggestion) {
                return ListTile(
                  title: Text(suggestion),
                );
              },
              onSuggestionSelected: (suggestion) {
                setState(() {
                  selectedValue = suggestion;
                  // Add the selected test and its sample type to the map
                  sampleTypes[suggestion] = getSampleTypeForTest(suggestion);
                  setSampleTypeForSelectedTest(selectedValue);
                  isTypeAheadVisible = false;
                  selectedValue = '';
                });
              },
              noItemsFoundBuilder: (context) {
                return Container();
              },
            ),
          ),
          Divider(
            thickness: 2.5,
            color: Color.fromARGB(255, 216, 214, 214),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 5, 0, 5),
            child: Row(
              children: [
                Icon(
                  Icons.receipt_sharp,
                  size: 30.0,
                  color: Colors.green,
                ),
                SizedBox(
                  width: 20,
                ),
                Text(
                  "Bill Info:",
                  style: TextStyle(
                      color: Colors.black, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 130,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(
                    "Payment Due",
                    style: TextStyle(
                        color: const Color.fromRGBO(255, 255, 255, 1),
                        fontSize: 12),
                  ),
                  style: ButtonStyle(
                    foregroundColor: MaterialStateProperty.all(Colors.white),
                    backgroundColor: MaterialStateProperty.all(Colors.orange),
                    shape: MaterialStateProperty.all(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    textStyle: MaterialStateProperty.all(
                      TextStyle(
                        fontSize: 15,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          Row(
            children: [
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                    child: Text("Total Amount"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 3, 0),
                    child: Text(
                      "₹ ${totalAmount.toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  )
                ],
              ),
              Container(
                height: 50.0,
                child: VerticalDivider(
                  color: Color.fromARGB(255, 216, 214, 214),
                  thickness: 2,
                ),
              ),
              Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text("Due Amount"),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: Text(
                      "₹ ${dueAmount.toStringAsFixed(2)}",
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
                    ),
                  )
                ],
              ),
              SizedBox(
                width: 10,
              ),
              ElevatedButton(
                onPressed: () {},
                child: Text(
                  "Collect Payment",
                  style: TextStyle(color: Colors.white),
                ),
                style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                  shape: MaterialStateProperty.all(
                    RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  textStyle: MaterialStateProperty.all(
                    TextStyle(
                      fontSize: 15,
                    ),
                  ),
                ),
              )
            ],
          ),
          Center(
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 0),
                  child: OutlinedButton(
                    onPressed: () {},
                    style: OutlinedButton.styleFrom(
                      side: BorderSide(color: Color.fromARGB(113, 64, 161, 28)),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(12, 8, 12, 10),
                        child: Text(
                          "Cancel Visit",
                          style: TextStyle(color: Colors.green),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 12, 8, 8),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 8, 0, 8),
                        child: Text(
                          "Collect Sample",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    style: ButtonStyle(
                      foregroundColor: MaterialStateProperty.all(Colors.white),
                      backgroundColor: MaterialStateProperty.all(Colors.green),
                      shape: MaterialStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                      ),
                      textStyle: MaterialStateProperty.all(
                        TextStyle(
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
    );
  }

  String getSampleTypeForTest(String test) {
    // Define a map to store sample types for each test
    Map<String, String> sampleTypeMap = {
      'Lipid Profile': '250 /-',
      'Thyroid Stimulating Hormone (TSH)': '600 /-',
      'Fasting Blood Suger (FBS)': '450 /-',
      'Vitamin D': '300 /-',
      'Urine Complete Analysis': '200 /-',
    };

    // Return the sample type for the given test
    return sampleTypeMap[test] ?? '';
  }

  Future _openDialog(BuildContext _context, int index) {
    return showDialog(
      context: _context,
      builder: (_) => CupertinoAlertDialog(
        title: Column(
          children: [
            Text("Do you want to remove this test?"),
            SizedBox(
              height: 15.0,
            ),
          ],
        ),
        actions: [
          Row(
            children: [
              TextButton(
                onPressed: () {
                  onDeleteRow(index);
                },
                child: Text('Yes'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(_context).pop();
                },
                child: Text('Close'),
              ),
            ],
          )
        ],
      ),
    );
  }

  void setSampleTypeForSelectedTest(String selectedTest) {
    setState(() {
      sampleTypes[selectedTest] = getSampleTypeForTest(selectedTest);
      totalAmount = sampleTypes.keys
          .map((test) => testAmounts[test] ?? 0.0)
          .reduce((a, b) => a + b);
      dueAmount = totalAmount;

      // Update the amount text field
      amountController.text = totalAmount.toStringAsFixed(2);
    });
  }

  void onDeleteRow(int test) {
    String testKey = tests[test];

    // Get the corresponding sample type and subtract its amount from total
    String sampleType = sampleTypes[testKey] ?? '';
    double amount = getAmountForSampleType(sampleType);
    totalAmount -= amount;
    dueAmount -= amount;

    // Remove the sample type from the map
    sampleTypes.remove(testKey);

    // Update the UI
    setState(() {
      Navigator.of(context).pop();
    });
  }

  double getAmountForSampleType(String sampleType) {
    // Use this function to get the amount based on the sample type
    return double.parse(sampleType.split(" /-")[0]);
  }
}
