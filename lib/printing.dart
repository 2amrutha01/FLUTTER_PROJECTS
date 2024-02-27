// import 'package:bluetooth_print/bluetooth_print.dart';
// import 'package:bluetooth_print/bluetooth_print_model.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart';

import 'package:flutter/material.dart';
import 'package:esc_pos_printer/esc_pos_printer.dart';
import 'package:esc_pos_utils/esc_pos_utils.dart' as esc;

import 'package:flutter/scheduler.dart';
import 'package:flutter_esc_pos_bluetooth/flutter_esc_pos_bluetooth.dart';

class printingdata extends StatefulWidget {
  final String labelText;

  printingdata({Key? key, required this.labelText}) : super(key: key);

  @override
  State<printingdata> createState() => _printingdataState();
}

class _printingdataState extends State<printingdata> {
  String _deviceMsg = '';
  List<PrinterBluetooth> _device = [];

  PrinterBluetoothManager _printerBluetoothManager = PrinterBluetoothManager();

  @override
  void initState() {
    // print(widget.counterValue);
    initPrinter();
    super.initState();
  }

  Future<void> initPrinter() async {
    // Start the scan only if it's not already in progress
    _printerBluetoothManager.startScan(Duration(seconds: 2));
    _printerBluetoothManager.scanResults.listen((val) {
      if (!mounted) return;
      setState(() => _device = val);
      print(_device);
      if (_device.isEmpty) setState(() => _deviceMsg = "No devices");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Select Printer"),
          backgroundColor: Colors.blueGrey,
        ),
        body: _device.isEmpty
            ? Center(
                child: Text(_deviceMsg ?? ''),
              )
            : ListView.builder(
                itemCount: _device.length,
                itemBuilder: (c, i) {
                  return ListTile(
                    leading: Icon(Icons.print),
                    title: Text(_device[i].name),
                    subtitle: Text(_device[i].address),
                    onTap: () {
                      _startPrint(_device[i]);
                    },
                  );
                },
              ));
  }

  Future<void> _startPrint(PrinterBluetooth printer) async {
    _printerBluetoothManager.selectPrinter(printer);
    final result =
        await _printerBluetoothManager.printTicket(await testTicket());
    print(result);
  }

  Future<List<int>> testTicket() async {
    final profile = await CapabilityProfile.load();
    final generator = Generator(PaperSize.mm80, profile);

    final bytes = await testTicketContent(generator);
    return bytes;
  }

  Future<List<int>> testTicketContent(Generator generator) async {
    List<int> bytes = [];

    bytes += generator.text('TEST VALUE');
    bytes += generator.text('Value:${widget.labelText.toString()}');

    // Add the content generated by your testTicketContent function
    bytes.addAll(await additionalTicketContent(generator));

    bytes += generator.feed(2);
    bytes += generator.cut();
    return bytes;
  }

  Future<List<int>> additionalTicketContent(Generator generator) async {
    List<int> bytes = [];

    // Customize your ticket content here
    // bytes += generator.text('Regular Text');
    // bytes += generator.text('More Text');

    return bytes;
  }
}
  // Future<Ticket> _ticket(PaperSize paper) async {
  //   final ticket = Ticket(paper);
  //   ticket.text(widget.counterValue);
  //   ticket.cut();
  //   return ticket;
  // }

