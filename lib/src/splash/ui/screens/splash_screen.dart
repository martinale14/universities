import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:universities/src/splash/ui/viewmodel/splash_viewmodel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      builder: (context, viewModel, child) => Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        child: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}
