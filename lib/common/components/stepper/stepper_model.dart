import 'dart:ui';

class StepperModel{
  final String activeImage;
  final String inActiveImage;
  final String title;
  final String subTitle;
  final bool isActive;
  final bool isCompleted;
  final bool isWaiting;
  final Color? color;

  StepperModel({
    required this.activeImage,
    required this.inActiveImage,
    required this.title,
    required this.subTitle,
    required this.isActive,
    required this.isCompleted,
    required this.isWaiting,
    this.color,
  });
}