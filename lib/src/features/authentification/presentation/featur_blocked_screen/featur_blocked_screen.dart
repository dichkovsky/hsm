import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hsm/src/constants/app_sizes.dart';
import 'package:hsm/src/system/localization/app_localizations_context.dart';

class FeatureBlockedScreen extends StatelessWidget {
  const FeatureBlockedScreen(this.customTitle, this.customMsg, {super.key});

  final String? customTitle;
  final String? customMsg;

  @override
  Widget build(BuildContext context) {

    final msg = customMsg ?? context.loc.comingSoonMsg;
    final title = customTitle ?? context.loc.comingSoonTitle;

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(Sizes.p32),
        child: 
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(msg, style: Theme.of(context).textTheme.bodyLarge, textAlign: TextAlign.center,),
              SizedBox.fromSize(size: const Size.fromHeight(Sizes.p20)),
              ElevatedButton.icon(
                onPressed: () => context.pop(), 
                icon: const Icon(Icons.arrow_back), 
                label: Text(context.loc.commonBack)
              )
            ],
          ),
      ),
    );
  }
}