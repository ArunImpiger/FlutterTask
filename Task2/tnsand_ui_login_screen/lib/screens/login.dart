import 'package:flutter/material.dart';
import 'package:tnsand_ui_login_screen/screens/registration.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    var t_height;
    var b_height;
    if (MediaQuery.of(context).size.width <= 420) {
      t_height = MediaQuery.of(context).size.height * 0.76;
      b_height = MediaQuery.of(context).size.height * 0.17;
    } else {
      t_height = MediaQuery.of(context).size.height * 0.80;
      b_height = MediaQuery.of(context).size.height * 0.10;
    }
    var currentWidth = MediaQuery.of(context).size.width;
    print(currentWidth);
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Container(
                height: MediaQuery.of(context).size.height,
                color: const Color(0xFF462E82),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    height: MediaQuery.of(context).size.height * .30,
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          child: Text('Not having an account?'),
                          padding: EdgeInsets.only(top: 100),
                        ),
                        Padding(
                          padding: EdgeInsets.only(top: 100),
                          child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Registration()));
                              },
                              child: const Text(
                                'REGISTER',
                                style: TextStyle(color: Color(0xFF462E82)),
                              )),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 50, vertical: 100),
                child: Center(
                  child: Column(
                    children: const [
                      Image(
                        // alignment: Alignment.center,
                        height: 140,
                        width: 140,
                        image:
                            AssetImage('assets/Tamilnadu-Government-Color.png'),
                      ),
                      Text(
                        'TNSand',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 24,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text('Water Resources Department',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 15,
                              color: Colors.white60),
                          textAlign: TextAlign.start),
                      Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Text(
                          'Public Entry',
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontSize: 14,
                              color: Colors.white),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 400, bottom: 100, right: 12, left: 12),
                child: Card(
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.05,
                      right: MediaQuery.of(context).size.width * 0.05),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  elevation: 8,
                  child: Container(
                    padding: EdgeInsets.all(15),
                    margin: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.white,
                    ),
                    height: MediaQuery.of(context).size.height * 0.25,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      children: [
                        const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Sign In',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(
                              Icons.mobile_friendly_outlined,
                              color: Color(0xFF462E82),
                            ),
                            hintText: '',
                            labelText: 'Mobile No',
                          ),
                          onSaved: (String? value) {},
                          validator: (String? value) {},
                        ),
                        TextFormField(
                          decoration: const InputDecoration(
                            icon: Icon(Icons.lock_outline,
                                color: Color(0xFF462E82)),
                            hintText: '',
                            labelText: 'Password',
                          ),
                          onSaved: (String? value) {
                            // This optional block of code can be used to run
                            // code when the user saves the form.
                          },
                          validator: (String? value) {},
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Positioned(
                top: t_height,
                bottom: b_height,
                left: MediaQuery.of(context).size.width * 0.20,
                right: MediaQuery.of(context).size.width * 0.20,
                child: MaterialButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  onPressed: () {},
                  color: const Color(0xFF462E82),
                  // height: MediaQuery.of(context).size.height * 0.05,
                  // minWidth: MediaQuery.of(context).size.width * 0.90,
                  child: const Text(
                    'Sign In',
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
