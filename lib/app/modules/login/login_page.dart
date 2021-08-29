import 'package:flutter/material.dart';
import 'package:flutter_form/app/modules/login/login_store.dart';
import 'package:flutter_form/app/modules/login/widgets/custom_checkbox.dart';
import 'package:flutter_form/app/modules/login/widgets/custom_formfield.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginStore store = LoginStore();

  @override
  void initState() {
    store.setupValidations();
    super.initState();
  }

  @override
  void dispose() {
    store.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.indigo,
              Colors.purple,
            ],
          ),
        ),
        child: Center(
          child: Column(
            children: [
              Observer(builder: (_) {
                return GestureDetector(
                  onTap: store.animateLogo,
                  child: FlutterLogo(
                    style: store.logoStyle,
                    textColor: Colors.black,
                    size: 150,
                  ),
                );
              }),
              Container(
                height: 430,
                width: 430,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(20),
                ),
                padding: EdgeInsets.all(30),
                child: Form(
                    child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Sign in",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 10),
                    Text(
                      "Login to manage your account",
                      textAlign: TextAlign.start,
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 14,
                          fontWeight: FontWeight.normal),
                    ),
                    SizedBox(height: 30),
                    Observer(builder: (_) {
                      return CustomFormField(
                        onChanged: (value) => store.username = value,
                        errorText: store.error.username,
                        label: "Login",
                        icon: Icons.login,
                      );
                    }),
                    SizedBox(height: 20),
                    Observer(builder: (_) {
                      return CustomFormField(
                        onFieldSubmitted: (value) => store.validateAll(context),
                        onChanged: (value) => store.password = value,
                        errorText: store.error.password,
                        obscureText: true,
                        label: "Password",
                        icon: Icons.vpn_key,
                      );
                    }),
                    SizedBox(height: 10),
                    Observer(builder: (_) {
                      return CustomCheckBox(
                          onChanged: store.setRememberCheckBox,
                          isChecked: store.rememberCheckBox,
                          text: "Remember me");
                    }),
                    SizedBox(height: 20),
                    Container(
                      height: 35,
                      width: double.infinity,
                      child: ElevatedButton(
                        style: ButtonStyle(
                          elevation: MaterialStateProperty.all(0),
                        ),
                        onPressed: () => store.validateAll(context),
                        child: Text("Sign in"),
                      ),
                    )
                  ],
                )),
              ),
              SizedBox(height: 30),
              GestureDetector(
                onTap: () {
                  print("Sign up");
                },
                child: Text.rich(
                  TextSpan(children: [
                    TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 14,
                            fontWeight: FontWeight.normal)),
                    TextSpan(
                      text: "Sign up",
                      style: TextStyle(
                          color: Colors.white70,
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ]),
                ),
              ),
              SizedBox(height: 10),
              GestureDetector(
                onTap: () {
                  print('Forgot password?');
                },
                child: Text(
                  "Forgot password?",
                  style: TextStyle(
                      color: Colors.white70,
                      fontSize: 12,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
