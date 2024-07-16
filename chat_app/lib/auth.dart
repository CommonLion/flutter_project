import 'package:flutter/material.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  State<StatefulWidget> createState() {
    return _AuthScreenState();
  }
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(
                  // 각방향으로 마진
                  top: 30,
                  bottom: 20,
                  left: 20,
                  right: 20,
                ),
                width: 200, //컨테이너의 너비
                child: Image.asset('assets/images/chat.png'),
              ),
              Card(
                margin: const EdgeInsets.all(20),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Form(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,//공간을 최재한 차지하게
                        children: [
                          TextFormField(
                             decoration: InputDecoration(
                              labelText: 'Email Address'
                             ),
                             keyboardType: TextInputType.emailAddress,
                             autocorrect: false,
                             textCapitalization: TextCapitalization.none ,
                          ),
                          TextFormField(
                             decoration: InputDecoration(
                              labelText: 'Password'
                             ),
                             obscureText: true, //***처럼 */
                          )
                        ],
                      ),
                    ),//여기 양식 위젯 사용
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
