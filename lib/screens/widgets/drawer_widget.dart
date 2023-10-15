import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class DrawerWidget extends StatelessWidget {
  final Function onDrawerClick;
  const DrawerWidget(this.onDrawerClick, {super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return SafeArea(
      child: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * .7,
        height: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(
                vertical: 50.0,
              ),
              color: homeProvider.categoryModel == null
                  ? Colors.black
                  : homeProvider.categoryModel?.color,
              child: Center(
                child: Text(
                  "News App!",
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge
                      ?.copyWith(fontSize: 25, color: Colors.white),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            InkWell(
              onTap: () {
                onDrawerClick(1);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.category,
                      size: 22,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Categories",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
              thickness: 1,
              color: Colors.black12,
            ),
            InkWell(
              onTap: () {
                onDrawerClick(2);
                Navigator.pop(
                  context,
                );
              },
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Row(
                  children: [
                    const Icon(
                      Icons.settings_suggest,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      "Settings",
                      style: Theme.of(context)
                          .textTheme
                          .headlineLarge
                          ?.copyWith(fontSize: 20, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ),
            const Divider(
              indent: 10,
              endIndent: 10,
              thickness: 1,
              color: Colors.black12,
            ),
          ],
        ),
      ),
    );
  }
}
