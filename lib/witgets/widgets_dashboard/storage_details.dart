import 'package:flutter/material.dart';
import 'package:ice_control/witgets/widgets_dashboard/storage_info_card.dart';

import '../../../constants.dart';
import 'chart.dart';

class StorageDetails extends StatelessWidget {
  const StorageDetails({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(defaultPadding),
      decoration: const BoxDecoration(
        color: secondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children:  [
          Text(
            "Detalles del flujo",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w500,
            ),
          ),
          SizedBox(height: defaultPadding),
          Chart(),

          StorageInfoCard(
            svgSrc: "assets/icons/Documents.svg",
            title: "Guardar datos",
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/media.svg",
            title: "Historial",
          ),
          StorageInfoCard(
            svgSrc: "assets/icons/unknown.svg",
            title: "Descargar PDF ",
          ),
        ],
      ),
    );
  }
}

