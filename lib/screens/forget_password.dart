import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/colors_pallet.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPallet.black,
      appBar: AppBar(
        backgroundColor: ColorsPallet.black,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: ColorsPallet.primaryColor),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          "Forget Password",
          style: TextStyle(color: ColorsPallet.primaryColor),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Image
              Image.asset(
                "assets/image/forgot_password.png",
                height: 200,
              ),
              const SizedBox(height: 30),

              // Email field
              TextField(
                decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: const Icon(Icons.email, color: ColorsPallet.white),
                  filled: true,
                  fillColor: Colors.grey[900],
                  hintStyle: const TextStyle(color: Colors.white70),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: ColorsPallet.white),
              ),
              const SizedBox(height: 20),

              // Verify Email button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    // TODO: Add your email verification logic here
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor:ColorsPallet.primaryColor,
                    foregroundColor: ColorsPallet.black,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: const Text("Verify Email"),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
