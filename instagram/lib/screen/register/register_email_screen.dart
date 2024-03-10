import 'package:flutter/material.dart';
import 'package:instagram/util/constants.dart';
import 'package:instagram/widget/login_textfield.dart';

class RegisterEmailScreen extends StatelessWidget {
  const RegisterEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final emailController = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        automaticallyImplyLeading: false,
        title: Text(
          "이메일 주소 입력",
          style: TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w900,
          ),
        ),
        leading: Container(
          alignment: Alignment.topLeft,
          child: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.chevron_left),
            iconSize: 35,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                "이메일",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 1,
                color: Colors.black,
              ),
              const SizedBox(
                height: 12,
              ),
              LoginTextField(
                controller: emailController,
                placeHolder: "이메일 주소",
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                children: [
                  Expanded(
                    child: OutlinedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/register/name');
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
