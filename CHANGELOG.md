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
