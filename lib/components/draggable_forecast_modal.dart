import 'package:flutter/material.dart';
import 'forecast_content.dart';

class DraggableForecastPanel extends StatelessWidget {
  const DraggableForecastPanel({super.key});

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      initialChildSize: 0.435,
      minChildSize: 0.257,
      maxChildSize: 0.435,
      builder: (context, controller) {
        // Adding a listener to detect changes in the sheet's position
        controller.addListener(() {
          // Get current position of the sheet// double currentPosition = controller.offset;// print("Current sheet position: $currentPosition");// You can perform custom actions based on the position
        });
        return ClipRRect(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(44),
            topRight: Radius.circular(44),
          ),
          child: ForecastPanelContent(controller: controller),
        );
      },
    );
  }
}
