//
//  YJCategoryCell.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/21.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJCategoryCell.h"

@interface YJCategoryCell()
@property UILabel *titleLabel;
@property UIImageView *bgImageView;
@property UIView *yellowView;
@property UIView *lineView;
@end
@implementation YJCategoryCell
static NSString *categoryCell = @"categoryCell";

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.backgroundColor = [UIColor clearColor];
        _titleLabel.textAlignment = NSTextAlignmentCenter;
        _titleLabel.font = [UIFont systemFontOfSize:15];
        _titleLabel.textColor = [UIColor grayColor];
        _titleLabel.highlightedTextColor = [UIColor blackColor];
        _bgImageView = [[UIImageView alloc]init];
        _bgImageView.image = [UIImage imageNamed:@"llll"];
        _bgImageView.highlightedImage = [UIImage imageNamed:@"kkkkkkk"];
        _yellowView = [[UIView alloc]init];
        _yellowView.backgroundColor = [UIColor orangeColor];
        _yellowView.hidden = YES;
        _lineView = [[UIView alloc]init];
        _lineView.backgroundColor = [UIColor darkGrayColor];
        _lineView.alpha = 0.3;

    }
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
