import 'dart:async';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

class Chart extends StatefulWidget {
  const Chart({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
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
        pieChartSelectionData = generateRandomChartData();
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
                  // Muestra el valor de la sección actualmente seleccionada
                  pieChartSelectionData.first.value.toStringAsFixed(1),
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                    height: 0.5,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  List<PieChartSectionData> generateRandomChartData() {
    // Genera datos aleatorios para el gráfico
    final List<PieChartSectionData> newData = [];
    for (int i = 0; i < paiChartSelectionData.length; i++) {
      final oldValue = paiChartSelectionData[i].value;
      final newValue = oldValue * (1 + (Random().nextDouble() - 0.5) * 0.2);
      newData.add(
        PieChartSectionData(
          color: paiChartSelectionData[i].color,
          value: newValue,
          showTitle: false,
          radius: paiChartSelectionData[i].radius,
        ),
      );
    }
    return newData;
  }
}

List<PieChartSectionData> paiChartSelectionData = [
  PieChartSectionData(
    color:const Color(0xFFFFCF26),
    value: 30,
    showTitle: false,
    radius: 13,
  ),
  PieChartSectionData(
    color: const Color(0xFF26E5FF),
    value: 20,
    showTitle: false,
    radius: 15,
  ),
  PieChartSectionData(
    color: const Color.fromARGB(255, 118, 38, 255),
    value: 10,
    showTitle: false,
    radius: 16,
  ),
  PieChartSectionData(
    color: const Color(0xFFEE2727),
    value: 15,
    showTitle: false,
    radius: 17,
  ),
  PieChartSectionData(
    color: Colors.grey.withOpacity(0.1),
    value: 25,
    showTitle: false,
    radius: 13,
  ),
];
