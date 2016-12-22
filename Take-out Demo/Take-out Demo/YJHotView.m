//
//  YJHotView.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJHotView.h"
#import "YJIconImageTextView.h"

@implementation YJHotView
-(instancetype)initWithImages:(NSArray<NSString *> *)images titles:(NSArray *)titles placeHolder:(UIImage *)image{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.backgroundColor = [UIColor whiteColor];
    for (NSInteger i = 0; i < images.count; i ++ ) {
        YJIconImageTextView *iconView = [YJIconImageTextView IconImageTextView:images[i] title:titles[i] placeHolder:image];
        iconView.tag = i;
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(clicked:)];
        [iconView addGestureRecognizer:tap];
        [self addSubview:iconView];
    }
    return self;
}

-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat iconW = (Width - 2 * DefaultMargin) / 4;
    CGFloat iconH = iconW * 0.68 + 20;
    for (NSInteger i = 0; i < self.subviews.count; i++) {
        YJIconImageTextView *iconView = self.subviews[i];
        CGFloat iconX = (i % 4) * iconW + DefaultMargin;
        CGFloat iconY = (i / 4) * iconH;
        iconView.frame = CGRectMake(iconX, iconY, iconW, iconH);
    }
    self.bounds = CGRectMake(0, 0, Width, (self.subviews.count / 4) * iconH);
}


-(void)clicked:(UIGestureRecognizer *)tapGes{
    if (self.callback) {
        self.callback(HeadViewItemTypeHot,tapGes.view.tag);
    }
}
@end
