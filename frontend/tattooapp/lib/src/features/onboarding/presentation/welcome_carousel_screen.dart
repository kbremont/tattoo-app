import 'package:flutter/material.dart';
import 'package:tattooapp/src/features/onboarding/presentation/widgets/welcome_screen_page.dart';
import 'package:tattooapp/src/core/widgets/page_indicator.dart';
import 'package:tattooapp/src/features/session/presentation/widgets/get_started_button.dart';

class WelcomeCarouselScreen extends StatefulWidget {
  const WelcomeCarouselScreen({super.key});

  @override
  State<WelcomeCarouselScreen> createState() => _WelcomeCarouselScreenState();
}

class _WelcomeCarouselScreenState extends State<WelcomeCarouselScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  final List<WelcomeScreenPage> _pages = const [
    WelcomeScreenPage(
      title: 'Discover Tattoo Flash',
      subtitle:
          'Browse classic and custom flash designs from artists around the world.',
    ),
    WelcomeScreenPage(
      title: 'Save Your Favorites',
      subtitle: 'Create your own collection of flash that inspires you.',
    ),
    WelcomeScreenPage(
      title: 'Book with Artists',
      subtitle:
          'Connect directly with artists to bring your next tattoo to life.',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: _pages.length,
                onPageChanged: (index) => setState(() => _currentPage = index),
                itemBuilder: (context, index) => _pages[index],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  PageIndicator(
                    currentPage: _currentPage,
                    pageCount: _pages.length,
                    color: theme.colorScheme.primary,
                  ),
                  const SizedBox(height: 16),
                  GetStartedButton(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
