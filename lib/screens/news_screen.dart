import 'package:flutter/material.dart';
import 'package:news/models/categories_model.dart';
import 'package:news/screens/tabs_screen.dart';
import 'package:news/screens/widgets/cu_shimmer.dart';
import 'package:shimmer/shimmer.dart';
import '../models/sources_response.dart';
import '../shared/network/remote/api_manager.dart';

class NewsScreen extends StatelessWidget {
  final CategoryModel categoryModel;
  const NewsScreen(this.categoryModel, {super.key});
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<SourcesResponse>(
      future: ApiManager.getSources(categoryModel.id),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Shimmer.fromColors(
            baseColor: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade300
                : Colors.grey.shade900,
            highlightColor: Theme.of(context).brightness == Brightness.light
                ? Colors.grey.shade100
                : Colors.grey.shade800,
            enabled: true,
            child: const CuShimmer(),
          );
        }
        if (snapshot.hasError) {
          return Container(
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Colors.black,
              backgroundBlendMode: BlendMode.lighten,
            ),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Error",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 30,
                      ),
                  maxLines: 2,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Some thing went wrong ",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 25,
                ),
                Image.asset(Theme.of(context).brightness == Brightness.light
                    ? "assets/images/error_d.png"
                    : "assets/images/error.png"),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              categoryModel.color),
                        ),
                        onPressed: () {},
                        child: Text(
                          "try again",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        )),
                  ],
                )
              ],
            ),
          );
        }
        if (snapshot.data?.status != "ok") {
          return Container(
            padding: const EdgeInsets.all(30),
            decoration: const BoxDecoration(
              color: Colors.black,
              backgroundBlendMode: BlendMode.lighten,
            ),
            width: double.infinity,
            height: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Error",
                  style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                        fontSize: 30,
                      ),
                  maxLines: 2,
                ),
                const Divider(
                  thickness: 2,
                ),
                const SizedBox(
                  height: 25,
                ),
                Text(
                  "Some thing went wrong ",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(
                  height: 25,
                ),
                Image.asset(Theme.of(context).brightness == Brightness.light
                    ? "assets/images/error_d.png"
                    : "assets/images/error.png"),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll<Color>(
                              categoryModel.color),
                        ),
                        onPressed: () {},
                        child: Text(
                          "try again",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge
                              ?.copyWith(color: Colors.white),
                        )),
                  ],
                )
              ],
            ),
          );
        }
        var sources = snapshot.data?.sources ?? [];
        return TabsScreen(sources);
      },
    );
  }
}
