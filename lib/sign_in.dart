import 'package:flutter/material.dart';
import 'package:hello_fridge/main.dart';
import 'package:hello_fridge/main_layout.dart';
import 'package:sign_button/sign_button.dart';

class SignInLayout extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image(
                image: AssetImage('assets/images/logo.png'),
              ),
              SizedBox(height: 70.0),
              Container(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SignInButton(
                        buttonType: ButtonType.google,
                        buttonSize: ButtonSize.large,
                        onPressed: () {
                          ingredientsInPot.clear();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => MainLayout()));
                        },
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      SignInButton(
                          buttonType: ButtonType.facebook,
                          buttonSize: ButtonSize.large,
                          onPressed: () {
                            ingredientsInPot.clear();
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => MainLayout(),
                              ),
                            );
                          }),
                      SizedBox(
                        height: 15,
                      ),
                      SignInButton(
                          buttonType: ButtonType.twitter,
                          buttonSize: ButtonSize.large,
                          onPressed: () {
                            ingredientsInPot.clear();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => MainLayout()));
                          })
                    ]),
              )
            ],
          ),
        ),
      ),
    );
  }
}

// class SecondRoute extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Second Route"),
//       ),
//       body: Center(
//         child: ElevatedButton(
//           onPressed: () {
//             Navigator.pop(context);
//             // Navigate back to first route when tapped.
//           },
//           child: Text('Go back!'),
//         ),
//       ),
//     );
//   }
// }
