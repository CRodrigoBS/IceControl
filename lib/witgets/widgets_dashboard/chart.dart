import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class DataHandler {
  static int total = 0;
  static int entrada = 0;
  static int salida = 0;

  static void updateData(int newTotal, int newEntrada, int newSalida) {
    total = newTotal;
    entrada = newEntrada;
    salida = newSalida;
  }
}

List<PieChartSectionData> paiChartSelectionData = [
  PieChartSectionData(
    color: Color.fromARGB(255, 78, 77, 75),
    value: 1,
    showTitle: false,
    radius: 13,
  ),
  PieChartSectionData(
    color: Color.fromARGB(255, 206, 217, 56),
    value: 99,
    showTitle: false,
    radius: 15,
  ),
];

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  _ChartState createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  late List<PieChartSectionData> pieChartSelectionData;
  late Timer timer;

  @override
  void initState() {
    super.initState();
    // Inicializa los datos del gráfico
    pieChartSelectionData = paiChartSelectionData;
    // Inicia el temporizador para actualizar los datos cada segundo
    timer = Timer.periodic(const Duration(seconds: 1), (Timer t) {
      setState(() {
        // Actualiza los datos del gráfico
        pieChartSelectionData = generateChartData();
      });
    });
  }

  @override
  void dispose() {
    // Detiene el temporizador cuando el widget se elimina
    timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Stack(
        children: [
          PieChart(
            PieChartData(
              sectionsSpace: 0,
              centerSpaceRadius: 70,
              startDegreeOffset: -90,
              sections: pieChartSelectionData,
            ),
          ),
          Positioned.fill(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(height: 8),
                Text(
                  "${DataHandler.total}",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void updateChartData() {
    setState(() {
      // Actualiza los datos del gráfico al recibir la notificación
      pieChartSelectionData = generateChartData();
    });
  }

  List<PieChartSectionData> generateChartData() {
    final List<PieChartSectionData> newData = [];
    
    double yellowSize = DataHandler.total > 0 ? 100 : 0;
    // Calcula el tamaño del color amarillo basado en DataHandler.total y DataHandler.salida
    if (DataHandler.total > 0) {
      yellowSize = 100;
    }
    if (DataHandler.salida > 0) {
      final random = Random();
  final randomReduction = random.nextInt(10) + 1; // Genera un número entre 1 y 10
  yellowSize -= randomReduction.toDouble();
    }

    // Añade los datos al gráfico
    newData.add(
      PieChartSectionData(
        color: Color.fromARGB(255, 78, 77, 75), // Color gris
        value: 100 - yellowSize, // Tamaño del color gris
        showTitle: false,
        radius: 13,
      ),
    );
    newData.add(
      PieChartSectionData(
        color: yellowSize > 0 ? Color.fromARGB(255, 206, 217, 56) : Colors.transparent, // Color amarillo si tiene tamaño mayor a 0
        value: yellowSize, // Tamaño del color amarillo
        showTitle: false,
        radius: 15,
      ),
    );

    return newData;
  }
}
