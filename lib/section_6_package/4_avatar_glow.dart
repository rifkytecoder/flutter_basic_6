import 'package:flutter/material.dart';
import 'package:avatar_glow/avatar_glow.dart';

class AvatarGlowPage extends StatelessWidget {
  const AvatarGlowPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Avatar Glow Package"),
        centerTitle: true,
      ),
      body: Center(
        // todo Avatar Glow
        child: AvatarGlow(
          // ket: endRaius: harus lebih besar dari radius: (valuenya)
          endRadius: 60.0, // besar radius glow effectnya
          glowColor: Colors.blue, // warna glownya
          duration: const Duration(seconds: 2), //durasi glow
          child: Material(
            // Replace this child with your own
            elevation: 8.0,
            shape: const CircleBorder(),
            child: CircleAvatar(
              backgroundColor: Colors.grey[100],
              // image full circle
              backgroundImage:
                  const NetworkImage('https://picsum.photos/id/64/200/300'),
              radius: 30.0, // besar lingkaran avatarnya
            ),
          ),
        ),
      ),
    );
  }
}
