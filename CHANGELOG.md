0.0.6 - 2026-08-30
=============================================================

### Fixed

* Tapped keypad buttons permanently lost their vibrancy in the translucent styles and kept
  rendering a bright white ring instead of the tinted one. Showing the tapped circle
  revealed a second view inside a `UIVisualEffectView` content view, which makes the effect
  view stop applying its effect for good — fading it in, or simply unhiding it, both trigger
  this. Keypad circles now draw the tapped state by swapping the image of the circle they
  already show (`TOPasscodeCircleView.swapsImageForHighlight`), which the effect view
  tolerates. The trade-off is that the tapped state no longer cross-fades out.
  `contentAlpha` now fades the effect view rather than the circle inside it, for the same
  reason.
* Keypad buttons no longer stay highlighted when a touch is cancelled by the system or
  released outside the button. The highlight now follows `UIControl.highlighted` instead
  of a hand-picked set of control events, and is applied before the digit handler runs.
* The incorrect-passcode shake was cut short: the last key's highlight reset laid out
  the keypad and wrote `inputField.frame`, which cancelled the spring. The shake now
  uses `transform`, and layout skips that view until the spring finishes.

0.0.5 - 2026-08-29
=============================================================

### Fixed

* Passcode view could be pushed half a screen off the top when a keyboard frame notification
  arrived with a zero or foreign end frame. Keyboard notifications are now validated and
  converted into the view's coordinate space, and the cached height is reset on appearance.

x.y.z Release Notes (yyyy-MM-dd)
=============================================================

0.0.2 - 2017-12-16
=============================================================

### Added

* Full support for iPhone X, including edge layout and Face ID.

### Fixed
* Custom numeric passcode UI broken on iPhone 6 and iPhone X screen size.
* Enabled view controller to work in app extensions.

0.0.1 - 2017-08-12
=============================================================

* Initial release!
