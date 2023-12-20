# promotion_overlay_platform_interface

A common platform interface for the [`promotion_overlay`][1] plugin.

This interface allows platform-specific implementations of the `promotion_overlay`
plugin, as well as the plugin itself, to ensure they are supporting the
same interface.

# Usage

To implement a new platform-specific implementation of `promotion_overlay`, extend
[`PromotionOverlayPlatform`][2] with an implementation that performs the
platform-specific behavior, and when you register your plugin, set the default
`PromotionOverlayLoader` by calling the `PromotionOverlayPlatform.loader` setter.

[1]: ../promotion_overlay
[2]: lib/promotion_overlay_platform_interface.dart