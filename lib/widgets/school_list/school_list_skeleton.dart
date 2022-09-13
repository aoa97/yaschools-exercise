import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SchoolsListSkeleton extends StatelessWidget {
  const SchoolsListSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return GridView.builder(
      padding: const EdgeInsets.all(15),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        childAspectRatio: 3 / 6,
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      itemCount: 10,
      itemBuilder: (_, index) => Container(
        color: Colors.white,
        child: SkeletonItem(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, left: 8, right: 8),
                child: Column(
                  children: [
                    SkeletonParagraph(
                      style: const SkeletonParagraphStyle(lines: 2),
                    ),
                    const SizedBox(height: 5),
                    SkeletonAvatar(
                      style: SkeletonAvatarStyle(
                        height: size.height * .2,
                        width: size.width * .35,
                      ),
                    ),
                    const SizedBox(height: 5),
                    SkeletonParagraph(
                      style: const SkeletonParagraphStyle(lines: 3),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
