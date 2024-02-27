// import 'package:bluetooth_print/bluetooth_print.dart';
// import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';
import 'package:flutter/material.dart';
import 'package:sample_design/printing.dart';
import 'package:url_launcher/url_launcher.dart';

class printer extends StatefulWidget {
  const printer({super.key});

  @override
  State<printer> createState() => _printerState();
}

class _printerState extends State<printer> {
  int counter = 0;
  int counter1 = 0;
  int counter2 = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          children: [
            Center(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(25, 300, 25, 5),
                  child: Row(
                    children: [
                      OutlinedButton(
                          onPressed: () {
                            setState(() {
                              counter++;
                            });
                            // testTicket();
                            //  printWithRawBT("Printed Value: LX${counter.toString().padLeft(2, '0')}");
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => printingdata(
                                        labelText:
                                            'LX${counter2.toString().padLeft(2, '0')}')));
                          },
                          style: OutlinedButton.styleFrom(
                            // Text color
                            side: BorderSide(color: Colors.black),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  0.0), // Adjust the radius as needed
                            ), // Border color
                          ),
                          child: Center(
                            child: Text(
                              "LAB & X-RAY",
                              style: TextStyle(
                                  color: Color.fromARGB(245, 1, 65, 117),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20),
                            ),
                          )),
                      SizedBox(width: 10),
                      Container(
                          height: 40, // Adjust the height as needed
                          padding: EdgeInsets.symmetric(
                              horizontal: 20), // Adjust the padding as needed
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.black,
                            ),
                            borderRadius: BorderRadius.circular(
                                0.0), // Adjust the radius as needed
                          ),
                          child: Center(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(35, 0, 35, 0),
                              child: RichText(
                                text: TextSpan(
                                  style: DefaultTextStyle.of(context).style,
                                  children: <TextSpan>[
                                    TextSpan(
                                      text: 'LX ',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: counter.toString().padLeft(2, '0'),
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ))
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: Row(
                children: [
                  OutlinedButton(
                      onPressed: () {
                        setState(() {
                          counter1++;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => printingdata(
                                    labelText:
                                        'S${counter2.toString().padLeft(2, '0')}')));
                      },
                      style: OutlinedButton.styleFrom(
                        // Text color
                        side: BorderSide(color: Colors.black),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              0.0), // Adjust the radius as needed
                        ), // Border color
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(6, 0, 6, 0),
                          child: Text(
                            "SCANNING",
                            style: TextStyle(
                                color: Color.fromARGB(245, 1, 65, 117),
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      )),
                  SizedBox(width: 10),
                  Container(
                      height: 40, // Adjust the height as needed
                      padding: EdgeInsets.symmetric(
                          horizontal: 20), // Adjust the padding as needed
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(
                            0.0), // Adjust the radius as needed
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(41, 0, 41, 0),
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'S ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: counter1.toString().padLeft(2, '0'),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(25, 5, 25, 5),
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState(() {
                          counter2++;
                        });
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) => printingdata(
                                    labelText:
                                        'C${counter2.toString().padLeft(2, '0')}')));
                      },
                      style: ButtonStyle(
                        foregroundColor:
                            MaterialStateProperty.all(Colors.white),
                        backgroundColor: MaterialStateProperty.all(
                            Color.fromARGB(255, 35, 10, 161)),
                        shape: MaterialStateProperty.all(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                0.0), // Set borderRadius to 0 for a square button
                          ),
                        ),
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(11, 0, 11, 0),
                          child: Text(
                            "COMMON",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20),
                          ),
                        ),
                      )),
                  SizedBox(width: 10),
                  Container(
                      height: 40, // Adjust the height as needed
                      padding: EdgeInsets.symmetric(
                          horizontal: 20), // Adjust the padding as needed
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(
                            0.0), // Adjust the radius as needed
                      ),
                      child: Center(
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(41, 0, 41, 0),
                          child: RichText(
                            text: TextSpan(
                              style: DefaultTextStyle.of(context).style,
                              children: <TextSpan>[
                                TextSpan(
                                  text: 'C ',
                                  style: TextStyle(
                                      color: Colors.grey,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                                TextSpan(
                                  text: counter2.toString().padLeft(2, '0'),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

//   Future<void> printWithRawBT(String printData) async {
//     String rawBTUri = 'rawbt://print?text=$printData';

//     if (await canLaunch(rawBTUri)) {
//       await launch(rawBTUri);
//     } else {
//       print("Could not launch RawBT");
//     }
//   }
// }

//   Future<void> testTicket() async {
//     final List<int> bytes = [];
//     // Using default profile
//     final profile = await CapabilityProfile.load();
//     final generator = Generator(PaperSize.mm80, profile);
//     generator.text('Printed Value: LX${counter.toString().padLeft(2, '0')}',
//         styles: PosStyles(align: PosAlign.left));
//     generator.text('Thank you!', styles: PosStyles(align: PosAlign.center));
//     generator.text('-------------------------------');
//     generator.text('Powered by Flutter',
//         styles: PosStyles(align: PosAlign.center));

//     generator.cut();
//     // generator.disconnect();
//   }
// }
