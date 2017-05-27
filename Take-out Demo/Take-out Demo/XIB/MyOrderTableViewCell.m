//
//  MyOrderTableViewCell.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/12.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "MyOrderTableViewCell.h"

@interface MyOrderTableViewCell ()
@end

@implementation MyOrderTableViewCell

- (void)awakeFromNib {
	[super awakeFromNib];
	// Initialization code
}
+(instancetype)cellWithTableView:(UITableView *)tableView
{
	MyOrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"orderCell"];
	if (!cell) {
		cell = [[[NSBundle mainBundle] loadNibNamed:@"MyOrderTableViewCell" owner:nil options:nil] lastObject];
	}
	return cell;
}

-(void)setOrder:(Order *)order{
	//    NSArray *dicArray = [OrderGoods mj_keyValuesArrayWithObjectArray:order.order_goods];
	//    NSLog(@"%@",dicArray);
	self.timeLabel.text = order.create_time;
	self.statusLabel.text = order.textStatus;
	self.priceLabel.text = order.user_pay_amount;
	//self.numLabel.text = [NSString stringWithFormat:@"共%d件商品",order.buy_num];
	NSMutableArray *muArray = [NSMutableArray new];
	NSMutableArray *imgArray = [NSMutableArray new];
	NSInteger count = order.order_goods.count;
	for (int i = 0; i < count ; i ++) {
		[muArray addObject:[order.order_goods[i] objectForKey:@"pid"]];
	}
	if (count < 5) {
		self.moreImg.hidden = YES;
	}
	NSLog(@"%@",muArray);
	for (int j = 0; j < count; j ++) {
		BmobQuery *query = [BmobQuery queryWithClassName:@"Products"];
		[query whereKey:@"pid" equalTo:@([muArray[j] integerValue])];
		[query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
			for (BmobObject *obj in array) {
				[imgArray addObject:[obj objectForKey:@"img"]];
			}
			NSLog(@"%@",imgArray);
			dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
				switch (count) {
					case 0:
						
						break;
					case 1:
					{
						[self.imageView1 sd_setImageWithURL:[NSURL URLWithString:imgArray[0]]];
					}
						break;
					case 2:
					{
						[self.imageView1 sd_setImageWithURL:[NSURL URLWithString:imgArray[0]]];
						[self.imageView2 sd_setImageWithURL:[NSURL URLWithString:imgArray[1]]];
					}
						break;
					case 3:
					{
						[self.imageView1 sd_setImageWithURL:[NSURL URLWithString:imgArray[0]]];
						[self.imageView2 sd_setImageWithURL:[NSURL URLWithString:imgArray[1]]];
						[self.imageView3 sd_setImageWithURL:[NSURL URLWithString:imgArray[2]]];
					}
						break;
					case 4:
					{
						[self.imageView1 sd_setImageWithURL:[NSURL URLWithString:imgArray[0]]];
						[self.imageView2 sd_setImageWithURL:[NSURL URLWithString:imgArray[1]]];
						[self.imageView3 sd_setImageWithURL:[NSURL URLWithString:imgArray[2]]];
						[self.imageView4 sd_setImageWithURL:[NSURL URLWithString:imgArray[3]]];
					}
						break;
					default:
					{
						[self.imageView1 sd_setImageWithURL:[NSURL URLWithString:imgArray[0]]];
						[self.imageView2 sd_setImageWithURL:[NSURL URLWithString:imgArray[1]]];
						[self.imageView3 sd_setImageWithURL:[NSURL URLWithString:imgArray[2]]];
						[self.imageView4 sd_setImageWithURL:[NSURL URLWithString:imgArray[3]]];
					}
						break;
				}
				
			});
		}];
	}
	
	
}


@end
