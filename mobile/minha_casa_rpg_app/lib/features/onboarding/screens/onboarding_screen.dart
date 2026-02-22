import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:minha_casa_rpg_app/features/onboarding/steps/avatar_step.dart';
import 'package:minha_casa_rpg_app/features/onboarding/steps/color_step.dart';
import 'package:minha_casa_rpg_app/features/onboarding/steps/confirm_step.dart';
import 'package:minha_casa_rpg_app/features/onboarding/steps/name_step.dart';

class OnboardingScreen extends ConsumerStatefulWidget {
  const OnboardingScreen({super.key});

  @override
  ConsumerState<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends ConsumerState<OnboardingScreen> {
  final PageController _pagecontroller = PageController();
  int currentPage = 0;

  void nextPage() {
    _pagecontroller.nextPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut
    );
  }

  void previousPage() {
    _pagecontroller.previousPage(
      duration: Duration(milliseconds: 300),
      curve: Curves.easeInOut
    );
  }

  final _namecontroller = TextEditingController();
  @override
  void dispose() {
    _pagecontroller.dispose();
    _namecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pagecontroller,
        physics: const NeverScrollableScrollPhysics(),
        onPageChanged: (index) {
          setState(() {
            currentPage = index;
          });
        },
        children: [
          NameStep(onNext: nextPage, namecontroller: _namecontroller),
          AvatarStep(onNext: nextPage, onPrevious: previousPage),
          ColorStep(onNext: nextPage, onPrevious: previousPage),
          ConfirmStep(onNext: nextPage, onPrevious: previousPage)
        ],
      ),
    );
  }
}