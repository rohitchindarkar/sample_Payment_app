import 'package:flutter/material.dart';
import '../utility/HexColor.dart';
import 'package:lottie/lottie.dart';

class PaymentScreen extends StatefulWidget{
  static const String routeName = '/paymentScreen';

  const PaymentScreen({Key? key}) : super(key: key);

  @override
  _PaymentScreenState createState() => _PaymentScreenState();

}

class _PaymentScreenState extends State<PaymentScreen> {

  String senderImage ='';
  String senderName ='';

  @override
  void initState() {
    super.initState();
  }


  @override
  void dispose() {
    super.dispose();
  }


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final arguments = ModalRoute.of(context)!.settings.arguments as Map;
      senderImage = arguments['senderImage'] ?? '';
      senderName = arguments['senderName'] ?? '';
    return Scaffold(
      backgroundColor: HexColor('86bfff'),
      body: SafeArea(
        child:Column(
          children: [
            SizedBox(
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Center(
                    child: Lottie.asset('assets/lottie_file/lottie_payment_bg.json'),
                  ),
                  Center(
                    child: CircleAvatar(
                      minRadius: 50,
                      child: Image.asset("assets/images/$senderImage",width: 60.0, height: 60.0,),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              child:  Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children:  [
                  const Text('Paying',style: TextStyle(color: Colors.white,fontSize: 16,fontWeight: FontWeight.w500),),
                  const SizedBox(height: 8,),
                  Text(senderName,style: const TextStyle(color: Colors.white,fontSize: 26,fontWeight: FontWeight.bold),),
                  const SizedBox(height: 36,),
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 36),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      child:  const Text(
                        'Cancel Payment',
                        style: TextStyle(color: Colors.black, fontSize: 14.0,fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 60,)
                ],
              )
            )
          ],
        )
      ),
    );
  }

}