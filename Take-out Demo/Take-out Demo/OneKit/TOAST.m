//
//  TOAST.m
//  OneKit
//
//  Created by HeYanTao on 15/9/23.
//  Copyright © 2015年 张瑾. All rights reserved.
//

#import "TOAST.h"
#import <Foundation/Foundation.h>
#import <QuartzCore/QuartzCore.h>
#define DEFAULT_DISPLAY_DURATION 2.0f
@interface TOAST (private)
//- (id)initWithText:(NSString *)text_;
//- (void)setDuration:(CGFloat) duration_;
//- (void)dismisToast;
//- (void)toastTaped:(UIButton *)sender_;
//- (void)showAnimation;
//- (void)hideAnimation;
//- (void)show;
//- (void)showFromTopOffset:(CGFloat) topOffset_;
//- (void)showFromBottomOffset:(CGFloat) bottomOffset_;
@end
@implementation TOAST
- (void)dealloc{
    
    // [contentView release],contentView = nil;
    //[text release],text = nil;
    //[super dealloc];
}


- (id)initWithText:(NSString *)text_{
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIDeviceOrientationDidChangeNotification
                                                  object:[UIDevice currentDevice]];
    if (self = [super init]) {
        
        text = [text_ copy];
        
        UIFont *font = [UIFont boldSystemFontOfSize:14];
        CGSize textSize = [text sizeWithAttributes:[NSDictionary dictionaryWithObjectsAndKeys:font, NSFontAttributeName, nil]];
        //CGSize textSize = [text sizeWithFont:font
        //                           constrainedToSize:CGSizeMake(280, MAXFLOAT)
        //                               lineBreakMode:NSLineBreakByClipping];
        
        UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, textSize.width + 12, textSize.height + 12)];
        textLabel.backgroundColor = [UIColor clearColor];
        textLabel.textColor = [UIColor whiteColor];
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.font = font;
        textLabel.text = text;
        textLabel.numberOfLines = 0;
        
        contentView = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, textLabel.frame.size.width, textLabel.frame.size.height)];
        contentView.layer.cornerRadius = 5.0f;
        contentView.layer.borderWidth = 1.0f;
        contentView.layer.borderColor = [[UIColor grayColor] colorWithAlphaComponent:0.5].CGColor;
        contentView.backgroundColor = [UIColor colorWithRed:0.2f
                                                      green:0.2f
                                                       blue:0.2f
                                                      alpha:0.75f];
        [contentView addSubview:textLabel];
        contentView.autoresizingMask = UIViewAutoresizingFlexibleWidth;
        [contentView addTarget:self
                        action:@selector(toastTaped:)
              forControlEvents:UIControlEventTouchDown];
        contentView.alpha = 0.0f;
        //[textLabel release];
        
        duration = DEFAULT_DISPLAY_DURATION;
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(deviceOrientationDidChanged:)
                                                     name:UIDeviceOrientationDidChangeNotification
                                                   object:[UIDevice currentDevice]];
    }
    return self;
}

- (void)deviceOrientationDidChanged:(NSNotification *)notify_{
    [self hideAnimation];
}

-(void)dismissToast{
    [contentView removeFromSuperview];
}

-(void)toastTaped:(UIButton *)sender_{
    [self hideAnimation];
}

- (void)setDuration:(CGFloat) duration_{
    duration = duration_;
}
//
-(void)showAnimation{
    [UIView beginAnimations:@"show" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseIn];
    [UIView setAnimationDuration:0.3];
    contentView.alpha = 1.0f;
    [UIView commitAnimations];
}
//
-(void)hideAnimation{
    [UIView beginAnimations:@"hide" context:NULL];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
    [UIView setAnimationDelegate:self];
    [UIView setAnimationDidStopSelector:@selector(dismissToast)];
    [UIView setAnimationDuration:0.3];
    contentView.alpha = 0.0f;
    [UIView commitAnimations];
}
//
//- (void)show{
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    contentView.center = window.center;
//    [window  addSubview:contentView];
//    [self showAnimation];
//    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:duration];
//}
//
//- (void)showFromTopOffset:(CGFloat) top_{
//    UIWindow *window = [UIApplication sharedApplication].keyWindow;
//    contentView.center = CGPointMake(window.center.x, top_ + contentView.frame.size.height/2);
//    [window  addSubview:contentView];
//    [self showAnimation];
//    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:duration];
//}
//
- (void)showFromBottomOffset:(CGFloat) bottom_{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    contentView.center = CGPointMake(window.center.x, window.frame.size.height-(bottom_ + contentView.frame.size.height/2));
    [window  addSubview:contentView];
    [self showAnimation];
    [self performSelector:@selector(hideAnimation) withObject:nil afterDelay:duration];
}
//
//
//+ (void)showWithText:(NSString *)text_{
//    [TOAST showWithText:text_ duration:DEFAULT_DISPLAY_DURATION];
//}
//
//+ (void)showWithText:(NSString *)text_
//            duration:(CGFloat)duration_{
//    TOAST *toast = [[TOAST alloc] initWithText:text_];
//    [toast setDuration:duration_];
//    [toast show];
//}
//
//+ (void)showWithText:(NSString *)text_
//           topOffset:(CGFloat)topOffset_{
//    [TOAST showWithText:text_  topOffset:topOffset_ duration:DEFAULT_DISPLAY_DURATION];
//}
//
//+ (void)showWithText:(NSString *)text_
//           topOffset:(CGFloat)topOffset_
//            duration:(CGFloat)duration_{
//    TOAST *toast = [[TOAST alloc] initWithText:text_];
//    [toast setDuration:duration_];
//    [toast showFromTopOffset:topOffset_];
//}

+ (void)showWithText:(NSString *)text_
        bottomOffset:(CGFloat)bottomOffset_{
    [TOAST showWithText:text_  bottomOffset:bottomOffset_ duration:DEFAULT_DISPLAY_DURATION];
}

+ (void)showWithText:(NSString *)text_
        bottomOffset:(CGFloat)bottomOffset_
            duration:(CGFloat)duration_{
    TOAST *toast = [[TOAST alloc] initWithText:text_];
    [toast setDuration:duration_];
    [toast showFromBottomOffset:bottomOffset_];
}
@end
