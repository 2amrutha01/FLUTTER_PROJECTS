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
                  width: 190,
                ),
                Padding(
                  padding: const EdgeInsets.all(3.0),
                  child:
                      Text("Sample Type", style: TextStyle(color: Colors.grey)),
                )
              ],
            ),
          ),
          Table(
            columnWidths: {
              0: FlexColumnWidth(2.2),
              1: FlexColumnWidth(.7),
            },
            border: TableBorder.all(color: Color.fromARGB(255, 225, 227, 228)),
            children: [
              for (int i = 0; i < tests.length; i++)
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(tests[i]),
                          ),
                        ),
                      ),
                    ),
                    TableCell(
                      child: Center(
                        child: Text(sampleTypes[tests[i]] ?? ''),
                      ),
                    ),
                  ],
                ),
            ],
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
            padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
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
                  padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
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
                        padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
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
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 8, 10),
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
      'Lipid Profile': 'Blood',
      'Thyroid Stimulating Hormone (TSH)': 'Blood',
      'Fasting Blood Suger (FBS)': 'Blood',
      'Vitamin D': 'Blood',
      'Urine Complete Analysis': 'Urine',
    };

    // Return the sample type for the given test
    return sampleTypeMap[test] ?? '';
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
}
