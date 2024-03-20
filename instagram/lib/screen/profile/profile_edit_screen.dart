import 'package:flutter/material.dart';

class ProfileEditScreen extends StatelessWidget {
  const ProfileEditScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _appBar(context),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Icon(
            Icons.account_circle,
            size: 120,
            color: Colors.grey,
          ),
          Center(
            child: Text(
              '사진 수정',
              style: TextStyle(
                color: Colors.blue,
              ),
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey[300],
          ),
          _textFields(context),
          _textButtonItem(title: "프로페셔널 계정으로 전환"),
          _textButtonItem(title: "아바타 만들기"),
          _textButtonItem(title: "개인정보 설정"),
        ],
      ),
    );
  }

  Column _textButtonItem({required String title}) {
    return Column(
          children: [
            Container(
              height: 1,
              color: Colors.grey[300],
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextButton(
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blue,
                      padding: EdgeInsets.zero,
                    ),
                    onPressed: () {},
                    child: Text(
                      title,
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
  }

  Column _textFields(BuildContext context) {
    return Column(
      children: [
        _textFieldItem(
          context,
          title: '이름',
          placeholder: '가천대학교 UMC iOS',
        ),
        _textFieldItem(
          context,
          title: '사용자 이름',
          placeholder: 'umc_ios',
        ),
        _textFieldItem(
          context,
          title: '소개',
          placeholder: 'umc ios 트랙 짱',
        ),
        _textFieldItem(
          context,
          title: '링크',
          placeholder: 'www.naver.com',
          hideUnderLine: true,
        ),
      ],
    );
  }

  Row _textFieldItem(BuildContext context,
      {required String title,
      required String placeholder,
      bool hideUnderLine = false}) {
    final TextEditingController _controller =
        TextEditingController(text: placeholder);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16.0,
            vertical: 14.0,
          ),
          child: Text(
            title,
            style: TextStyle(fontSize: 15),
          ),
        ),
        Spacer(),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('1231231231'),
            Container(
              width: MediaQuery.of(context).size.width - 120,
              child: TextField(
                controller: _controller,
                style: TextStyle(
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width - 120,
              height: hideUnderLine ? 0 : 1,
              color: Colors.grey[300],
            ),
          ],
        )
      ],
    );
  }

  AppBar _appBar(BuildContext context) {
    return AppBar(
      title: Text(
        "프로필 수정",
        style: TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w700,
        ),
      ),
      leading: TextButton(
        style: TextButton.styleFrom(
          foregroundColor: Colors.black,
        ),
        onPressed: () {
          Navigator.of(context).pop();
        },
        child: Text('취소'),
      ),
      actions: [
        TextButton(
          style: TextButton.styleFrom(foregroundColor: Colors.blue),
          onPressed: () {},
          child: Text('완료'),
        ),
      ],
      backgroundColor: Colors.white,
    );
  }
}
