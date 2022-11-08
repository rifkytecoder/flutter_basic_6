import 'package:flutter/material.dart';

import 'section_6_package/4_avatar_glow.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AvatarGlowPage(),
    );
  }
}
