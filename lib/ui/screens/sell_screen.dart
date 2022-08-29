import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/widgets.dart';
import 'package:ludokin_agent/ui/widgets/transaction_field.dart';

class SellScreen extends StatelessWidget{
  const SellScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
   return TransactionField(
       appBarTitle: "sell".tr(),
   );
  }

}