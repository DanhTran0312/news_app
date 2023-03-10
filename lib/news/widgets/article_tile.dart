import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app_test/news/cubit/web_view_cubit.dart';
import 'package:news_app_test/news/data/models/models.dart';
import 'package:news_app_test/news/view/web_view_page.dart';

class ArticleTile extends StatelessWidget {
  const ArticleTile({
    super.key,
    required this.article,
  });

  final Article article;

  @override
  Widget build(BuildContext context) {
    final urlToImage = article.urlToImage ?? '';
    final title = article.title ?? '';
    final sourceName = article.source.name ?? '';
    final publishedAt = DateTime.parse(article.publishedAt!)
        .toLocal()
        .difference(
          DateTime.now().toLocal(),
        )
        .abs();
    final publishedAtString = _getPublishedAtString(publishedAt);
    final webViewCubit = context.read<WebViewCubit>();
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        vertical: 15,
        horizontal: 20,
      ),
      onTap: () {
        webViewCubit.openUrl(article.url!);
        Navigator.push(
          context,
          MaterialPageRoute<WebViewPage>(
            builder: (context) => WebViewPage(
              webViewCubit: webViewCubit,
            ),
          ),
        );
      },
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '$sourceName•$publishedAtString',
            style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color:
                      Theme.of(context).colorScheme.onSurface.withOpacity(0.65),
                ),
          ),
          const SizedBox(height: 5),
          if (urlToImage.isNotEmpty)
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                urlToImage,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(),
              ),
            )
          else
            Container(),
          const SizedBox(height: 5),
          Text(
            title,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ],
      ),
    );
  }
}

String _getPublishedAtString(Duration publishedAt) {
  var publishedAtString = '';
  if (publishedAt.inSeconds < 60) {
    publishedAtString = '${publishedAt.inSeconds}s';
  } else if (publishedAt.inMinutes < 60) {
    publishedAtString = '${publishedAt.inMinutes}m';
  } else if (publishedAt.inHours < 24) {
    publishedAtString = '${publishedAt.inHours}h';
  } else if (publishedAt.inDays < 7) {
    publishedAtString = '${publishedAt.inDays}d';
  } else if (publishedAt.inDays < 30) {
    publishedAtString = '${publishedAt.inDays ~/ 7}w';
  } else if (publishedAt.inDays < 365) {
    publishedAtString = '${publishedAt.inDays ~/ 30}mth';
  } else {
    publishedAtString = '${publishedAt.inDays ~/ 365}y';
  }
  return publishedAtString;
}
