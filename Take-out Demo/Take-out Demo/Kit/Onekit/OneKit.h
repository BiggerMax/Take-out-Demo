//
//  Onekit.h
//  Onekit
//
//  Created by www.onekit.cn on 15/2/26.
//  Copyright (c) 2015年 www.onekit.cn. All rights reserved.
//

//#import <Foundation/Foundation.h>
//#import <UIKit/UIKit.h>

#import "AJAX.h"
#import "APP.h"
#import "CONFIG.h"
#import "DatePicker.h"
#import "DB.h"
#import "DEVICE.h"
#import "DIALOG.h"
#import "FSO.h"
#import "JSON.h"
#import "LOADING.h"
#import "MESSAGE.h"
#import "NSArray+Onekit.h"
#import "NSData+Onekit.h"
#import "NSDate+Onekit.h"
#import "NSString+Onekit.h"
#import "PASSWORD.h"
#import "UI.h"
#import "UIButton+Onekit.h"
#import "UIColor+Onekit.h"
#import "UIImage+Onekit.h"
#import "UILabel+Onekit.h"
#import "UINavigationItem+Onekit.h"
#import "UITextView+Onekit.h"
#import "UIView+Onekit.h"
#import "UIViewController+Onekit.h"
#import "CAMERA.h"
#import "IMAGE.h"
#import "COLOR.h"
#import "STRING.h"
#import "SimplePickerView.h"
#import "TOAST.h"
#import "MATH.h"
#import "Macro.h"
#import "UIWebView+Onekit.h"
#import "CONFIG.h"
#import "CONFIG0.h"
@interface Onekit : NSObject

+ (void)init;
//+ (id)invokeClassWithClass:(Class)cls object:(id)object method:(SEL)method arguments:(NSArray*)arguments;
+ (void)setting:(NSObject*)obj;
+ (void)tree:(UIView*)view;
@end

