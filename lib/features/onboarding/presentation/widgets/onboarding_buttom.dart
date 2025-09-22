import 'package:flutter/material.dart';

class OnboardingButtom extends StatelessWidget {
  final bool visible;
  final IconData icon;
  final VoidCallback onPreesed;
  final Color backgroundColor;
  final Color iconColor;
  const OnboardingButtom({
    super.key,
    required this.visible,
    required this.icon,
    required this.onPreesed,
    required this.backgroundColor,
    required this.iconColor,
  });

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: Duration(milliseconds: 400),
      transitionBuilder: (child, animation) {
        return FadeTransition(opacity: animation, child: child);
      },
      child: visible
          ? Container(
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Theme.of(context).colorScheme.primary,
                  width: 1,
                ),
              ),
              child: FloatingActionButton(
                elevation: 0,
                onPressed: onPreesed,
                backgroundColor: backgroundColor,
                shape: CircleBorder(),
                child: Icon(icon, color: iconColor),
              ),
            )
          : SizedBox(),
    );
  }
}
