import 'package:dw9_delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    context.colors.primary;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Container(),
    );
  }
}
