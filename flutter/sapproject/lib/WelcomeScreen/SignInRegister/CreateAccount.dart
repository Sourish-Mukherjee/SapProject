import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sapproject/WelcomeScreen/SignInRegister/SignIn.dart';
import 'package:sapproject/WelcomeScreen/SignInRegister/backEnd/CreateAccoutBackEnd.dart';
import 'package:sapproject/WelcomeScreen/SignInRegister/backEnd/SignInText.dart';
import 'package:sapproject/WelcomeScreen/SignInRegister/frontEnd/DarkBlueGreyClipper.dart';
import 'package:sapproject/WelcomeScreen/SignInRegister/frontEnd/LightBlueGreyClipper.dart';

class CreateAccount extends StatefulWidget {
  @override
  _CreateAccountState createState() => _CreateAccountState();
}

class _CreateAccountState extends State<CreateAccount> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _departController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _repassController = TextEditingController();
  String _chosenCategory = "";
  @override
  Widget build(BuildContext context) {
    final double _categoryContainerHeight =
        MediaQuery.of(context).size.height * 0.2;
    final double _categoryContainerWidth =
        MediaQuery.of(context).size.width * 0.5;
    final double _passwordEntryWidth = MediaQuery.of(context).size.width * 0.6;
    final double _designContainerHeight =
        MediaQuery.of(context).size.height * 0.35;
    return Scaffold(
        body: Column(
      children: [
        Container(
          height: _designContainerHeight,
          child: Stack(children: <Widget>[
            ClipPath(
              clipper: DarkBlueGrey(),
              child: Container(
                color: Colors.blueGrey[400],
              ),
            ),
            ClipPath(
              clipper: BlueGreyLight(),
              child: Container(
                color: Colors.blueGrey[900],
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin: const EdgeInsets.only(bottom: 45),
                child: Text(
                  SignInText.HEADING_CREATE_ACCOUNT,
                  style:
                      GoogleFonts.montserrat(fontSize: 45, color: Colors.black),
                ),
              ),
            ),
          ]),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 5),
                  width: _passwordEntryWidth,
                  child: TextFormField(
                      obscureText: false,
                      controller: _nameController,
                      cursorColor: Colors.blueGrey,
                      decoration: InputDecoration(
                          labelText: SignInText.NEW_USER_NAME,
                          labelStyle: TextStyle(color: Colors.blueGrey),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                              width: 1.0,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.account_circle,
                            color: Colors.black,
                          ))),
                ),
                Divider(
                  color: Colors.transparent,
                  thickness: 0.5,
                ),
                Container(
                  width: _passwordEntryWidth,
                  child: TextFormField(
                      controller: _phoneController,
                      validator: (value) {
                        if (value.isEmpty) {
                          Fluttertoast.showToast(
                              msg: "Please enter Phone Number");
                          return null;
                        } else
                          return null;
                      },
                      keyboardType: TextInputType.phone,
                      cursorColor: Colors.blueGrey,
                      decoration: InputDecoration(
                          labelText: SignInText.NEW_USER_PHONE,
                          labelStyle: TextStyle(color: Colors.blueGrey),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                              width: 1.0,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.phone,
                            color: Colors.black,
                          ))),
                ),
                Divider(
                  color: Colors.transparent,
                  thickness: 0.5,
                ),
                Container(
                  width: _passwordEntryWidth,
                  child: TextFormField(
                      controller: _departController,
                      cursorColor: Colors.blueGrey,
                      decoration: InputDecoration(
                          labelText: SignInText.NEW_USER_DEPT,
                          labelStyle: TextStyle(color: Colors.blueGrey),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                              width: 1.0,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.work,
                            color: Colors.black,
                          ))),
                ),
                Divider(
                  color: Colors.transparent,
                  thickness: 0.5,
                ),
                Container(
                  width: _passwordEntryWidth,
                  child: TextFormField(
                      obscureText: false,
                      controller: _emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.blueGrey,
                      decoration: InputDecoration(
                          labelText: SignInText.EMAIL_ID,
                          labelStyle: TextStyle(color: Colors.blueGrey),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                              width: 1.0,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.email,
                            color: Colors.black,
                          ))),
                ),
                Divider(
                  color: Colors.transparent,
                  thickness: 0.5,
                ),
                Container(
                  width: _passwordEntryWidth,
                  child: TextFormField(
                      obscureText: true,
                      controller: _passController,
                      cursorColor: Colors.blueGrey,
                      decoration: InputDecoration(
                          labelText: SignInText.PASSWORD,
                          labelStyle: TextStyle(color: Colors.blueGrey),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                              width: 1.0,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ))),
                ),
                Divider(
                  color: Colors.transparent,
                  thickness: 0.5,
                ),
                Container(
                  width: _passwordEntryWidth,
                  child: TextFormField(
                      obscureText: true,
                      controller: _repassController,
                      cursorColor: Colors.blueGrey,
                      decoration: InputDecoration(
                          labelText: SignInText.CONFIRM_PASSWORD,
                          labelStyle: TextStyle(color: Colors.blueGrey),
                          fillColor: Colors.white,
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                            ),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20.0),
                            borderSide: BorderSide(
                              color: Colors.blueGrey,
                              width: 1.0,
                            ),
                          ),
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.black,
                          ))),
                ),
                Container(
                    margin: const EdgeInsets.only(top: 20),
                    width: _passwordEntryWidth,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: LinearGradient(
                            begin: Alignment.centerLeft,
                            end: Alignment.centerRight,
                            colors: [Colors.blueGrey, Colors.blueGrey[900]])),
                    child: TextButton(
                      onPressed: () {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15))),
                              child: SizedBox(
                                  height: _categoryContainerHeight,
                                  width: _categoryContainerWidth,
                                  child: Container(
                                    color: Colors.white,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Text(SignInText.TYPE,
                                                style: GoogleFonts.ubuntu(
                                                    textStyle: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 20)))),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              GestureDetector(
                                                  onTap: () {
                                                    _chosenCategory =
                                                        "Employee";
                                                    validation();
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    decoration: BoxDecoration(
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight,
                                                            colors: [
                                                          Colors.blueGrey,
                                                          Colors.blueGrey[900]
                                                        ])),
                                                    child: Text(
                                                      "Employee",
                                                      style: GoogleFonts.ubuntu(
                                                          color: Colors.white,
                                                          fontSize: 20),
                                                    ),
                                                  )),
                                              GestureDetector(
                                                  onTap: () {
                                                    _chosenCategory = "HR";
                                                    validation();
                                                  },
                                                  child: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            15),
                                                    decoration: BoxDecoration(
                                                        gradient: LinearGradient(
                                                            begin: Alignment
                                                                .centerLeft,
                                                            end: Alignment
                                                                .centerRight,
                                                            colors: [
                                                          Colors.blueGrey,
                                                          Colors.blueGrey[900]
                                                        ])),
                                                    child: Text("HR",
                                                        style:
                                                            GoogleFonts.ubuntu(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 20)),
                                                  )),
                                            ]),
                                      ],
                                    ),
                                  )),
                            );
                          },
                        );
                      },
                      child: Text(SignInText.HEADING_CREATE_ACCOUNT,
                          style: GoogleFonts.ubuntu(
                              color: Colors.white, fontSize: 20)),
                    ))
              ],
            ),
          ),
        ),
      ],
    ));
  }

  void validation() {
    if (_passController.text == _repassController.text) {
      CreateAccountBackEnd().createAccount(
          context: context,
          name: _nameController.text,
          phone: _phoneController.text,
          dept: _departController.text,
          email: _emailController.text,
          pass: _passController.text,
          category: _chosenCategory);
    } else
      Fluttertoast.showToast(msg: "Password did not match with Re Passsword!");
  }
}
