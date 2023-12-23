import 'package:flutter/material.dart';
import 'package:hsm/src/system/localization/string_hardcoded.dart';

class ManifestationsScreen extends StatelessWidget {
  const ManifestationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Manifestations".hardcoded),
        centerTitle: true,
      ),
      body: const Center(
        child: Text("Manifestations should be here!"),
      )
    );
  }
}