import 'dart:developer';
import 'dart:io';

import 'package:flutter/foundation.dart';

import 'package:upi_india/upi_india.dart';
import 'package:flutter/material.dart';
import 'package:gpay/qrupi.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class QRViewExample extends StatefulWidget {
  const QRViewExample({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QRViewExampleState();
}

class _QRViewExampleState extends State<QRViewExample> {
  Barcode? result;
  QRViewController? controller;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');

  // In order to get hot reload to work we need to pause the camera if the platform
  // is android, or resume the camera if the platform is iOS.
  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    }
    controller!.resumeCamera();
  }

  void extractDataFromQRCode(String qrCodeURL) {
    // Split the URL using '&' as delimiter to get individual parameters
    List<String> params = qrCodeURL.split('&');

    // Initialize a list to store extracted data
    List<String> extractedData = [];

    // Loop through the parameters and extract data after '=' symbol
    for (String param in params) {
      int equalIndex = param.indexOf('=');
      if (equalIndex != -1 && equalIndex < param.length - 1) {
        String extractedValue = param.substring(equalIndex + 1);
        extractedData.add(extractedValue);
      }
    }

    // Print the extracted data
    print("Extracted Data: $extractedData");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(flex: 4, child: _buildQrView(context)),
        ],
      ),
    );
  }

  Widget _buildQrView(BuildContext context) {
    // For this example we check how width or tall the device is and change the scanArea and overlay accordingly.
    var scanArea = (MediaQuery.of(context).size.width < 400 ||
            MediaQuery.of(context).size.height < 400)
        ? 150.0
        : 300.0;
    // To ensure the Scanner view is properly sizes after rotation
    // we need to listen for Flutter SizeChanged notification and update controller
    return QRView(
      key: qrKey,
      onQRViewCreated: _onQRViewCreated,
      overlay: QrScannerOverlayShape(
          borderColor: Colors.green,
          borderRadius: 10,
          borderLength: 30,
          borderWidth: 10,
          cutOutSize: scanArea),
      onPermissionSet: (ctrl, p) => _onPermissionSet(context, ctrl, p),
    );
  }

  void _onQRViewCreated(QRViewController controller) {
    setState(() {
      this.controller = controller;
    });
    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        print(result!.code);

        // Check if result is not empty, then navigate to a new screen
        if (result!.code != null) {
          print(result!.code);
          Navigator.of(context).pop();
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(data: result!.code.toString()),
            ),
          );

          controller.pauseCamera();
        }
      });
    });
  }

  void _onPermissionSet(BuildContext context, QRViewController ctrl, bool p) {
    log('${DateTime.now().toIso8601String()}_onPermissionSet $p');
    if (!p) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('no Permission')),
      );
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }
}

class HomePage extends StatefulWidget {
  String? data; // Added constructor parameter

  HomePage({required this.data});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future<UpiResponse>? _transaction;
  UpiIndia _upiIndia = UpiIndia();
  List<UpiApp>? apps;

  // var data;

  // _HomePageState({required this.data});

  TextStyle header = TextStyle(
    fontSize: 18,
    fontWeight: FontWeight.bold,
  );
  var datasd;
  TextStyle value = TextStyle(
    fontWeight: FontWeight.w400,
    fontSize: 14,
  );

  @override
  void initState() {
    _upiIndia.getAllUpiApps(mandatoryTransactionId: false).then((value) {
      setState(() {
        apps = value;
        if (apps != null && apps!.isNotEmpty) {
          Navigator.of(context).pop();
          _transaction = initiateTransaction(apps![0]);
        }
      });
    }).catchError((e) {
      apps = [];
    });
    print('this is dash ${widget.data!}');
    datasd = extractDataFromQRCode(widget.data!);
    print('this is simple $datasd');
    // datasd = extractDataFromQRCode(widget.data!);
    // print(datasd);

    super.initState();
  }

  Future<UpiResponse> initiateTransaction(UpiApp app) async {
    return _upiIndia.startTransaction(
      app: app,
      receiverUpiId: datasd[0],
      receiverName: '',
      transactionRefId: 'TestingUpiIndiaPlugin',
      transactionNote: '',
      amount: (double.parse(datasd[2]) == null) ? 1.0 : double.parse(datasd[2]),
    );
  }

