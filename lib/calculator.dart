// calculator.dart
import 'package:bmr/constants.dart';

class Calculator {
  Calculator({
    required this.height,
    required this.weight,
    required this.age,
    required this.gender,
  });

  final int height; // tinggi badan dalam cm
  final int weight; // berat badan dalam kg
  final int age; // usia dalam tahun
  final Gender gender; // jenis kelamin

  double _bmr = 0.0;

  // Fungsi utama untuk menghitung BMR
  String calculateBMR() {
    if (gender == Gender.male) {
      _bmr = 88.362 + (13.397 * weight) + (4.799 * height) - (5.677 * age);
    } else {
      _bmr = 447.593 + (9.247 * weight) + (3.098 * height) - (4.330 * age);
    }
    return _bmr.toStringAsFixed(1); // hasil 1 angka desimal
  }

  // Keterangan umum berdasarkan nilai BMR
  String getInterpretation() {
    if (_bmr < 1400) {
      return 'Your metabolism is quite low. You may need more nutrition or physical activity.';
    } else if (_bmr <= 2000) {
      return 'Your BMR is within the normal range.';
    } else {
      return 'You have a high BMR, indicating a more active metabolism.';
    }
  }
}
