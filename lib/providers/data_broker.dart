// mqtt_data.dart
import 'package:flutter/material.dart';

class MQTTData with ChangeNotifier {
  String _id = '';
  String _cmd = '';
  String _contIn = '';
  String _contOut = '';
  String _date = '';

  String get id => _id;
  String get cmd => _cmd;
  String get contIn => _contIn;
  String get contOut => _contOut;
  String get date => _date;

  // Método para actualizar los datos del Provider
  void updateData({
    required String id,
    required String cmd,
    required String contIn,
    required String contOut,
    required String date,
  }) {
    _id = id;
    _cmd = cmd;
    _contIn = contIn;
    _contOut = contOut;
    _date = date;

    // Notificar a los widgets que los datos han sido actualizados
    notifyListeners();
  }
}

