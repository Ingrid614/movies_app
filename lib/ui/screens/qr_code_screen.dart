import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import '../widgets/gap.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return Scaffold(
        appBar: AppBar(
          title: Text("kin_address").tr(),
          leading: IconButton(
            onPressed: (){
              Navigator.pop(context);
            },
            icon: const Icon(Icons.arrow_back)
          ),
        ),
        body: SafeArea(
          child: Center(
            child: Container(
              padding: const EdgeInsets.all(10),
              height: h*0.6,
              width: w*0.8,
              color: Colors.white,
              child: Card(
                color: const Color(0xff818181),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0,),
                ),
                child: Column(
                  children: [
                    Gap(),
                    const Text("Wallet Address",
                      style: TextStyle(
                        color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 20.0),),
                    Container(
                      padding: const EdgeInsets.fromLTRB(5.0, 5.0, 5.0, 5.0),
                      height: h*0.3,
                      width: w*0.6,
                      child: Card(
                        elevation: 0,
                        color: const Color(0xff818181),
                        child: Image.asset('assets/images/QR-code.png'),),
                    ),
                        const Padding(
                          padding: EdgeInsets.fromLTRB(8.0, 0, 8.0, 0),
                          child: Text("kjfiwjiodjdnGHSNAjkjcknicqoihjijaKJFAOAJGJLFWJAKFJOAJJA",
                          style: TextStyle(color: Colors.white),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        const Gap(size: 20,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Gap(size: 15,),
                            ElevatedButton(
                              style: ButtonStyle(
                                backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                                fixedSize: MaterialStateProperty.all(const Size(75, 50))
                              ),
                                onPressed: (){},
                                child: const Text("Copy", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                            ElevatedButton(
                                style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(Colors.deepPurple),
                                    fixedSize: MaterialStateProperty.all(const Size(75, 50))
                                ),
                                onPressed: (){},
                            child: const Text("Share", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                            const Gap(size: 15,)
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        )
    );
  }
}