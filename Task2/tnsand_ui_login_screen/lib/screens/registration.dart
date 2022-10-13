import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:tnsand_ui_login_screen/models/registration.dart';

class Registration extends StatefulWidget {
  Registration({Key? key, this.registration}) : super(key: key);
  RegistrationModel? registration;

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String? _name;
  String? _email;
  String? firstPage = '1/4';

  TextEditingController _password = TextEditingController();
  TextEditingController _confirmPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: const SystemUiOverlayStyle(statusBarColor: Color(0xFF462E82)),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: const Color(0xFF462E82),
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Registration',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
                Icon(
                  Icons.close,
                  size: 35,
                )
              ],
            ),
            toolbarHeight: kToolbarHeight + 50,
          ),
          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(left: 22, right: 22, top: 40),
              color: Colors.white,
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.disabled,
                child: FormUI(),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //Form Ui
  Widget FormUI() {
    return Column(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            SizedBox(
              width: 20,
            ),
            Text(
              'Basic Information',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              width: 120,
            ),
            CircularPercentIndicator(
              radius: 17,
              lineWidth: 3,
              percent: .25,
              progressColor: Color(0xFF462E82),
              center: Text(
                firstPage!,
                style: TextStyle(color: Color(0xFF462E82)),
              ),
            ),
          ],
        ),
        TextFormField(
          decoration: const InputDecoration(
              labelText: 'Name',
              prefixIcon: Icon(
                Icons.person,
                color: Color(0xFF462E82),
              ),
              helperMaxLines: 3,
              helperText: 'Please note that the Name provided here should '
                  'match the Name in the construction plan and ID '
                  'proof submitted.',
              helperStyle: TextStyle(fontSize: 16)),
          keyboardType: TextInputType.text,
          validator: validateName,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: (String? name) {
            widget.registration?.name = name;
          },
        ),
        TextFormField(
          decoration: const InputDecoration(
              labelText: 'Mobile No',
              prefixIcon: Icon(
                Icons.mobile_friendly,
                color: Color(0xFF462E82),
              ),
              helperText: 'OTP will be sent to this number for verfication',
              helperStyle: TextStyle(fontSize: 16)),
          keyboardType: TextInputType.phone,
          validator: validateMobile,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        TextFormField(
          decoration: const InputDecoration(
              labelText: 'Alternate Mobile No',
              prefixIcon: Icon(
                Icons.mobile_friendly,
                color: Color(0xFF462E82),
              )),
          keyboardType: TextInputType.phone,
          validator: validateMobile,
          autovalidateMode: AutovalidateMode.onUserInteraction,
        ),
        TextFormField(
          decoration: const InputDecoration(
              labelText: 'Email',
              prefixIcon: Icon(
                Icons.email_outlined,
                color: Color(0xFF462E82),
              )),
          keyboardType: TextInputType.emailAddress,
          validator: validateEmail,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          onSaved: (String? email) {
            _email = email;
          },
        ),
        TextFormField(
          controller: _password,
          decoration: const InputDecoration(
              labelText: 'Create Password',
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Color(0xFF462E82),
              )),
          keyboardType: TextInputType.visiblePassword,
          validator: validatePassword,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: true,
        ),
        TextFormField(
          controller: _confirmPassword,
          decoration: const InputDecoration(
              labelText: 'Confirm Password',
              prefixIcon: Icon(
                Icons.lock_outline,
                color: Color(0xFF462E82),
              )),
          keyboardType: TextInputType.visiblePassword,
          validator: validatePassword,
          // autovalidateMode: AutovalidateMode.onUserInteraction,
          obscureText: true,
        ),
        SizedBox(
          height: 50,
        ),
        MaterialButton(
          padding:
              const EdgeInsets.only(top: 15, bottom: 10, left: 120, right: 120),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              _formKey.currentState!.save();
              setState(() {
                widget.registration?.name = '';
                print('Name ${widget.registration?.name}');
                print('Email ${_email}');
              });
            } else {
              print('unsuccess');
            }
          },
          color: const Color(0xFF462E82),
          child: const Text(
            'Get OTP',
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
        ),
      ],
    );
  }

  //Name validation
  String? validateName(String? value) {
    if (value!.isEmpty) {
      return "Name field must not be empty";
    } else if (value.length < 3) {
      return "Name must be more than 2 charater";
    }
  }

  //Mobile number validation
  String? validateMobile(String? value) {
// Indian Mobile number are of 10 digit only
    if (value!.length != 10) {
      return 'Mobile Number must be of 10 digit';
    }
  }

  //Email validation
  String? validateEmail(String? value) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern.toString());
    if (value!.isEmpty) {
      return "Name field must not be empty";
    } else if (!regex.hasMatch(value)) {
      return 'Enter Valid Email';
    }
  }

  //Password validation
  String? validatePassword(String? value) {
    Pattern pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regex = RegExp(pattern.toString());
    if (value!.isEmpty) {
      return "Name field must not be empty";
    } else if (!regex.hasMatch(value)) {
      return 'Your password not in required standard';
    } else if (_password.text != _confirmPassword.text) {
      print("Your password doesn't match");
    }
    print('match');
  }
}
