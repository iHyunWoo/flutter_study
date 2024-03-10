import 'package:flutter/material.dart';
import 'package:instagram/util/constants.dart';
import 'package:instagram/widget/login_textfield.dart';

class RegisterNameScreen extends StatelessWidget {
  const RegisterNameScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final nameController = TextEditingController();
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
                "이름 추가",
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "친구들이 회원님을 찾을 수 있도록 이름을 추가하세요."
              ),
              const SizedBox(
                height: 15,
              ),
              LoginTextField(
                controller: nameController,
                placeHolder: "이름",
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register/password');
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
