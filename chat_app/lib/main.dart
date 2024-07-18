import 'package:chat_app/screens/chat.dart';
import 'package:chat_app/screens/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

import 'package:chat_app/screens/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 63, 17, 177)),
      ),
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder: (ctx, snapshot) {
          //FireBase가 토큰을 로딩하지 않았거나 토큰이 아직 있는지 확인하지 않았다면 로딩화면을 보여준다.
          if(snapshot.connectionState == ConnectionState.waiting){
            return const SplashScreen();
          }

          if(snapshot.hasData){
            return const ChatScreen();
          }

          return const AuthScreen();
        },
      ),
      //futeurebuilder와 streambuilder의 차이는 결국 해결되면 이루어 진하는 것임. 퓨쳐는 하나의 값이나 오류만을 반환한다. 반면에 스트림은 시간에 따라 여러개의 값을 만들어내는 것임.
      //FirebaseAuth.instance.authStateChanges()는 사용자의 로그인 상태가 변경될 때마다 스트림을 반환한다. 이 스트림은 사용자가 로그인하거나 로그아웃할 때마다 새로운 값을 생성한다.
      //해당값의 변화가 우리에게 스트림과 스냅샷을 준다.

      //const AuthScreen(),
    );
  }
}
