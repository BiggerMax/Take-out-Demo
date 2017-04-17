//
//  YJAddressView.h
//  Take-out Demo
//
//  Created by 袁杰 on 17/3/9.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "YJUserInfo.h"

@interface YJAddressView : UIView
@property(nonatomic)TapCallback callback;
@property(nonatomic,strong)Adress *defaultAdress;
@end
