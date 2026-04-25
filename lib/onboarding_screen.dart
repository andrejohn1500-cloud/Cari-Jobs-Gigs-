import 'package:flutter/material.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({super.key});
  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<_Slide> _slides = const [
    _Slide(image: 'https://ajprjkpjjkppcphjvccv.supabase.co/storage/v1/object/public/onboarding/file_00000000d09871f7947fe7156df8be3e.jpg', title: 'Find Jobs Across The Caribbean', subtitle: 'Browse full-time, part-time and contract jobs from SVG to Jamaica and beyond.'),
    _Slide(image: 'https://ajprjkpjjkppcphjvccv.supabase.co/storage/v1/object/public/onboarding/file_00000000f32c71f7b60152098e305915.jpg', title: 'Post & Find Services', subtitle: 'Hire skilled tradespeople, designers, tutors and more or offer your own services.'),
    _Slide(image: 'https://ajprjkpjjkppcphjvccv.supabase.co/storage/v1/object/public/onboarding/file_0000000020a471f793f01f5fb6403f07.jpg', title: 'Connect With Local Employers', subtitle: 'Message employers directly, track your applications and grow your Caribbean career.'),
  ];

  void _nextPage() {
    if (_currentPage < 2) {
      _pageController.nextPage(duration: const Duration(milliseconds: 400), curve: Curves.easeInOut);
    } else {
      Navigator.pushReplacementNamed(context, '/login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFAF8F5),
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () => Navigator.pushReplacementNamed(context, '/login'),
                child: const Text('Skip', style: TextStyle(color: Color(0xFF5B8DB8), fontSize: 15)),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (i) => setState(() => _currentPage = i),
                itemCount: _slides.length,
                itemBuilder: (context, i) {
                  final slide = _slides[i];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            slide.image,
                            width: double.infinity,
                            height: 260,
                            fit: BoxFit.cover,
                            errorBuilder: (ctx, e, st) => Container(
                              height: 260,
                              color: const Color(0xFFE8F0FE),
                              child: const Icon(Icons.image_not_supported, size: 60, color: Color(0xFF5B8DB8)),
                            ),
                          ),
                        ),
                        const SizedBox(height: 40),
                        Text(slide.title, textAlign: TextAlign.center, style: const TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Color(0xFF2D3436), height: 1.3)),
                        const SizedBox(height: 16),
                        Text(slide.subtitle, textAlign: TextAlign.center, style: const TextStyle(fontSize: 15, color: Color(0xFF636E72), height: 1.6)),
                      ],
                    ),
                  );
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(3, (i) => AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 5),
                width: _currentPage == i ? 24 : 8,
                height: 8,
                decoration: BoxDecoration(
                  color: _currentPage == i ? const Color(0xFF5B8DB8) : const Color(0xFFE8E4DE),
                  borderRadius: BorderRadius.circular(4),
                ),
              )),
            ),
            const SizedBox(height: 32),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 36),
              child: SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  onPressed: _nextPage,
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF5B8DB8), foregroundColor: Colors.white, elevation: 0, shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16))),
                  child: Text(_currentPage == 2 ? 'Get Started' : 'Next', style: const TextStyle(fontSize: 17, fontWeight: FontWeight.bold)),
                ),
              ),
            ),
            const SizedBox(height: 36),
          ],
        ),
      ),
    );
  }
}

class _Slide {
  final String image;
  final String title;
  final String subtitle;
  const _Slide({required this.image, required this.title, required this.subtitle});
}
