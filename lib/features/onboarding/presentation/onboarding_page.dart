import 'package:flutter/material.dart';
import 'package:hotelino/features/onboarding/presentation/onboarding_provider.dart';
import 'package:hotelino/features/onboarding/presentation/widgets/onboarding_buttom.dart';
import 'package:hotelino/features/onboarding/presentation/widgets/onboarding_item.dart';
import 'package:hotelino/routes/app_route.dart';
import 'package:provider/provider.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});
  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final PageController _pageController = PageController();
  @override
  Widget build(BuildContext context) {
    final onboardingProvider = Provider.of<OnboardingProvider>(context);
    final onboardinData = onboardingProvider.onboardingData;
    final int totalPages = onboardinData.length;
    final theme = Theme.of(context);
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController,
              itemCount: totalPages,
              onPageChanged: onboardingProvider.updateCurrentPage,
              itemBuilder: (context, index) {
                final data = onboardinData[index];
                return OnboardingItem(
                  title: data['title']!,
                  description: data['description']!,
                  image: data['image']!,
                );
              },
            ),
          ),
          SizedBox(height: 20),
          buildPageIdicator(
            onboardingProvider.currentPage,
            totalPages,
            context,
          ),
          SizedBox(height: 20),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                OnboardingButtom(
                  visible: onboardingProvider.currentPage > 0,
                  icon: Icons.arrow_back,
                  onPreesed: () => _previosPage(),
                  backgroundColor: Colors.white70,
                  iconColor: theme.colorScheme.primary,
                ),
                OnboardingButtom(
                  visible: onboardingProvider.currentPage < totalPages - 1,
                  icon: Icons.arrow_forward,
                  onPreesed: () => _nexPage(),
                  backgroundColor: theme.primaryColor,
                  iconColor: Colors.white,
                ),
              ],
            ),
          ),
          SizedBox(height: 30),
          if (totalPages > 1) ...[
            AnimatedSwitcher(
              duration: Duration(milliseconds: 300),
              transitionBuilder: (child, animation) {
                return SizeTransition(
                  sizeFactor: animation,
                  axisAlignment: -1,
                  child: child,
                );
              },
              child: onboardingProvider.currentPage == totalPages - 1
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 20,
                        vertical: 10,
                      ),
                      child: SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              AppRoute.home,
                            );
                          },
                          child: Text('شروع رزرو هتل ها'),
                        ),
                      ),
                    )
                  : null,
            ),
          ],

          SizedBox(height: 30),
        ],
      ),
    );
  }

  void _nexPage() {
    final onboardingProvider = Provider.of<OnboardingProvider>(
      context,
      listen: false,
    );
    if (onboardingProvider.currentPage <
        onboardingProvider.onboardingData.length - 1) {
      _pageController.nextPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.ease,
      );
    }
  }

  void _previosPage() {
    final onboardingProvider = Provider.of<OnboardingProvider>(
      context,
      listen: false,
    );
    if (onboardingProvider.currentPage > 0) {
      _pageController.previousPage(
        duration: Duration(milliseconds: 400),
        curve: Curves.easeInExpo,
      );
    }
  }

  // add indicator
  Widget buildPageIdicator(
    int currentIndex,
    int totalPage,
    BuildContext context,
  ) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        totalPage,
        (index) => AnimatedContainer(
          duration: Duration(milliseconds: 300),
          margin: EdgeInsets.symmetric(horizontal: 5),
          width: currentIndex == index ? 12 : 8,
          height: currentIndex == index ? 12 : 8,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: currentIndex == index
                ? theme.primaryColor
                : theme.primaryColor.withValues(alpha: 0.3),
          ),
        ),
      ),
    );
  }
}
