import 'package:flutter/material.dart';

class CuShimmer extends StatelessWidget {
  const CuShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0, top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SingleChildScrollView(
              physics: NeverScrollableScrollPhysics(),
              child: Row(
                children: [
                  Chip(
                      label: SizedBox(
                    height: 45,
                    width: 120,
                  )),
                  SizedBox(width: 10.0),
                  Chip(
                      label: SizedBox(
                    height: 45,
                    width: 157,
                  )),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Container(
              height: 200,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.grey.shade50,
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 20,
              width: 300,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.grey.shade50,
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 20,
              width: 250,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.grey.shade50,
            ),
            const SizedBox(height: 10.0),
            const SizedBox(height: 16.0),
            Container(
              height: 200,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.grey.shade50,
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 20,
              width: 300,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.grey.shade50,
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 20,
              width: 250,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.grey.shade50,
            ),
            const SizedBox(height: 10.0),
            const SizedBox(height: 16.0),
            Container(
              height: 120,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.grey.shade50,
            ),
          ],
        ),
      ),
    );
  }
}

class CuShimmerTabs extends StatelessWidget {
  const CuShimmerTabs({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            const SizedBox(height: 16.0),
            Container(
              height: 200,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.grey.shade50,
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 20,
              width: 300,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.grey.shade50,
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 20,
              width: 250,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.grey.shade50,
            ),
            const SizedBox(height: 10.0),
            const SizedBox(height: 16.0),
            Container(
              height: 200,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.grey.shade50,
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 20,
              width: 300,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.grey.shade50,
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 20,
              width: 250,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.grey.shade50,
            ),
            const SizedBox(height: 10.0),
            Container(
              height: 30,
              color: Theme.of(context).brightness == Brightness.dark
                  ? Colors.grey.shade900
                  : Colors.grey.shade50,
            ),
          ],
        ),
      ),
    );
  }
}
