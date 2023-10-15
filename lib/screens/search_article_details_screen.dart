import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../models/search_news_response.dart';

class SearchArticlesScreen extends StatelessWidget {
  static const String routeName = "search articles screen";
  const SearchArticlesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Articles;
    return Scaffold(
      backgroundColor: Theme.of(context).brightness == Brightness.light
          ? Theme.of(context).scaffoldBackgroundColor
          : Theme.of(context).cardColor,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            toolbarHeight: 80,
            bottom: PreferredSize(
                preferredSize: const Size.fromHeight(0),
                child: Container(
                  width: double.maxFinite,
                  decoration: BoxDecoration(
                      color: Theme.of(context).cardColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20),
                      )),
                  padding: const EdgeInsets.only(top: 5, bottom: 10),
                  child: const Center(
                    child: Divider(
                      thickness: 3,
                      color: Colors.grey,
                      indent: 140,
                      endIndent: 140,
                    ),
                  ),
                )),
            expandedHeight: 350,
            elevation: 0,
            pinned: true,
            //backgroundColor: const Color(0xFF39A552),
            flexibleSpace: FlexibleSpaceBar(
              background: CachedNetworkImage(
                imageUrl: args.urlToImage ?? "",
                fit: BoxFit.fill,
                placeholder: (context, url) => Shimmer.fromColors(
                  baseColor: Theme.of(context).brightness == Brightness.light
                      ? Colors.grey.shade300
                      : Colors.grey.shade900,
                  highlightColor:
                      Theme.of(context).brightness == Brightness.light
                          ? Colors.grey.shade100
                          : Colors.grey.shade800,
                  enabled: true,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Container(
                        height: 500,
                        color: Theme.of(context).brightness == Brightness.dark
                            ? Colors.grey.shade900
                            : Colors.grey.shade50,
                      ),
                      const SizedBox(height: 10.0),
                    ],
                  ),
                ),
                errorWidget: (context, url, error) => const Icon(Icons.error),
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 800,
              color: Theme.of(context).cardColor,
              padding: const EdgeInsets.only(
                right: 20,
                left: 20,
                bottom: 20,
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    Text(
                      args.author ?? "",
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.access_alarm,
                          color: Color(0xFF919090),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          args.publishedAt?.substring(0, 10) ?? "",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      args.description ?? "",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    Text(
                      "${args.content}.${args.content}.${args.content}.${args.content}.${args.content}.${args.content}",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
