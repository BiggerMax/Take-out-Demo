//
//  AdressData.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/4/8.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "AdressData.h"

@implementation AdressData
+(void)loadAdressData:(CompleteBlock)complete
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"MyAdress" ofType:nil];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    AdressData *adressData = [AdressData mj_objectWithKeyValues:dic];
    complete(adressData.data,nil);
}

+(NSDictionary *)mj_objectClassInArray
{
    return @{@"data":NSStringFromClass([Adress class])};
}
@end

@implementation Adress


@end
