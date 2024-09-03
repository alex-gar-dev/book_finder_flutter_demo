import 'package:book_finder_flutter_demo/ux/index.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(
            right: 40,
            left: 40,
            bottom: 30
          ),
          child: Column(
            children: [
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/onboarding.png'
              ),
              const Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 40
                ),
                child: Text('Start your adventure',
                  textAlign: TextAlign.center,
                  style: UxBfTextStyle.headingH3OpenSans,
                ),
              ),
              const Text(
                "Ready to embark on a quest for inspiration and knowledge? Your adventure begins now. Let's go!",
                textAlign: TextAlign.center,
                style: UxBfTextStyle.body16RegularReboto,
              ),
              const Spacer(),
              SizedBox(
                width: double.infinity,
                child: UxBfButton(
                  label: 'Get Started',
                  onPressed: () async {
                    context.pushReplacement('/home');
                    final SharedPreferences prefs = await SharedPreferences.getInstance();
                    prefs.setBool('showOnboarding', false);
                  }
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}