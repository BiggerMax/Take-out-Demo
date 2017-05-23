//
//  MyOrderTableViewCell.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/12.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "MyOrderTableViewCell.h"

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
    NSArray *dicArray = [OrderGoods mj_keyValuesArrayWithObjectArray:order.order_goods];
    NSLog(@"%@",dicArray);
    self.timeLabel.text = order.create_time;
    self.statusLabel.text = order.textStatus;
    self.priceLabel.text = order.user_pay_amount;
    //self.numLabel.text = [NSString stringWithFormat:@"共%d件商品",order.buy_num];
}
-(void)setOrder_goods:(OrderGoods *)order_goods{
    
}
@end
