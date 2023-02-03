import 'package:dw9_delivery_app/app/core/ui/helpers/size_extensions.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/app_styles.dart';
import 'package:dw9_delivery_app/app/core/ui/styles/colors_app.dart';
import 'package:dw9_delivery_app/app/core/ui/widgets/delivery_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../../core/config/env/env.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Splash'),
      ),
      body: Column(
        children: [
          Container(),
          DeliveryButton(
            width: 200,
            height: 200,
            label: Env.instance['backend_base_url'] ?? '',
            onPressed: () {},
          ),
          Text(MediaQuery.of(context).size.width.toString()),
          Text(context.screenWidth.toString()),
          Row(
            children: [
              Container(
                color: Colors.red,
                width: context.percentWidth(.6),
                height: 200,
              ),
              Container(
                color: Colors.blue,
                width: MediaQuery.of(context).size.width * .4,
                height: 200,
              ),
            ],
          ),
          TextFormField(
            decoration: InputDecoration(labelText: 'texto'),
          )
        ],
      ),
    );
  }
}
