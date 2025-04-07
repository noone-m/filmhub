import 'package:flutter/material.dart';
import 'package:filmhub_app/core/presentation/components/image_with_shimmer.dart';
import 'package:filmhub_app/core/resources/app_colors.dart';

class SliderCardImage extends StatelessWidget {
  const SliderCardImage({
    super.key,
    required this.imageUrl,
    required this.fitType
  });

  final String imageUrl;
  final BoxFit fitType;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return ShaderMask(
      blendMode: BlendMode.dstIn,
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.black,
            AppColors.black,
            AppColors.transparent,
          ],
          stops: [0.1, 0.3, 1],
        ).createShader(
          Rect.fromLTRB(0, 0, rect.width, rect.height),
        );
      },
      child: 
      ImageWithShimmer(
        height: size.height *0.6,
        width: double.infinity,
        imageUrl: imageUrl,
        fitType: fitType,
      ),
    );
  }
}
