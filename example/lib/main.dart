import 'dart:async';

import 'package:basic_feed_fetcher/basic_feed_fetcher.dart';
import 'package:basic_feed_fetcher/data/models/social_media_post_models.dart';
import 'package:flutter/material.dart';

import 'env/env.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({super.key});

  late final InstagramBasicDisplay _instagramBasicDisplay;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    initPluginState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPluginState() async {
    if (!mounted) return;

    widget._instagramBasicDisplay = InstagramBasicDisplay(key: Env.instagramApiKey);
    // await for initialization here, or use a more elegant FutureBuilder in the build() directly
    //await widget._instagramBasicDisplay.isReady.future;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: FutureBuilder(
            future: widget._instagramBasicDisplay.isReady.future,
            builder: (context, snapshot) {
              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return const CircularProgressIndicator();
                case ConnectionState.done:
                  return ValueListenableBuilder<List<InstagramPostModel>>(
                      valueListenable: widget._instagramBasicDisplay.instagramPosts,
                      builder: (context, final instagramPosts, _) => GridView.count(
                            crossAxisCount: 7,
                            shrinkWrap: true,
                            children: [
                              for (final instaPost in instagramPosts)
                                Image.network(
                                  instaPost.thumbnailUrl.toString(),
                                  loadingBuilder: (context, child, loadingProgress) =>
                                      (loadingProgress == null)
                                          ? child
                                          : Center(
                                              child: CircularProgressIndicator(
                                                value: loadingProgress.expectedTotalBytes != null
                                                    ? loadingProgress.cumulativeBytesLoaded /
                                                        loadingProgress.expectedTotalBytes!
                                                    : null,
                                              ),
                                            ),
                                ),
                            ],
                          ));
              }
            },
          ),
        ),
      ),
    );
  }
}
