//
//  StatusCell.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/22.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "StatusCell.h"

@implementation StatusCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        _selectedBtn.userInteractionEnabled = false;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return self;
}
@end
