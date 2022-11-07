import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:universities/core/widgets/loading.dart';
import 'package:universities/src/splash/viewmodel/splash_viewmodel.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<SplashViewModel>.reactive(
      viewModelBuilder: () => SplashViewModel(),
      builder: (context, viewModel, child) => const Loading(),
    );
  }
}
