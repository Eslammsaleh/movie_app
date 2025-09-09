import 'package:flutter/material.dart';
import 'package:flutter_application_1/app_routes.dart';
import 'package:flutter_application_1/constant/colors_pallet.dart';
import 'package:flutter_application_1/screens/forget_password.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsPallet.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Image.asset(
                  "assets/image/logo.png",
                  height: 100,
                ),

                const SizedBox(height: 40),

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

                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    hintText: "Password",
                    prefixIcon: const Icon(Icons.lock, color: ColorsPallet.white),
                    suffixIcon:
                    const Icon(Icons.visibility, color: ColorsPallet.white),
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
                const SizedBox(height: 10),

                // Forget Password
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const ForgetPassword(),
                        ),
                      );
                    },
                    child: const Text(
                      "Forget Password ?",
                      style: TextStyle(color: ColorsPallet.primaryColor),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Login button
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacementNamed(
                          context, AppRoutes.main);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor:ColorsPallet.primaryColor,
                      foregroundColor:ColorsPallet.black,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: const Text("Login"),
                  ),
                ),
                const SizedBox(height: 20),

                // Create account
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't Have Account ? ",
                      style: TextStyle(color: Colors.white70),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                            context, AppRoutes.signup);
                      },
                      child: const Text(
                        "Create One",
                        style: TextStyle(
                          color:ColorsPallet.primaryColor,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                // Divider
                Row(
                  children: const [
                    Expanded(child: Divider(color: ColorsPallet.gray)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10),
                      child: Text("OR",
                          style: TextStyle(color: Colors.white70)),
                    ),
                    Expanded(child: Divider(color: ColorsPallet.gray)),
                  ],
                ),
                const SizedBox(height: 20),

                // Google login
                SizedBox(
                  width: double.infinity,
                  child: OutlinedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.g_mobiledata,
                        color:ColorsPallet.primaryColor, size: 30),
                    label: const Text(
                      "Login With Google",
                      style: TextStyle(color:ColorsPallet.primaryColor),
                    ),
                    style: OutlinedButton.styleFrom(
                      side: const BorderSide(color:ColorsPallet.primaryColor),
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // Flags row
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset("assets/icons/LR (6).png", height: 30),
                    const SizedBox(width: 10),
                    Image.asset("assets/icons/EG (3).png", height: 30),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
