import 'package:flutter/material.dart';
import 'package:news/models/news_response.dart';
import 'package:news/screens/widgets/cu_shimmer.dart';
import 'package:news/screens/widgets/news_item.dart';
import 'package:news/screens/widgets/source_item.dart';
import 'package:shimmer/shimmer.dart';
import '../models/sources_response.dart';
import '../shared/network/remote/api_manager.dart';

class TabsScreen extends StatefulWidget {
  final List<Sources> sources;
  const TabsScreen(this.sources, {super.key});
  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0),
      child: Column(
        children: [
          DefaultTabController(
              length: widget.sources.length,
              child: TabBar(
                onTap: (value) {
                  setState(() {
                    selectedIndex = value;
                  });
                },
                indicatorColor: Colors.transparent,
                isScrollable: true,
                tabs: widget.sources.map((source) {
                  return Tab(
                    child: SourceItem(source,
                        widget.sources.indexOf(source) == selectedIndex),
                  );
                }).toList(),
              )),
          FutureBuilder<NewsResponse>(
            future: ApiManager.getNewsResponse(
                widget.sources[selectedIndex].id ?? ""),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Shimmer.fromColors(
                  baseColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey.shade300
                      : Colors.grey.shade900,
                  highlightColor:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade100
                          : Colors.grey.shade800,
                  enabled: true,
                  child: const CuShimmerTabs(),
                );
              }
              if (snapshot.hasError) {
                return Column(
                  children: [
                    const Text(
                      "something went wrong",
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Try again",
                      ),
                    ),
                  ],
                );
              }
              if (snapshot.data?.status != "ok") {
                return Column(
                  children: [
                    Text(
                      snapshot.data?.message ?? "",
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "Try again",
                      ),
                    ),
                  ],
                );
              }

              var newsData = snapshot.data?.articles ?? [];

              return Expanded(
                child: ListView.builder(
                  itemBuilder: (context, index) {
                    return NewsItem(newsData[index]);
                  },
                  itemCount: newsData.length,
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
