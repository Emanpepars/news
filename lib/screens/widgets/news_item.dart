import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:news/models/news_response.dart';
import 'package:shimmer/shimmer.dart';
import '../article_details_screen.dart';

class NewsItem extends StatelessWidget {
  final Articles article;
  const NewsItem(this.article, {super.key});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, ArticlesScreen.routeName,
            arguments: article);
      },
      child: Card(
        elevation: 16,
        margin: const EdgeInsets.all(8),
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(16),
            borderSide: const BorderSide(color: Colors.transparent)),
        child: Container(
          padding: const EdgeInsets.all(18),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12)),
                child: CachedNetworkImage(
                  imageUrl: article.urlToImage ?? "",
                  fit: BoxFit.fill,
                  height: 200,
                  placeholder: (context, url) => Shimmer.fromColors(
                    baseColor: Theme.of(context).brightness == Brightness.light
                        ? Colors.grey.shade300
                        : Colors.grey.shade900,
                    highlightColor:
                        Theme.of(context).brightness == Brightness.light
                            ? Colors.grey.shade100
                            : Colors.grey.shade800,
                    enabled: true,
                    child: Container(
                      height: 200,
                      color: Theme.of(context).brightness == Brightness.dark
                          ? Colors.grey.shade900
                          : Colors.grey.shade50,
                    ),
                  ),
                  errorWidget: (context, url, error) => const Icon(Icons.error),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                article.title ?? "",
                style: Theme.of(context).textTheme.titleLarge,
                maxLines: 2,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                article.description ?? "",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              const SizedBox(
                height: 3,
              ),
              Text(
                article.author ?? "",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              Text(
                article.publishedAt?.substring(0, 10) ?? "",
                style: Theme.of(context).textTheme.bodySmall,
                textAlign: TextAlign.end,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
