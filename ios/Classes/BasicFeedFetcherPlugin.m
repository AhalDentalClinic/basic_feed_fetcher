#import "BasicFeedFetcherPlugin.h"
#if __has_include(<basic_feed_fetcher/basic_feed_fetcher-Swift.h>)
#import <basic_feed_fetcher/basic_feed_fetcher-Swift.h>
#else
// Support project import fallback if the generated compatibility header
// is not copied when this plugin is created as a library.
// https://forums.swift.org/t/swift-static-libraries-dont-copy-generated-objective-c-header/19816
#import "basic_feed_fetcher-Swift.h"
#endif

@implementation BasicFeedFetcherPlugin
+ (void)registerWithRegistrar:(NSObject<FlutterPluginRegistrar>*)registrar {
  [SwiftBasicFeedFetcherPlugin registerWithRegistrar:registrar];
}
@end
