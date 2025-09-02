import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/app_constant.dart';

class AvatarSelector extends StatefulWidget {
  const AvatarSelector({super.key});

  @override
  State<AvatarSelector> createState() => _AvatarSelectorState();
}

class _AvatarSelectorState extends State<AvatarSelector> {
  final List<String> avatars = [
    AppConstant.avatar1,
    AppConstant.avatar2,
    AppConstant.avatar3,
  ];

  String? selectedAvatar;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130, // اضبط ارتفاع أكبر من radius عشان الصور تبان تمام
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 4),
        itemCount: avatars.length,
        itemBuilder: (context, index) {
          final avatar = avatars[index];
          final isSelected = selectedAvatar == avatar;

          return Center(
            // يخلّي الصورة في وسط الصف
            child: GestureDetector(
              onTap: () {
                setState(() {
                  selectedAvatar = avatar;
                });
              },
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 200),
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: CircleAvatar(
                  radius: isSelected ? 56 : 51, // يكبر شوية لو مختار
                  backgroundImage: AssetImage(avatar),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
