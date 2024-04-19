import 'package:flutter/material.dart';
import 'package:ice_control/models/models_info_cards.dart';
import 'package:ice_control/responsive.dart';
import 'package:ice_control/witgets/widgets_dashboard/info_cards.dart';
import '../../../constants.dart';


class SectionInformation extends StatelessWidget {
  const SectionInformation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size newSize = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Funciones",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Ver más"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: newSize.width < 650 ? 2 : 4,
            childAspectRatio: newSize.width < 650 && newSize.width > 350 ? 1.3 : 1,
          ),
          tablet: const FileInfoCardGridView(),
          desktop: FileInfoCardGridView(
            childAspectRatio: newSize.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
  }
}