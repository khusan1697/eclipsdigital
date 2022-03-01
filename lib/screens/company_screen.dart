import 'package:eclipsdigital/model/company.dart';
import 'package:eclipsdigital/size_config.dart';
import 'package:eclipsdigital/widget/user_company_widget.dart';
import 'package:flutter/material.dart';

class UserCompanyScreen extends StatelessWidget {
  final Company company;

  const UserCompanyScreen({
    Key? key,
    required this.company,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Company"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: getProportionateScreenHeight(25)),
            UserCompanyWidget(text1: "Name", text2: company.name),
            UserCompanyWidget(text1: "CatchPhrase", text2: company.catchPhrase),
            UserCompanyWidget(text1: "Bs", text2: company.bs),
          ],
        ),
      ),
    );
  }
}
