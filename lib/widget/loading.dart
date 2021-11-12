import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class LoadingContainer extends StatelessWidget {
  const LoadingContainer(
      {Key? key, required this.child, this.isLoading = false})
      : super(key: key);

  final Widget child;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [isLoading ? _loadingView() : child],
    );
  }

  Widget _loadingView() {
    return Center(
      child: Lottie.network(
          'https://assets8.lottiefiles.com/packages/lf20_kzfpndct.json'),
    );
  }
}
