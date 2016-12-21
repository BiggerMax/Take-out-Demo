//
//  ItemCustomButton.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/21.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "ItemCustomButton.h"

@implementation ItemCustomButton

@end
@implementation ItemLeftButton

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    CGFloat width = self.frame.size.width;
    CGFloat heigh = self.frame.size.height;
    CGFloat offset = -20;
    self.titleLabel.frame = CGRectMake(offset, heigh-15, width, 15);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.frame = CGRectMake(offset, 0, width, heigh-15);
    self.imageView.contentMode = UIViewContentModeCenter;
}

@end

@implementation ItemRighButton

-(void)layoutSubviews{
    [super layoutSubviews];
    [self.titleLabel sizeToFit];
    CGFloat width = self.frame.size.width;
    CGFloat heigh = self.frame.size.height;
    CGFloat offset = 20;
    self.titleLabel.frame = CGRectMake(offset, heigh - 15, width, heigh-15);
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.imageView.frame = CGRectMake(offset, 0, width, heigh-15);
    self.imageView.contentMode = UIViewContentModeCenter;
}

@end
