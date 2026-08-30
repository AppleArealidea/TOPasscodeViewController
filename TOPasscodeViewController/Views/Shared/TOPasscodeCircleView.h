//
//  TOPasscodeCircleView.h
//
//  Copyright 2017 Timothy Oliver. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to
//  deal in the Software without restriction, including without limitation the
//  rights to use, copy, modify, merge, publish, distribute, sublicense, and/or
//  sell copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//  OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR
//  IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

/**
 A view containing two circle image views that can animate
 between filled and hollow, whilst maintaining compatibility
 with translucency views.
 */
@interface TOPasscodeCircleView : UIView

/* The circle patterns used for neutral and highlighted states. */
@property (nonatomic, strong) UIImage *circleImage;
@property (nonatomic, strong) UIImage *highlightedCircleImage;

/* Whether the highlighted view is visible. */
@property (nonatomic, assign) BOOL isHighlighted;

/* Draw the highlight by swapping the image of the circle itself instead of revealing a
 second view on top of it.

 Revealing or fading a subview inside a `UIVisualEffectView` content view makes the effect
 view stop applying its effect for good, so a circle that lives inside a vibrancy content
 view must opt into this. Swapping the image of an already visible view is safe. The
 trade-off is that the highlight no longer cross-fades. */
@property (nonatomic, assign) BOOL swapsImageForHighlight;

/* Animate the circle to be highlighted */
- (void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated;

@end

NS_ASSUME_NONNULL_END
