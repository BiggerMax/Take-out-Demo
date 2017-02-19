//
//  YJMenuView.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/19.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJMenuView.h"
#import "YJTitleIconAction.h"
#import "YJTitleIconView.h"
@interface YJMenuView()
@property(nonatomic,strong)NSArray *menus;
@end
@implementation YJMenuView

static const NSInteger rowNumbers = 4;

-(instancetype)initMenu:(NSArray<YJTitleIconAction *> *)menus withLine:(BOOL)line{
    if (self = [super init]) {
        self.backgroundColor = [UIColor whiteColor];
        self.menus = menus;
        for (YJTitleIconAction *titles in menus) {
            YJTitleIconView *titleIconView = [[YJTitleIconView alloc] initWithTitleLabel:titles.title icon:titles.icon border:line];
            titleIconView.tag = titles.tag;
            titleIconView.userInteractionEnabled = YES;
            UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(titleIconViewClick)];
            [titleIconView addGestureRecognizer:tap];
            [self addSubview:titleIconView];
        }
    }
    return self;
}
-(void)titleIconViewClick{
    
}
-(void)layoutSubviews{
    [super layoutSubviews];
    CGFloat width = self.bounds.size.width / rowNumbers;
    CGFloat height = self.bounds.size.height / (self.menus.count / rowNumbers);
    
    for (int i = 0; i < self.subviews.count; ++i) {
        YJTitleIconView *titleIconView = self.subviews[i];
        CGFloat viewX = (i % rowNumbers) * width;
        CGFloat viewY = (i / rowNumbers) * height;
        titleIconView.frame = CGRectMake(viewX, viewY, width, height);
    }
}
@end
