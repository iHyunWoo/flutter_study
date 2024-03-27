import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/screen/register/register_email_screen.dart';
import 'package:instagram/util/constants.dart';
import 'package:instagram/widget/login_textfield.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final emailController = TextEditingController();
  final pwController = TextEditingController();
  bool showClearButton = false;
  bool showPassword = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            _center(context),
            const Spacer(),
            _bottom()
          ],
        ),
      ),
    );
  }

  Padding _center(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SvgPicture.asset(
            '${Constants.imageBasePath}/InstagramLogo.svg',
            width: MediaQuery.of(context).size.width - 200,
          ),
          const SizedBox(
            height: 30,
          ),
          LoginTextField(
            controller: emailController,
            placeHolder: "전화번호, 사용자 이름 또는 이메일",
            suffixIcon: showClearButton
                ? IconButton(
                    icon:
                        Image.asset('${Constants.imageBasePath}/XinCircle.png'),
                    onPressed: () {
                      emailController.clear();
                    },
                  )
                : null,
            onChanged: (text) {
              if (text != "" && !showClearButton) {
                setState(() {
                  showClearButton = true;
                });
              } else if (text == "") {
                setState(() {
                  showClearButton = false;
                });
              }
            },
          ),
          const SizedBox(
            height: 10,
          ),
          LoginTextField(
              controller: pwController,
              placeHolder: "비밀번호",
              isSecureText: !showPassword,
              suffixIcon: showPassword
                  ? IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = false;
                        });
                      },
                      icon: Image.asset(
                          '${Constants.imageBasePath}/Invisible.png'),
                    )
                  : IconButton(
                      onPressed: () {
                        setState(() {
                          showPassword = true;
                        });
                      },
                      icon:
                          Image.asset('${Constants.imageBasePath}/Visible.png'),
                    )),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: Text('비밀번호를 잊으셨나요?'),
                style: TextButton.styleFrom(
                  textStyle: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                  foregroundColor: Colors.blue,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          OutlinedButton(
            onPressed: () {
              login();
            },
            style: OutlinedButton.styleFrom(
              backgroundColor: Colors.blue,
              side: BorderSide.none,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
            child: Text(
              '로그인',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void login() async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailController.text,
        password: pwController.text,
      );

      final data = await FirebaseDatabase.instance.ref().child('users').orderByChild('email').equalTo(emailController.text).once();
      Map<dynamic, dynamic> userData = data.snapshot.value as Map<dynamic, dynamic>;

      if (userData != null) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        userData.forEach((key, value) {
          prefs.setString(key.toString(), value.toString());
        });
      }

      Navigator.pushReplacementNamed(context, '/main');
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("로그인 실패"),
        ),
      );
    }
  }

  Column _bottom() {
    return Column(
      children: [
        Container(
          height: 1,
          color: Constants.borderColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('계정이 없으신가요?'),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text("가입하기"),
              style: TextButton.styleFrom(
                foregroundColor: Colors.blue,
              ),
            )
          ],
        ),
      ],
    );
  }
}
