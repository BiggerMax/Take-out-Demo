#import <QuartzCore/QuartzCore.h>
#import "UIView+Onekit.h"
#import "UIImage+Onekit.h"
@implementation UIView (Onekit)
- (UIImage*)blur:(UIView*)backgroundView
{
    if(&UIGraphicsBeginImageContextWithOptions != NULL)
    {
        UIGraphicsBeginImageContextWithOptions(self.frame.size, NO,0.5);
    } else {
        //UIGraphicsBeginImageContext(self.frame.size);
    }
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGPoint offset = ([backgroundView isKindOfClass:[UIScrollView class]]?((UIScrollView*)backgroundView).contentOffset:CGPointZero);
    CGContextTranslateCTM(context, offset.x, -offset.y-self.frame.origin.y);
    [backgroundView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    image = [image blur];
    UIGraphicsEndImageContext();
    return image;
}
- (void)clear
{
    for (UIView* view in self.subviews) {
        [view removeFromSuperview];
    }
}
/*
- (UIViewController *)viewController
{
    UIViewController *result;
    
    UIWindow *topWindow =  self.window;
    if (topWindow.windowLevel != UIWindowLevelNormal)
    {
        NSArray *windows = [[UIApplication sharedApplication] windows];
        for(topWindow in windows)
        {
            if (topWindow.windowLevel == UIWindowLevelNormal)
                break;
        }
    }
    
    UIView *rootView = [[topWindow subviews] objectAtIndex:0];
    id nextResponder = [rootView nextResponder];
    
    if ([nextResponder isKindOfClass:[UIViewController class]])
        result = nextResponder;
    else if ([topWindow respondsToSelector:@selector(rootViewController)] && topWindow.rootViewController != nil)
        result = topWindow.rootViewController;
    else
        NSAssert(NO, @"ShareKit: Could not find a root view controller.  You can assign one manually by calling [[SHK currentHelper] setRootViewController:YOURROOTVIEWCONTROLLER].");
	
    return result;
}*/
- (void)setPlaceholder2:(NSString *)placeholder2
{
    NSString* string = NSLocalizedString(placeholder2,nil);
    [self setValue:string forKey:@"placeholder"];
}
- (NSString*)placeholder2
{
    return [self valueForKey:@"placeholder"];
}
- (void)setText2:(NSString *)text2
{
    NSString* string = NSLocalizedString(text2,nil);
    [self setValue:string forKey:@"text"];
}
- (NSString*)text2
{
    return [self valueForKey:@"text"];
}
- (void)setTitle2:(NSString *)title2
{
    NSString* string = NSLocalizedString(title2,nil);
    UIButton* button = (UIButton*)self;
    [button setTitle:string forState:UIControlStateNormal];
}
- (NSString*)title2
{
    UIButton* button = (UIButton*)self;
    return [button titleForState:UIControlStateNormal];
}
@end
