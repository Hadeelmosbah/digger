import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class NotificationIcon extends StatelessWidget {
  const NotificationIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {},
      icon: Stack(
        clipBehavior: Clip.none,
        children: [
          const Icon(Iconsax.notification, size: 30, color: Color(0xff303B54)),
          Positioned(
            left: 5.4,
            top: 3.2,
            child: Container(
              width: 7,
              height: 7,
              decoration: const BoxDecoration(
                color: Color(0xffE33629),
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
