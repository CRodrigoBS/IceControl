import 'package:flutter/material.dart';
import 'package:ice_control/models/models_info_cards.dart';
import '../../../constants.dart';
import 'dart:async'; // Importa la librería de Timer
import 'chart.dart';
class FileInfoCard extends StatefulWidget {
  const FileInfoCard({
    Key? key,
    required this.info,
    
    
  }) : super(key: key);

  final CloudStorageInfo info;

  @override
  _FileInfoCardState createState() => _FileInfoCardState();
}

class _FileInfoCardState extends State<FileInfoCard> {
  int entrada = 0;
  int salida = 0;
  int total = 0; // Inicializa total con 0

  @override
  void initState() {
    super.initState();
    startSimulation();
  }

  void startSimulation() {
    Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() {
        entrada++;
        updateTotal();
      });
    });

    Timer.periodic(Duration(seconds: 15), (timer) {
      setState(() {
        salida=salida+2;
        updateTotal();
      });
    });
  }

  void updateTotal() {
    total = entrada - salida;
    DataHandler.updateData(total, entrada, salida);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            widget.info.title!,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),

          Text(
            "$total",
            textAlign: TextAlign.center, // Centra el texto
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 30, // Tamaño de la fuente
              fontWeight: FontWeight.bold, // Texto en negrita
            ),
          )
        ],
      ),
    );
  }
}

class ProgressLine extends StatelessWidget {
  const ProgressLine({
    Key? key,
    this.color = primaryColor,
    required this.percentage,
  }) : super(key: key);

  final Color? color;
  final int? percentage;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 5,
          decoration: BoxDecoration(
            color: color!.withOpacity(0.1),
            borderRadius: const BorderRadius.all(Radius.circular(10)),
          ),
        ),
        LayoutBuilder(
          builder: (context, constraints) => Container(
            width: constraints.maxWidth * (percentage! / 100),
            height: 5,
            decoration: BoxDecoration(
              color: color,
              borderRadius: const BorderRadius.all(Radius.circular(10)),
            ),
          ),
        ),
      ],
    );
  }
}
