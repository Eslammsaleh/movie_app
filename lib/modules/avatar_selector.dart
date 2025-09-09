import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/assets_maneger.dart';

class AvatarSelector extends StatefulWidget {
  const AvatarSelector({super.key});

  @override
  State<AvatarSelector> createState() => _AvatarSelectorState();
}

class _AvatarSelectorState extends State<AvatarSelector> {
  final List<String> avatars = [
    AssetsManeger.avatarOne,
    AssetsManeger.avatarTwo,
    AssetsManeger.avatarThree,
    AssetsManeger.avatarFour,
    AssetsManeger.avatarFive,
    AssetsManeger.avatarSix,
    AssetsManeger.avatarSeven,
    AssetsManeger.avatarEight,
    AssetsManeger.avatarNine,
  ];

  late PageController _pageController;
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.5, // show part of left & right
      initialPage: 0,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          "Avatar",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        const SizedBox(height: 20),

        SizedBox(
          height: 250,
          child: PageView.builder(
            controller: _pageController,
            itemCount: avatars.length,
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemBuilder: (context, index) {
              // Distance from current page
              double scale = currentPage == index ? 1.0 : 0.7;

              return TweenAnimationBuilder(
                tween: Tween<double>(begin: scale, end: scale),
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
                builder: (context, value, child) {
                  return Transform.scale(
                    scale: value,
                    child: CircleAvatar(
                      radius: 80,
                      backgroundImage: AssetImage(avatars[index]),
                    ),
                  );
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
