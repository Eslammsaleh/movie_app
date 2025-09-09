import 'package:flutter/material.dart';
import 'package:flutter_application_1/constant/colors_pallet.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _controller = PageController();
  int _currentIndex = 0;

  final List<Map<String, String>> pages = [
    {
      "image": "assets/image/onbording1.png",
      "title": "Find Your Next Favorite Movie Here",
      "desc":
          "Get access to a huge library of movies to suit all tastes. You will surely like it.",
      "btn": "Explore Now",
    },
    {
      "image": "assets/image/onbording2.png",
      "title": "Discover Movies",
      "desc":
          "Explore a vast collection of movies in all qualities and genres. Find your next favorite film with ease.",
      "btn": "Next",
    },
    {
      "image": "assets/image/onbording3.png",
      "title": "Explore All Genres",
      "desc":
          "Discover movies from every genre, in all available qualities. Find something new and exciting to watch every day.",
      "btn": "Next",
    },
    {
      "image": "assets/image/onbording4.png",
      "title": "Create Watchlists",
      "desc":
          "Save movies to your watchlist to keep track of what you want to watch next. Enjoy films in various qualities and genres.",
      "btn": "Next",
    },
    {
      "image": "assets/image/onbording5.png",
      "title": "Rate, Review, and Learn",
      "desc":
          "Share your thoughts on the movies you’ve watched. Dive deep into film details and help others discover great movies with your reviews.",
      "btn": "Next",
    },
    {
      "image": "assets/image/onbording6.png",
      "title": "Start Watching Now",
      "desc": ".", // مش هنستخدمه
      "btn": "Finish",
    },
  ];

  Future<void> _finishOnboarding() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('seenOnboarding', true);
    if (!mounted) return;
    Navigator.pushReplacementNamed(context, "/login");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _controller,
        itemCount: pages.length,
        onPageChanged: (i) => setState(() => _currentIndex = i),
        itemBuilder: (_, i) {
          final page = pages[i];
          return Stack(
            fit: StackFit.expand,
            children: [
              Image.asset(page['image']!, fit: BoxFit.fill),

              // أول صفحة: الزرار فوق الصورة
              if (i == 0)
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: 40,
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          page['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorsPallet.white,
                          ),
                        ),
                        const SizedBox(height: 12),
                        Text(
                          page['desc']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.white70,
                          ),
                        ),
                        const SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsPallet.primaryColor,
                            foregroundColor: ColorsPallet.black,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          onPressed: () {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 300),
                              curve: Curves.easeInOut,
                            );
                          },
                          child: Text(page['btn']!),
                        ),
                      ],
                    ),
                  ),
                )
              else
                // باقي الصفحات: جوه Container أسود
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    width: double.infinity,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 10,//20
                      vertical: 20,//30
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.black87,
                      borderRadius: BorderRadius.vertical(
                        top: Radius.circular(30),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          page['title']!,
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: ColorsPallet.white,
                          ),
                        ),

                        // الوصف يظهر إلا في آخر صفحة
                        if (i != pages.length - 1) ...[
                          const SizedBox(height: 12),
                          Text(
                            page['desc']!,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.white70,
                            ),
                          ),
                          const SizedBox(height: 30),
                        ] else
                          const SizedBox(height: 20),

                        // الأزرار
                        if (i == 1)
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: ColorsPallet.black,
                              foregroundColor: ColorsPallet.primaryColor,
                              minimumSize: const Size.fromHeight(45),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                            onPressed: () {
                              _controller.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOut,
                              );
                            },
                            child: Text(page['btn']!),
                          )
                        else
                          Column(
                            children: [
                              ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor:ColorsPallet.primaryColor,
                                  foregroundColor: ColorsPallet.black,
                                  minimumSize: const Size.fromHeight(45),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                ),
                                onPressed: () {
                                  if (i == pages.length - 1) {
                                    _finishOnboarding();
                                  } else {
                                    _controller.nextPage(
                                      duration: const Duration(
                                        milliseconds: 300,
                                      ),
                                      curve: Curves.easeInOut,
                                    );
                                  }
                                },
                                child: Text(page['btn']!),
                              ),
                              const SizedBox(height: 12),
                              if (i != pages.length - 1)
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: const BorderSide(color: ColorsPallet.primaryColor),
                                    foregroundColor: ColorsPallet.primaryColor,
                                    minimumSize: const Size.fromHeight(45),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  onPressed: () {
                                    _controller.previousPage(
                                      duration:
                                          const Duration(milliseconds: 300),
                                      curve: Curves.easeInOut,
                                    );
                                  },
                                  child: const Text("Back"),
                                ),
                            ],
                          ),
                      ],
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
