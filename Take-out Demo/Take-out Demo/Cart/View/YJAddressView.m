//
//  YJAddressView.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/3/9.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJAddressView.h"
#import "MyAdressViewController.h"

@interface YJAddressView()
@property(nonatomic,strong)UILabel *addressLabel;
@property(nonatomic,strong)UILabel *nameLabel;
@property(nonatomic,strong)UILabel *name;
@property(nonatomic,strong)UILabel *address;
@property(nonatomic,strong)UILabel *phone;
@property(nonatomic,strong)UIImageView *arrows;

@end
@implementation YJAddressView

-(instancetype)initWithFrame:(CGRect)frame{
    if (self = [super initWithFrame:frame]) {

        self.defaultAdress = [YJUserInfo shareInstance].defaultAddress;
        self.backgroundColor = [UIColor whiteColor];
        
        _addressLabel = [[UILabel alloc] init];
        _addressLabel.font = [UIFont systemFontOfSize:11];
        _addressLabel.textColor = [UIColor blackColor];
        _addressLabel.text = @"收货地址:";
        [_addressLabel sizeToFit];
        [self addSubview:_addressLabel];
        
        _address = [[UILabel alloc] init];
        _address.font = [UIFont systemFontOfSize:12];
        _address.textColor = [UIColor blackColor];
        _address.text = [NSString stringWithFormat:@"%@",self.defaultAdress.address];
        [_address sizeToFit];
       // _address.backgroundColor = [UIColor redColor];
        [self addSubview:_address];
        
        _nameLabel = [UILabel new];
        _nameLabel.font = [UIFont systemFontOfSize:12];
        _nameLabel.text = @"收货人:";
        [self addSubview:_nameLabel];
        
        _name = [UILabel new];
        _name.font = [UIFont systemFontOfSize:14];
        //_name.backgroundColor = [UIColor grayColor];
        _name.text = self.defaultAdress.name;
        [self addSubview:_name];
        
        _phone = [UILabel new];
        _phone.font = [UIFont systemFontOfSize:14];
        //_phone.backgroundColor = [UIColor greenColor];
        _phone.text = self.defaultAdress.telphone;
        [self addSubview:_phone];
        
        _arrows = [UIImageView new];
        _arrows.image = [UIImage imageNamed:@"icon_go"];
        [self addSubview:_arrows];
        
        [_nameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.top.equalTo(self).offset(10);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(10);
        }];
        [_name mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_nameLabel.mas_trailing).offset(3);
            make.top.equalTo(self).offset(10);
            make.width.mas_equalTo(150);
            make.height.mas_equalTo(10);
        }];
        
        [_phone mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self).offset(-30);
            make.centerY.equalTo(_name.mas_centerY);
            make.height.mas_equalTo(10);
            make.width.mas_equalTo(100);
            
        }];
        [_addressLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(self).offset(10);
            make.top.equalTo(_nameLabel.mas_bottom).offset(10);
            make.width.mas_equalTo(50);
            make.height.mas_equalTo(15);
        }];
        
        [_address mas_makeConstraints:^(MASConstraintMaker *make) {
            make.leading.equalTo(_addressLabel.mas_trailing).offset(5);
            make.centerY.equalTo(_addressLabel.mas_centerY);
            make.width.mas_equalTo(200);
            make.height.mas_equalTo(20);
        }];
        [_arrows mas_makeConstraints:^(MASConstraintMaker *make) {
            make.trailing.equalTo(self).offset(-10);
            make.centerY.equalTo(self);
        }];
    }
    return self;
}

@end
