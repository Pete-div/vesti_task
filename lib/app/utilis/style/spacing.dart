import 'package:flutter/material.dart';
import 'package:vesti_task/app/utilis/style/dimension.dart';

/// This widget provides a vertical and horizontal spacing between widgets.

/// These widgets can be used in place of using hardcoded heights or widths for sized boxes.
/// For example, rather than declaring SizedBox(height: 20), we can declare VestiSpacing.height(20).
/// Or rather than declaring SizedBox(width: 8), we will declare VestiSpacing.smallWidth().

class VestiSpacing extends StatelessWidget {
  const VestiSpacing.empty({super.key})
      : width = TheDimensions.zero,
        height = TheDimensions.zero;
  const VestiSpacing.largeWidth({Key? key})
      : this.width(TheDimensions.large, key: key);
  const VestiSpacing.bigWidth({Key? key})
      : this.width(TheDimensions.big, key: key);
  const VestiSpacing.mediumWidth({Key? key})
      : this.width(TheDimensions.medium, key: key);
  const VestiSpacing.smallWidth({Key? key})
      : this.width(TheDimensions.small, key: key);
  const VestiSpacing.tinyWidth({Key? key})
      : this.width(TheDimensions.tiny, key: key);
  const VestiSpacing.largeHeight({Key? key})
      : this.height(TheDimensions.large, key: key);
  const VestiSpacing.bigHeight({Key? key})
      : this.height(TheDimensions.big, key: key);
  const VestiSpacing.mediumHeight({Key? key})
      : this.height(TheDimensions.medium, key: key);
  const VestiSpacing.smallHeight({Key? key})
      : this.height(TheDimensions.small, key: key);
  const VestiSpacing.veryLargeHeight({Key? key})
      : this.height(TheDimensions.veryLarge, key: key);

  const VestiSpacing.tinyHeight({Key? key})
      : this.height(TheDimensions.tiny, key: key);

  const VestiSpacing.width(this.width, {super.key})
      : height = TheDimensions.zero;

  const VestiSpacing.height(this.height, {super.key})
      : width = TheDimensions.zero;

  /// The width of the spacing.
  final double height;

  /// The height of the spacing.
  final double width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(key: super.key, height: height, width: width);
  }
}
