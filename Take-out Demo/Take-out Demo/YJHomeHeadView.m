//
//  YJHomeHeadView.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJHomeHeadView.h"

@implementation YJHomeHeadView
-(NSArray *)focusImage{
    __block NSMutableArray *focusImages = [NSMutableArray array];
    [YJActivity loadBannerData:^(id data, NSError *error) {
        focusImages = data;
    }];
    return focusImages;
}
-(instancetype)initWIthHeadData:(YJHomeHeadData *)headData{
    self = [super init];
    if (!self) {
        return nil;
    }
    
    __block NSMutableArray *focusImages = [NSMutableArray array];
    NSMutableArray *iconImages = [NSMutableArray array];
    NSMutableArray *iconTitles = [NSMutableArray array];
	[headData.icon.act_rows enumerateObjectsUsingBlock:^(ActRow * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
		[iconImages addObject:obj.activity.img];
		[iconTitles addObject:obj.activity.name];
	}];
	_hotView = [[YJHotView alloc] initWithImages:iconImages titles:iconTitles placeHolder:[UIImage imageNamed:@"v2_placeholder_square"]];
	BmobQuery *query = [BmobQuery queryWithClassName:@"banner"];
	[query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
		for (BmobObject *obj in array)
		{
			[focusImages addObject:[obj objectForKey:@"img"]];
		}
		_scrollView = [YJScrollPageView pageController:focusImages placeHolderImage:[UIImage imageNamed:@"v2_placeholder_full_size"]];
		_scrollView.backgroundColor = [UIColor orangeColor];
	
		_headlineView = [[YJHeadLineView alloc] init];
		_headlineView.headLine = headData.headline;
		[self addSubview:_headlineView];
		[self addSubview:_scrollView];
		[self addSubview:_hotView];
		
		[_scrollView layoutIfNeeded];
		[_hotView layoutIfNeeded];
		
		[_scrollView mas_makeConstraints:^(MASConstraintMaker *make) {
			make.leading.equalTo(self);
			make.top.equalTo(self);
			make.trailing.equalTo(self);
			make.height.equalTo(self.mas_width).multipliedBy(0.37);
		}];
		[_hotView mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(_scrollView.mas_bottom);
			make.leading.equalTo(self);
			make.trailing.equalTo(self);
			make.height.mas_equalTo(_hotView.bounds.size.height);
		}];
		[_headlineView mas_makeConstraints:^(MASConstraintMaker *make) {
			make.top.equalTo(_hotView.mas_bottom);
			make.trailing.equalTo(self);
			make.leading.equalTo(self);
			make.height.mas_equalTo(30);
		}];


		
	}];

        return self;
}

-(void)setHeight:(CGFloat)height{
    _height = height;
    [YJNotification postNotificationName:HomeTableHeadViewHeightDidChange object:[NSNumber numberWithFloat:_height]];
}

-(void)layoutSubviews{
    [super layoutSubviews];
    self.height = CGRectGetMaxY(_headlineView.frame);
}
-(void)setCallback:(ClikedCallback)callback{
    self.hotView.callback = callback;
    self.scrollView.clikeCall = callback;
    self.headlineView.callBack = callback;
}
@end
