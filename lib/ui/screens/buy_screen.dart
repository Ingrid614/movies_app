import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:ludokin_agent/ui/widgets/transaction_field.dart';

class BuyScreen extends StatelessWidget{
  const BuyScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TransactionField(
      appBarTitle: "buy".tr(),
    );
  }




}