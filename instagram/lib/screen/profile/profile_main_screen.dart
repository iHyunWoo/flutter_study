import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:instagram/screen/profile/profile_tab_bar.dart';
import 'package:instagram/util/constants.dart';

class ProfileMainScreen extends StatefulWidget {
  const ProfileMainScreen({super.key});

  @override
  State<ProfileMainScreen> createState() => _ProfileMainScreenState();
}

class _ProfileMainScreenState extends State<ProfileMainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            _appbar(),
            _profileAndNumbers(),
            _nameAndDescription(),
            _buttons(),
            SliverToBoxAdapter(
              child: ProfileTabBar(),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _buttons() {
    return SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16.0,
                vertical: 8.0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: SizedBox(
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/profile/edit');
                        },
                        child: Text(
                          "프로필 편집",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.grey[100],
                          foregroundColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 35,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text(
                          "프로필 공유",
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8)),
                          shadowColor: Colors.transparent,
                          backgroundColor: Colors.grey[100],
                          foregroundColor: Colors.black,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  SizedBox(
                    width: 35,
                    height: 35,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset(
                        '${Constants.imageBasePath}/recommendFriend.png',
                        width: 35,
                        height: 35,
                      ),
                      padding: EdgeInsets.zero,
                      color: Colors.grey[100]!,
                    ),
                  ),
                ],
              ),
            ),
          );
  }

  SliverToBoxAdapter _nameAndDescription() {
    return SliverToBoxAdapter(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "가천대학교 UMC iOS",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              "umc ios 트랙 짱",
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }

  SliverToBoxAdapter _profileAndNumbers() {
    return SliverToBoxAdapter(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Stack(
            alignment: Alignment.bottomRight,
            children: [
              Icon(
                Icons.account_circle,
                size: 100,
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SvgPicture.asset(
                  '${Constants.imageBasePath}/storyPlus.svg',
                ),
              )
            ],
          ),
          Column(
            children: [
              Text(
                '0',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              Text(
                '게시물',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '0',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              Text(
                '게시물',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Text(
                '0',
                style: TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 15,
                ),
              ),
              Text(
                '게시물',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  SliverAppBar _appbar() {
    return SliverAppBar(
      backgroundColor: Colors.white,
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        background: Container(
          color: Colors.white,
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: SvgPicture.asset(
            '${Constants.imageBasePath}/plus.svg',
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: SvgPicture.asset(
            '${Constants.imageBasePath}/hamburger.svg',
          ),
        ),
      ],
      title: Row(
        children: [
          Text(
            "umc_ios",
            style: TextStyle(
              fontWeight: FontWeight.w800,
              fontSize: 22,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Container(
              width: 30,
              height: 20,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  "9...",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
