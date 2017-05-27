//
//  YJHeadLinePageVIew.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/22.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJHeadLinePageVIew.h"
#import "YJHeadLineContentView.h"

@interface YJHeadLinePageVIew()<UIScrollViewDelegate>
@property(nonatomic,strong)UIScrollView *headLineScrollView;
@property(nonatomic,assign)NSInteger currentPage;
@property(nonatomic,strong)NSTimer *timer;
@property NSMutableArray<HeadlineDetail *> *actAow;
@end
@implementation YJHeadLinePageVIew

static const CGFloat MaxContentCount = 3;

-(instancetype)initWithFrame:(CGRect)frame{
	if (self = [super initWithFrame:frame]) {
		_headLineScrollView = [[UIScrollView alloc]init];
		_headLineScrollView.pagingEnabled = YES;
		_headLineScrollView.bounces = NO;
		_headLineScrollView.delegate = self;
		_headLineScrollView.showsVerticalScrollIndicator = NO;
		_headLineScrollView.showsHorizontalScrollIndicator = NO;
		[self addSubview:_headLineScrollView];
		
		for (int i = 0; i < MaxContentCount; ++i) {
			YJHeadLineContentView *contentView = [[YJHeadLineContentView alloc]init];
			contentView.userInteractionEnabled = YES;
			UITapGestureRecognizer *tapGes = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(contentViewClicked:)];
			[contentView addGestureRecognizer:tapGes];
			[_headLineScrollView addSubview:contentView];
		}
		self.actAow = [NSMutableArray<HeadlineDetail *> new];
		BmobQuery *query = [BmobQuery queryWithClassName:@"Annoucement"];
		[query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
			for (BmobObject *obj in array) {
				HeadlineDetail *model = [HeadlineDetail new];
				NSString *title = [obj objectForKey:@"title"];
				NSString *content = [obj objectForKey:@"content"];
				model.title = title;
				model.content = content;
				[self.actAow addObject:model];
			}
		}];

	}
	return self;
}

-(void)layoutSubviews{
	[super layoutSubviews];
	self.headLineScrollView.frame = self.bounds;
	CGFloat scrollViewW = self.headLineScrollView.frame.size.width;
	CGFloat scrollViewH = self.headLineScrollView.frame.size.height;
	self.headLineScrollView.contentSize = CGSizeMake(scrollViewW, scrollViewW * MaxContentCount);
	for (NSInteger i = 0; i<MaxContentCount; i++) {
		YJHeadLineContentView *contentView = self.headLineScrollView.subviews[i];
		contentView.frame = CGRectMake(0, i * scrollViewH, scrollViewW, scrollViewH);
	}
}

-(void)updateHeadLinePageView{
	CGFloat scrollViewH = self.headLineScrollView.frame.size.height;
	for (int i = 0; i < MaxContentCount; ++i) {
		NSInteger index = self.currentPage;
		YJHeadLineContentView *contentView = self.headLineScrollView.subviews[i];
		if (i==0) {
			index--;
		}else if (i == 2){
			index++;
		}
		if (index < 0) {
			index = self.headLine.act_rows.count-1;
			
		}else if (index > self.headLine.act_rows.count-1){
			index = 0;
		}
		contentView.tag = index;
		contentView.headLine = self.actAow[index];
		//contentView.actRow = self.headLine.act_rows[index];
	}
	self.headLineScrollView.contentOffset = CGPointMake(0, scrollViewH);
}
-(void)contentViewClicked:(UITapGestureRecognizer *)tapGes{
	if (self.callBack) {
		self.callBack(HeadViewItemTypeHeadLine,tapGes.view.tag);
	}
}

#pragma mark -- UIScrollViewDelegate
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
	CGFloat minDistance = MAXFLOAT;
	for (int i = 0; i < MaxContentCount; i++) {
		YJHeadLineContentView *contentView = self.headLineScrollView.subviews[i];
		CGFloat distance = fabs(contentView.frame.origin.y - self.headLineScrollView.contentOffset.y);
		if (distance < minDistance) {
			minDistance = distance;
			self.currentPage = contentView.tag;
		}
	}
}

//-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//	[self updateHeadLinePageView];
//}
-(void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
	[self updateHeadLinePageView];
}

-(void)startTimer{
	self.timer = [NSTimer timerWithTimeInterval:3 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
	[[NSRunLoop currentRunLoop] addTimer:self.timer forMode:NSDefaultRunLoopMode];
}
-(void)stopTimer{
	if (self.timer != nil) {
		[self.timer invalidate];
		self.timer = nil;
	}
}

-(void)nextPage{
	CGFloat scrollViewH = self.headLineScrollView.frame.size.height;
	[self.headLineScrollView setContentOffset:CGPointMake(0, 2 * scrollViewH) animated:YES];
}

-(void)setHeadLine:(ActInfo *)headLine{
	[self layoutIfNeeded];
	_headLine = headLine;
	self.currentPage = 0;
	[self stopTimer];
	[self startTimer];
	//[self updateHeadLinePageView];
}


@end
