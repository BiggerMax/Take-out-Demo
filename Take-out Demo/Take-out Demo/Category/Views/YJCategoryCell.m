//
//  YJCategoryCell.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/2/21.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJCategoryCell.h"
#import "YJCategorySource.h"
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
        
        [self addSubview:_bgImageView];
        [self addSubview:_yellowView];
        [self addSubview:_lineView];
        [self addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.center.equalTo(self);
        }];
        [_bgImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.equalTo(self);
        }];
        [_yellowView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self);
            make.height.equalTo(self).multipliedBy(0.8);
            make.width.equalTo(@5);
            make.centerY.equalTo(self);
        }];
        [_lineView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@0.5);
            make.width.equalTo(self);
            make.bottom.equalTo(self);
        }];
    }
    return self;
}
-(void)setSelected:(BOOL)selected animated:(BOOL)animated{
    [super setSelected:selected animated:animated];
    _yellowView.hidden = !selected;
    _titleLabel.highlighted = selected;
    _bgImageView.highlighted = selected;
}

+(instancetype)cellWithTable:(UITableView*)tableView{
    YJCategoryCell *cell = [tableView dequeueReusableCellWithIdentifier:categoryCell];
    if (!cell) {
        cell = [[YJCategoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:categoryCell];
    }
    return cell;
}
-(void)setCategoryData:(ProductCategory *)categoryData{
    _categoryData = categoryData;
    self.titleLabel.text = categoryData.name;
}

@end
