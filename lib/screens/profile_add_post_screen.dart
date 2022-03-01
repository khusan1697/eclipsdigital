import 'package:eclipsdigital/repository/repository.dart';
import 'package:eclipsdigital/size_config.dart';
import 'package:flutter/material.dart';

import '../style/theme.dart';

class ProfileAddPostScreen extends StatefulWidget {
  const ProfileAddPostScreen({Key? key}) : super(key: key);

  @override
  State<ProfileAddPostScreen> createState() => _ProfileAddPostScreenState();
}

class _ProfileAddPostScreenState extends State<ProfileAddPostScreen> {
  final _keyForm = GlobalKey<FormState>();
  List<String> errors = [];
  TextEditingController email = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController description = TextEditingController();
  final EclipsDigitalRepository _repository = EclipsDigitalRepository();

  void addError({String? error}) {
    if (!errors.contains(error)) {
      errors.add(error!);
    }
  }

  void removeError({String? error}) {
    if (errors.contains(error)) {
      errors.remove(error);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Post",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: getProportionateScreenWidth(20),
          ),
        ),
      ),
      body: Form(
        key: _keyForm,
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: getProportionateScreenWidth(10)),
          child: Column(
            children: [
              SizedBox(height: getProportionateScreenHeight(20)),
              _buildEmailTextFieldForm(),
              SizedBox(height: getProportionateScreenHeight(20)),
              _buildNameTextFieldForm(),
              SizedBox(height: getProportionateScreenHeight(20)),
              _buildTextFormField(),
              SizedBox(height: getProportionateScreenHeight(20)),
              SizedBox(
                width: double.infinity,
                height: getProportionateScreenHeight(50),
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  color: const Color(0xff979797),
                  child: Text(
                    "Save post",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: getProportionateScreenWidth(18),
                    ),
                  ),
                  onPressed: () {},
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmailTextFieldForm() {
    return TextFormField(
      controller: email,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kEmailNullError);
        } else if (emailValidatorRegExp.hasMatch(value)) {
          removeError(error: kInvalidEmailError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kEmailNullError);
          return "";
        } else if (!emailValidatorRegExp.hasMatch(value)) {
          addError(error: kInvalidEmailError);
          return "";
        }
      },
      decoration: const InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: "Enter your email",
      ),
    );
  }

  Widget _buildNameTextFieldForm() {
    return TextFormField(
      controller: name,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kNameError);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kNameError);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: "Enter name",
      ),
    );
  }

  Widget _buildTextFormField() {
    return TextFormField(
      controller: description,
      onChanged: (value) {
        if (value.isNotEmpty) {
          removeError(error: kDescription);
        }
      },
      validator: (value) {
        if (value!.isEmpty) {
          addError(error: kDescription);
          return "";
        }
        return null;
      },
      decoration: const InputDecoration(
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: "Enter your description",
      ),
    );
  }
}
