import 'package:esim/globals.dart';
import 'package:flutter/material.dart';
import 'package:pretty_qr_code/pretty_qr_code.dart';
import 'package:esim/src/mainpage/models/esim_model.dart'; // Import EsimResponse

class QrScreen extends StatefulWidget {
  final EsimResponse esim;
  QrScreen({
    Key? key,
    required this.esim,
  }) : super(key: key);

  @override
  State<QrScreen> createState() => _QrScreenState();
}

class _QrScreenState extends State<QrScreen> {
  Map<String, dynamic>? paymentIntentData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: const Text(
          'My eSIMs',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w900,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              children: [
                SizedBox(
                  width: getWidth(context) * 0.9,
                  child: const Text(
                    textAlign: TextAlign.center,
                    'Scan the given QR for activating the eSIM',
                    style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: getHeight(context) * 0.1,
                ),

                Material(
                  elevation: 20,
                  borderRadius: BorderRadius.circular(12),
                  child: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SizedBox(
                      width: getWidth(context) * 0.52,
                      child: PrettyQrView.data(
                        data: widget.esim.esim.activationCode,
                      ),
                    ),
                  ),
                ),

                const Spacer(),
                // ElevatedButton(
                //   onPressed: () async {
                //     StripePaymentHandle().payment('${widget.price}00');
                //     EsimResponse? esimResponse = await widget.esim;
                //     if (esimResponse != null) {
                //       ActivationController().userEsim(
                //         plan_ID: widget.plans['uid'],
                //         iCCID: esimResponse.esim.iccid.toString(),
                //       );
                //     } else {}
                //   },
                //   child: const Text('Payment'),
                // )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
