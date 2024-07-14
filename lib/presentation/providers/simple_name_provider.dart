import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_app/config/helpers/random_generator.dart';

//Sólo lectura
final simpleNameProvider = Provider.autoDispose<String>((ref) {
  return RandomGenerator.getRandomName();
});

final ageProvider = Provider.autoDispose<int>((ref) {
  final random = Random();
  return random.nextInt(80);
});
