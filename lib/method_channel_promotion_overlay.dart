import 'package:flutter/services.dart';
import 'promotion_overlay_platform_interface.dart';

const MethodChannel _kChannel =
    MethodChannel('psycatgames.com/promotion_overlay');

/// Wraps
///
///
///
class MethodChannelPromotionOverlayPlatform extends PromotionOverlayPlatform {
  @override
  Future<bool> show(
    String appIdentifier,
    String? campaignToken,
    String? providerToken,
    bool dismissOnBackground,
    int promotionOverlayPosition,
  ) async {
    return (await _kChannel.invokeMethod<bool>(
      'show',
      <String, dynamic>{
        'appIdentifier': appIdentifier,
        'campaignToken': campaignToken,
        'providerToken': providerToken,
        'dismissOnBackground': dismissOnBackground,
        'promotionOverlayPosition': promotionOverlayPosition,
      },
    ))!;
  }

  @override
  Future<bool> dismiss() async {
    return (await _kChannel.invokeMethod<bool>('dismiss'))!;
  }
}
