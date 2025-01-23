import 'package:bike_shoping_app/core/constants/colors.dart';
import 'package:bike_shoping_app/core/constants/copies.dart';
import 'package:bike_shoping_app/core/constants/images.dart';
import 'package:flutter/material.dart';

class InitialContainer extends StatefulWidget {
  const InitialContainer({super.key});

  @override
  State<InitialContainer> createState() => _InitialContainerState();
}

class _InitialContainerState extends State<InitialContainer>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _onTap() {
    if (_controller.isAnimating) return;
    _controller.forward(from: 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(15),
      height: 225,
      decoration: BoxDecoration(
        color: AppColors.backgroundBlur.withOpacity(0.1),
        borderRadius: BorderRadius.circular(16),
        border: Border.all(width: 1, color: const Color(0xFF353F54)),
        boxShadow: const <BoxShadow>[],
      ),
      child: Stack(
        children: [
          Positioned(
            top: 20,
            right: 20,
            left: 20,
            child: GestureDetector(
              onTap: _onTap,
              child: AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  return Transform.rotate(
                    angle: _controller.value * 2 * 3.14159265359,
                    child: child,
                  );
                },
                child: Image.asset(
                  AppImages.bikeImage,
                  height: 160,
                  width: 330,
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ),
          const Positioned(bottom: 16, left: 16, child: Copies.offer),
        ],
      ),
    );
  }
}
