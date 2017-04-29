//
//  UIViewController+Onekit.m
//  Onekit
//
//  Created by 张瑾 on 15/6/30.
//  Copyright (c) 2015年 visitors. All rights reserved.
//

#import "UIViewController+Onekit.h"
#import <objc/runtime.h>
@implementation UIViewController(Onekit)
+ (UIViewController*)current
{
    UIViewController *result;
    
    UIWindow * window = [[UIApplication sharedApplication] keyWindow];
    if (window.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(UIWindow * tmpWin in windows)
        {
            if (tmpWin.windowLevel == UIWindowLevelNormal)
            {
                window = tmpWin;
                break;
            }
        }
    }
    
    UIView *frontView = [[window subviews] objectAtIndex:0];
    id nextResponder = [frontView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else
        result = window.rootViewController;
    return result;
}
- (void)callback:(dispatch_block_t)callback
{
    dispatch_queue_t mainQueue = dispatch_get_main_queue();
    dispatch_async(mainQueue,callback);
}
/*
- (UIViewController*)topViewController
{
    return [self topViewControllerWithRootViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
}

- (UIViewController*)topViewControllerWithRootViewController:(UIViewController*)rootViewController
{
    if ([rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController* tabBarController = (UITabBarController*)rootViewController;
        return tabBarController;//[self topViewControllerWithRootViewController:tabBarController.selectedViewController];
    } else if ([rootViewController isKindOfClass:[UINavigationController class]]) {
        UINavigationController* navigationController = (UINavigationController*)rootViewController;
        return [self topViewControllerWithRootViewController:navigationController.visibleViewController];
    } else if (rootViewController.presentedViewController) {
        UIViewController* presentedViewController = rootViewController.presentedViewController;
        return [self topViewControllerWithRootViewController:presentedViewController];
    } else if (rootViewController.tabBarController) {
        UIViewController* tabBarController = rootViewController.tabBarController;
        return [self topViewControllerWithRootViewController:tabBarController];
    } else{
        return rootViewController;
    }
}*/
- (UIViewController*)currentViewController
{
    return [self topmostViewController];
}
- (UIViewController *)topmostViewController
{
    return [self topmostViewControllerFrom:[[self baseWindow] rootViewController]
                              includeModal:YES];
}

- (UIViewController *)topmostNonModalViewController
{
    return [self topmostViewControllerFrom:[[self baseWindow] rootViewController]
                              includeModal:NO];
}

- (UINavigationController *)topmostNavigationController
{
    return [self topmostNavigationControllerFrom:[self topmostViewController]];
}

- (UINavigationController *)topmostNavigationControllerFrom:(UIViewController *)vc
{
    if ([vc isKindOfClass:[UINavigationController class]])
        return (UINavigationController *)vc;
    if ([vc navigationController])
        return [vc navigationController];
    
    if (vc.presentingViewController)
        return [self topmostNavigationControllerFrom:vc.presentingViewController];
    else
        return nil;
}

- (UIViewController *)topmostViewControllerFrom:(UIViewController *)viewController
                                   includeModal:(BOOL)includeModal
{
    if (includeModal && viewController.presentedViewController)
        return [self topmostViewControllerFrom:viewController.presentedViewController
                                  includeModal:includeModal];
    
    if ([viewController respondsToSelector:@selector(topViewController)])
        return [self topmostViewControllerFrom:[(id)viewController topViewController]
                                  includeModal:includeModal];
    
    return viewController;
}

- (UIWindow *)baseWindow
{
    UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
    if (!window)
        window = [[UIApplication sharedApplication] keyWindow];
    
    NSAssert(window != nil, @"No window to calculate hierarchy from");
    return window;
}

@end
