import 'package:flutter/material.dart';
import 'package:sign_button/sign_button.dart';

class SignInWidget extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Align(
            alignment: Alignment.center,
            child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
              ),
              SizedBox(height: 70.0),
              // Text("HelloFridge",
              //     style: TextStyle(
              //         fontFamily: 'Pacifico',
              //         color: Colors.lightGreen,
              //         fontWeight: FontWeight.bold,
              //         fontSize: 40.0)),
              // Text("COOK LEFTOVERS, SAVE FOOD",
              //     style: TextStyle(
              //         color: Colors.lightGreen,
              //         fontSize: 20.0,
              //         letterSpacing: 2.5,
              //         fontFamily: 'SourceSansPro')),
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SignInButton(
                          buttonType: ButtonType.google,
                          buttonSize: ButtonSize.large,
                          onPressed: () {}),
                      SizedBox(
                        height: 15,
                      ),
                      SignInButton(
                          buttonType: ButtonType.facebook,
                          buttonSize: ButtonSize.large,
                          onPressed: () {}),
                      SizedBox(
                        height: 15,
                      ),
                      SignInButton(
                          buttonType: ButtonType.twitter,
                          buttonSize: ButtonSize.large,
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => SecondRoute()),
                            );
                          })
                    ]),
              )
            ]),
          ),
        ));
    // );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            // Navigate back to first route when tapped.
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}