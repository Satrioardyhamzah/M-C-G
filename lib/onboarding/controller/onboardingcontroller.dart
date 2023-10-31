import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';

class OnboardingController extends GetxController{
  final controller = LiquidController();
  RxInt currentPage = 0.obs;
}