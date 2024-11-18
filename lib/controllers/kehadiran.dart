import 'package:flutter/material.dart';
import 'package:monitoring_kehadiran/models/mahasiswa.dart';

class Kehadiran extends ChangeNotifier {
  List<Mahasiswa> mahasiswa = [
    Mahasiswa(name: 'Ali'),
    Mahasiswa(name: 'Budi'),
    Mahasiswa(name: 'Joko'),
    Mahasiswa(name: 'Evika'),
    Mahasiswa(name: 'Tri'),
    Mahasiswa(name: 'Wulandari'),

  ];

  List<Map<String, dynamic>> history = [];

  void updateKehadiran(int index, bool value) {
    mahasiswa[index].isPresent = value;
    notifyListeners();
  }

  void saveKehadiran() {
    final attended = mahasiswa.where((s) => s.isPresent).length;
    final notAttended = mahasiswa.length - attended;

    history.insert(0, {
      'date': DateTime.now(),
      'attended': attended,
      'notAttended': notAttended,
    });

    // Reset presence status
    for (var student in mahasiswa) {
      student.isPresent = false;
    }

    notifyListeners();
  }
}
