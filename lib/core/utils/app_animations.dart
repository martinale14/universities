import 'package:lottie/lottie.dart';

LottieBuilder getFileAnimation(
  String animationName, {
  double? width,
  double? height,
}) =>
    LottieBuilder.asset(
      'assets/animations/$animationName.json',
      width: width,
      height: height,
    );

class AppAnimations {
  static get loadingMainAnimation => getFileAnimation(
        'loading',
        width: 200,
        height: 200,
      );
  static get loadingSmallAnimation => getFileAnimation(
        'loading',
        width: 75,
        height: 75,
      );
}