  extractDataFromQRCode(String qrCodeURL) {
    // Split the URL using '&' as delimiter to get individual parameters
    List<String> params = qrCodeURL.split('&');

    // Initialize a list to store extracted data
    List<String> extractedData = [];

    // Loop through the parameters and extract data after '=' symbol
    for (String param in params) {
      int equalIndex = param.indexOf('=');
      if (equalIndex != -1 && equalIndex < param.length - 1) {
        String extractedValue = param.substring(equalIndex + 1);
        extractedData.add(extractedValue);
      }
    }
    return extractedData;
  }

  Widget displayUpiApps() {
    return Container();
    // if (apps == null)
    //   return Center(child: CircularProgressIndicator());
    // else if (apps!.length == 0)
    //   return Center(
    //     child: Text(
    //       "No apps found to handle transaction.",
    //       style: header,
    //     ),
    //   );
    // else
    //   return Align(
    //     alignment: Alignment.topCenter,
    //     child: SingleChildScrollView(
    //       physics: BouncingScrollPhysics(),
    //       child: Wrap(
    //         children: apps!.map<Widget>((UpiApp app) {
    //           return GestureDetector(
    //             onTap: () {
    //               _transaction = initiateTransaction(app);
    //               setState(() {});
    //             },
    //             child: Container(
    //               height: 100,
    //               width: 100,
    //               child: Column(
    //                 mainAxisSize: MainAxisSize.min,
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 children: <Widget>[
    //                   Image.memory(
    //                     app.icon,
    //                     height: 60,
    //                     width: 60,
    //                   ),
    //                   Text(app.name),
    //                 ],
    //               ),
    //             ),
    //           );
    //         }).toList(),
    //       ),
    //     ),
    //   );
  }

  String _upiErrorHandler(error) {
    switch (error) {
      case UpiIndiaAppNotInstalledException:
        return 'Requested app not installed on device';
      case UpiIndiaUserCancelledException:
        return 'You cancelled the transaction';
      case UpiIndiaNullResponseException:
        return 'Requested app didn\'t return any response';
      case UpiIndiaInvalidParametersException:
        return 'Requested app cannot handle the transaction';
      default:
        return 'An Unknown error has occurred';
    }
  }

  void _checkTxnStatus(String status) {
    switch (status) {
      case UpiPaymentStatus.SUCCESS:
        print('Transaction Successful');
        break;
      case UpiPaymentStatus.SUBMITTED:
        print('Transaction Submitted');
        break;
      case UpiPaymentStatus.FAILURE:
        print('Transaction Failed');
        break;
      default:
        print('Received an Unknown transaction status');
    }
  }

  Widget displayTransactionData(title, body) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("$title: ", style: header),
          Flexible(
              child: Text(
            body,
            style: value,
          )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UPI'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: displayUpiApps(),
          ),
          Expanded(
            child: FutureBuilder(
              future: _transaction,
              builder:
                  (BuildContext context, AsyncSnapshot<UpiResponse> snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(
                        _upiErrorHandler(snapshot.error.runtimeType),
                        style: header,
                      ), // Print's text message on screen
                    );
                  }

                  // If we have data then definitely we will have UpiResponse.
                  // It cannot be null
                  UpiResponse _upiResponse = snapshot.data!;

                  // Data in UpiResponse can be null. Check before printing
                  String txnId = _upiResponse.transactionId ?? 'N/A';
                  String resCode = _upiResponse.responseCode ?? 'N/A';
                  String txnRef = _upiResponse.transactionRefId ?? 'N/A';
                  String status = _upiResponse.status ?? 'N/A';
                  String approvalRef = _upiResponse.approvalRefNo ?? 'N/A';
                  _checkTxnStatus(status);

                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        displayTransactionData('Transaction Id', txnId),
                        displayTransactionData('Response Code', resCode),
                        displayTransactionData('Reference Id', txnRef),
                        displayTransactionData('Status', status.toUpperCase()),
                        displayTransactionData('Approval No', approvalRef),
                      ],
                    ),
                  );
                } else
                  return Center(
                    child: Text(''),
                  );
              },
            ),
          )
        ],
      ),
    );
  }
}
