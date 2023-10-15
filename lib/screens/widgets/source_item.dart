import 'package:flutter/material.dart';
import 'package:news/models/sources_response.dart';
import 'package:provider/provider.dart';

import '../../provider/home_provider.dart';

class SourceItem extends StatelessWidget {
  final Sources source;
  final bool selected;
  const SourceItem(this.source, this.selected, {super.key});

  @override
  Widget build(BuildContext context) {
    var homeProvider = Provider.of<HomeProvider>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 14),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color:
            selected ? homeProvider.categoryModel!.color : Colors.transparent,
        border: Border.all(
          color: homeProvider.categoryModel!.color,
          width: 2,
        ),
      ),
      child: Text(
        source.name ?? "",
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(
          fontSize: 17,
            color: selected ? Colors.white : homeProvider.categoryModel!.color),
        // style: TextStyle(
        //   color: selected? Colors.white: homeProvider.categoryModel!.color,
        // ),
      ),
    );
  }
}
