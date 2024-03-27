import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../model/UserModel.dart';

class ProfileEditScreen extends StatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen> {
  TextEditingController nameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  TextEditingController linkController = TextEditingController();
  String? email;

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      setState(() {
        userNameController.text = prefs.getString('userName') ?? "";
        nameController.text = prefs.getString('name') ?? "";
        descriptionController.text = prefs.getString('description') ?? "";
        linkController.text = prefs.getString('link') ?? "";
        email = prefs.getString('email') ?? "";
      });
    });
  }

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
          controller: nameController,
        ),
        _textFieldItem(
          context,
          title: '사용자 이름',
          controller: userNameController,
        ),
        _textFieldItem(
          context,
          title: '소개',
          controller: descriptionController,
        ),
        _textFieldItem(
          context,
          title: '링크',
          controller: linkController,
          hideUnderLine: true,
        ),
      ],
    );
  }

  Row _textFieldItem(BuildContext context, {
    required String title,
    required TextEditingController controller,
    bool hideUnderLine = false,
  }) {
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
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 120,
              child: TextField(
                controller: controller,
                style: TextStyle(
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                ),
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width - 120,
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
          onPressed: () async {
            final Map<dynamic, dynamic> userData = (await FirebaseDatabase.instance
                .ref()
                .child('users')
                .orderByChild('email')
                .equalTo(email)
                .once())
                .snapshot
                .value as Map<dynamic, dynamic>;
            final String key = userData.keys.first;

            await FirebaseDatabase.instance.ref().child('users').child(key).update({
                'email': email ?? '',
                'name': nameController.text,
                'userName': userNameController.text,
                'description': descriptionController.text,
                'link': linkController.text,
            });
            SharedPreferences prefs = await SharedPreferences.getInstance();

            prefs.setString('email', email ?? '');
            prefs.setString('name', nameController.text);
            prefs.setString('userName', userNameController.text);
            prefs.setString('description', descriptionController.text);
            prefs.setString('link', linkController.text);

            Navigator.pop(context);
          },
          child: Text('완료'),
        ),
      ],
      backgroundColor: Colors.white,
    );
  }
}
