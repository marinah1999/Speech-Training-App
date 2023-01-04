import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';
import 'login_button_widget.dart';
import 'email_field_widget.dart';
import 'main_color.dart';
import 'pass_field_widget.dart';

class LoginW extends StatefulWidget {
  @override
  State<LoginW> createState() => _LoginWState();
}

class _LoginWState extends State<LoginW> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            HexColor('#020024'),
            HexColor('#090979'),
            HexColor('#00d4ff'),
            // HexColor('#6dd5ed'),
          ],
          stops: const [0, 0.40, 1],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: <
            Widget>[
          Container(
            width: double.infinity,
            padding: EdgeInsets.fromLTRB(100.0, 100.0, 80.0, 0.0),
            child: Stack(
              children: const <Widget>[
                CircleAvatar(
                  radius: 80.0,
                  backgroundImage:
                      AssetImage('images/photo6035299808710866580.jpg'),
                ),
              ],
            ),
          ),
          Container(
              width: double.infinity,
              padding: EdgeInsets.fromLTRB(100.0, 0.0, 80.0, 0.0),
              child: Image.asset(
                'images/fluencia kitabe white (2).png',
                fit: BoxFit.fill,
              )),
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                  width: 300,
                  height: 300,
                  color: Colors.white.withAlpha(350),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Center(
                        child: Form(
                          key: formKey,
                          child: SingleChildScrollView(
                            padding: EdgeInsets.only(bottom: 0),
                            child: Column(
                              children: [
                                Padding(
                                    padding: EdgeInsets.fromLTRB(10, 1, 10, 0)),
                                EmailFieldWidget(controller: emailController),
                                const SizedBox(height: 5),
                                Padding(
                                    padding:
                                        EdgeInsets.fromLTRB(10, 10, 10, 0)),
                                PassFieldWidget(controller: passwordController),
                                const SizedBox(height: 5),
                                buildNoAccount(),
                                buildButton(),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }

  Widget buildButton() => ButtonWidget(
        text: 'LOGIN',
        onClicked: () {
          Navigator.of(context).pushNamed('/start');
          final form = formKey.currentState;

          if (form!.validate()) {
            final email = emailController.text;

            ScaffoldMessenger.of(context)
              ..removeCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text('Your email is $email'),
              ));
          }
        },
      );

  Widget buildNoAccount() => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Don\'t have an account?'),
          TextButton(
            child: Text(
              'SIGN UP',
            ),
            onPressed: () {
              Navigator.of(context).pushNamed('/signup');
            },
          ),
        ],
      );
}
