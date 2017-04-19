//
//  Cell2.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/19.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "Cell2.h"

@implementation Cell2
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.titileLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 20, 200, 20)];
        self.titileLabel.textColor = [UIColor brownColor];
        self.titileLabel.font = [UIFont systemFontOfSize:12.0f];
        [self addSubview:self.titileLabel];
        //
        self.textField = [[UITextField alloc] initWithFrame:CGRectMake(20, 40, self.frame.size.width, 40)];
        self.textField.font = [UIFont systemFontOfSize:16.0f];
        [self addSubview:_textField];
    }
    return self;
}
@end
