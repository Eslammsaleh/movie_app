import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/assets_maneger.dart';


class UbdateProfile extends StatefulWidget {
  const UbdateProfile({super.key});

  @override
  State<UbdateProfile> createState() => _UbdateProfileState();
}

class _UbdateProfileState extends State<UbdateProfile> {
  final nameController = TextEditingController(text: "John Safwat");
  final phoneController = TextEditingController(text: "01200000000");

  bool isEditingName = false;
  bool isEditingPhone = false;

  String selectedAvatar = AssetsManeger.avatarOne;

  final List<String> avatarList = [
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

  void _showAvatarPicker() {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: GridView.builder(
            shrinkWrap: true,
            itemCount: avatarList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 12,
              mainAxisSpacing: 12,
            ),
            itemBuilder: (context, index) {
              final avatar = avatarList[index];
              return GestureDetector(
                onTap: () {
                  setState(() {
                    selectedAvatar = avatar;
                  });
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: selectedAvatar == avatar
                          ? Colors.yellow
                          : Colors.transparent,
                      width: 3,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(avatar, fit: BoxFit.cover),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.yellow),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          "Pick Avatar",
          style: TextStyle(color: Colors.yellow),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Avatar with click
            GestureDetector(
              onTap: _showAvatarPicker,
              child: CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage(selectedAvatar),
                backgroundColor: Colors.transparent,
              ),
            ),
            const SizedBox(height: 30),

            // Name field
            GestureDetector(
              onTap: () {
                setState(() {
                  isEditingName = true;
                });
              },
              child: isEditingName
                  ? TextField(
                controller: nameController,
                autofocus: true,
                onSubmitted: (value) {
                  setState(() {
                    isEditingName = false;
                  });
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon:
                  const Icon(Icons.person, color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              )
                  : Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.person, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      nameController.text,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Phone field
            GestureDetector(
              onTap: () {
                setState(() {
                  isEditingPhone = true;
                });
              },
              child: isEditingPhone
                  ? TextField(
                controller: phoneController,
                keyboardType: TextInputType.phone,
                autofocus: true,
                onSubmitted: (value) {
                  setState(() {
                    isEditingPhone = false;
                  });
                },
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon:
                  const Icon(Icons.phone, color: Colors.white),
                  filled: true,
                  fillColor: Colors.grey[900],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              )
                  : Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),
                height: 55,
                decoration: BoxDecoration(
                  color: Colors.grey[900],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.phone, color: Colors.white),
                    const SizedBox(width: 10),
                    Text(
                      phoneController.text,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Reset password text
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Reset Password",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
            const Spacer(),

            // Delete account button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {},
                child: const Text(
                  "Delete Account",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 15),

            // Update data button
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.yellow,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                onPressed: () {
                  debugPrint("Name: ${nameController.text}");
                  debugPrint("Phone: ${phoneController.text}");
                  debugPrint("Avatar: $selectedAvatar");
                },
                child: const Text(
                  "Update Data",
                  style: TextStyle(fontSize: 18, color: Colors.black),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
