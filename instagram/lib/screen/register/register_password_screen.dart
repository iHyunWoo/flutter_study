import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../util/constants.dart';
import '../../widget/login_textfield.dart';

class RegisterPasswordScreen extends StatefulWidget {
  const RegisterPasswordScreen({super.key});

  @override
  State<RegisterPasswordScreen> createState() => _RegisterPasswordScreenState();
}

class _RegisterPasswordScreenState extends State<RegisterPasswordScreen> {
  bool isCheckedSavePw = true;

  @override
  Widget build(BuildContext context) {
    final passwordController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 20,
              ),
              const Text(
                "비밀번호 만들기",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "비밀번호를 저장할 수 있으므로 iCloud 기기에서 로그인 정보를 입력하지 않아도 됩니다.",
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              LoginTextField(
                controller: passwordController,
                isSecureText: true,
                placeHolder: "비밀번호",
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 24,
                    height: 24,
                    child: Checkbox(
                      value: isCheckedSavePw,
                      onChanged: (_) {
                        setState(() {
                          isCheckedSavePw = !isCheckedSavePw;
                        });
                      },
                      fillColor: MaterialStateColor.resolveWith(
                        (_) => isCheckedSavePw ? Colors.blue : Colors.white,
                      ),
                      checkColor: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text('비밀번호 저장'),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () async {
                        final SharedPreferences prefs = await SharedPreferences.getInstance();
                        await prefs.setString("password", passwordController.text);
                        Navigator.pushNamed(context, '/register/username');
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        side: BorderSide.none,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: Text(
                        '다음',
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              const Spacer(),
              _bottom(context),
            ],
          ),
        ),
      ),
    );
  }

  Column _bottom(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 1,
          color: Constants.borderColor,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('이미 계정이 있으신가요?'),
            TextButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/login'));
              },
              child: Text("로그인"),
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
