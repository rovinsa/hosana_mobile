import 'package:flutter/material.dart';
import 'package:hosanna/utlilities/theme.dart';
import 'package:hosanna/widgets/ui/appbar.dart';
import 'package:hosanna/widgets/ui/transaction_card.dart';

class Transactions extends StatefulWidget {
  @override
  _TransactionsState createState() => _TransactionsState();
}

class _TransactionsState extends State<Transactions> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(
        title: 'My Transactions',
        bgColor: Colors.white,
        brightness: Brightness.light,
        iconColor: ColorTheme.darkColor,
        isCenter: false,
      ),
      body: ListView.builder(
        itemCount: 2,
        shrinkWrap: true,
        padding: EdgeInsets.only(top: 10, bottom: 50),
        itemBuilder: (BuildContext context, int index) {
          return TransactionCard(
            amount: '\$100',
            church: 'Winston Church',
            color: ColorTheme.primaryColor,
            dateTime: 'Feb 25, 2018',
            plan: 'Donation Plan Name',
          );
        },
      ),
    );
  }
}
