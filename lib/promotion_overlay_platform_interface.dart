import 'package:flutter/foundation.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'method_channel_promotion_overlay.dart';

/// The interface that implementations of promotion_overlay must implement.
///
/// Platform implementations should extend this class rather than implement it as `promotion_overlay`
/// does not consider newly added methods to be breaking changes. Extending this class
/// (using `extends`) ensures that the subclass will get the default implementation, while
/// platform implementations that `implements` this interface will be broken by newly added
/// [PromotionOverlayPlatform] methods.
abstract class PromotionOverlayPlatform extends PlatformInterface {
  /// Constructs a PromotionOverlayPlatform.
  PromotionOverlayPlatform() : super(token: _token);

  static final Object _token = Object();

  /// The default instance of [PromotionOverlayPlatform] to use.
  ///
  /// Defaults to [MethodChannelPromotionOverlayPlatform].
  static PromotionOverlayPlatform get instance => _instance;

  /// Platform-specific plugins should set this with their own platform-specific
  /// class that extends [PromotionOverlayPlatform] when they register themselves.
  static set instance(PromotionOverlayPlatform instance) {
    if (!instance.isMock) {
      PlatformInterface.verify(instance, _token);
    }
    _instance = instance;
  }

  static PromotionOverlayPlatform _instance =
      MethodChannelPromotionOverlayPlatform();

  /// Only mock implementations should set this to true.
  ///
  /// Mockito mocks are implementing this class with `implements` which is forbidden for anything
  /// other than mocks (see class docs). This property provides a backdoor for mockito mocks to
  /// skip the verification that the class isn't implemented with `implements`
  @visibleForTesting
  @Deprecated('Use MockPlatformInterfaceMixin instead')
  bool get isMock => false;

  /// Shows the promotion overlay with [appIdentifier] using SKOverlay (on iOS)
  /// Returns true if the overlay was shown, false otherwise
  /// optional [campaignToken] and [providerToken] are used for attribution
  Future<bool> show(
    String appIdentifier,
    String? campaignToken,
    String? providerToken,
    bool dismissOnBackground,
    int position,
  );

  /// Dismisses the promotion overlay if it is currently being shown
  Future<bool> dismiss();
}
