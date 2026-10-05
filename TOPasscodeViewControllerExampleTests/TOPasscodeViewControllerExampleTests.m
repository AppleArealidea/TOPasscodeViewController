//
//  TOPINViewControllerExampleTests.m
//  TOPINViewControllerExampleTests
//
//  Created by Tim Oliver on 5/15/17.
//  Copyright © 2017 Timothy Oliver. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "TOPasscodeViewController.h"
#import "TOPasscodeViewControllerAnimatedTransitioning.h"

/// Records how the animator completed the transition.
@interface TOTestTransitionContext : NSObject <UIViewControllerContextTransitioning>

@property (nonatomic, strong) UIView *containerView;
@property (nonatomic, strong, nullable) NSNumber *didComplete;

@end

@implementation TOTestTransitionContext

- (BOOL)isAnimated { return YES; }
- (BOOL)isInteractive { return NO; }
- (BOOL)transitionWasCancelled { return NO; }
- (UIModalPresentationStyle)presentationStyle { return UIModalPresentationFullScreen; }
- (void)updateInteractiveTransition:(CGFloat)percentComplete {}
- (void)finishInteractiveTransition {}
- (void)cancelInteractiveTransition {}
- (void)pauseInteractiveTransition {}
- (void)completeTransition:(BOOL)didComplete { self.didComplete = @(didComplete); }
- (UIViewController *)viewControllerForKey:(UITransitionContextViewControllerKey)key { return nil; }
- (UIView *)viewForKey:(UITransitionContextViewKey)key { return nil; }
- (CGAffineTransform)targetTransform { return CGAffineTransformIdentity; }
- (CGRect)initialFrameForViewController:(UIViewController *)vc { return self.containerView.bounds; }
- (CGRect)finalFrameForViewController:(UIViewController *)vc { return self.containerView.bounds; }

@end

@interface TOPasscodeViewControllerExampleTests : XCTestCase

@end

@implementation TOPasscodeViewControllerExampleTests

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testPresentingViewController
{
    UIViewController *parentViewController = [[UIViewController alloc] init];
    TOPasscodeViewController *controller = [[TOPasscodeViewController alloc] initWithStyle:TOPasscodeViewStyleTranslucentDark passcodeType:TOPasscodeTypeFourDigits];
    [parentViewController presentViewController:controller animated:NO completion:nil];
    XCTAssertNotNil(controller);
}

/// A scene moving to the background ends the transition's animations early. UIKit rolls a transition back
/// when it is completed with NO, which left the passcode controller presented after a dismissal, or
/// removed it again right after a presentation.
- (void)testInterruptedAnimationStillCompletesTheTransition
{
    UIWindow *window = [[UIWindow alloc] initWithFrame:CGRectMake(0.0, 0.0, 390.0, 844.0)];
    window.rootViewController = [[UIViewController alloc] init];
    [window makeKeyAndVisible];

    TOPasscodeViewController *controller = [[TOPasscodeViewController alloc] initWithStyle:TOPasscodeViewStyleOpaqueLight
                                                                              passcodeType:TOPasscodeTypeFourDigits];
    [controller loadViewIfNeeded];
    TOTestTransitionContext *context = [[TOTestTransitionContext alloc] init];
    context.containerView = window.rootViewController.view;
    TOPasscodeViewControllerAnimatedTransitioning *animator =
        [[TOPasscodeViewControllerAnimatedTransitioning alloc] initWithPasscodeViewController:controller dismissing:NO success:NO];

    [animator animateTransition:context];
    [self removeAllAnimationsInLayer:window.layer];

    XCTestExpectation *completed = [self expectationForPredicate:[NSPredicate predicateWithFormat:@"didComplete != nil"]
                                             evaluatedWithObject:context
                                                         handler:nil];
    [self waitForExpectations:@[completed] timeout:2.0];
    XCTAssertEqualObjects(context.didComplete, @YES);

    window.hidden = YES;
}

- (void)removeAllAnimationsInLayer:(CALayer *)layer
{
    [layer removeAllAnimations];
    for (CALayer *sublayer in layer.sublayers) {
        [self removeAllAnimationsInLayer:sublayer];
    }
}

@end
