import 'package:flutter/material.dart';
import 'package:news/models/search_news_response.dart';
import 'package:news/screens/widgets/cu_shimmer.dart';
import 'package:news/screens/widgets/search_news_item.dart';
import 'package:news/screens/widgets/source_item.dart';

import '../models/sources_response.dart';
import '../shared/network/remote/api_manager.dart';

class TabsSearchScreen extends StatefulWidget {
  final List<Sources> sources;
  final String value;
  const TabsSearchScreen(this.sources, this.value, {super.key});

  @override
  State<TabsSearchScreen> createState() => _TabsSearchScreenState();
}

class _TabsSearchScreenState extends State<TabsSearchScreen> {
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
          FutureBuilder<SearchNewsResponse>(
            future: ApiManager.getSearchNewsResponse(
                widget.sources[selectedIndex].id ?? "", widget.value),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return const CuShimmerTabs();
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
                    return SearchNewsItem(newsData[index]);
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
