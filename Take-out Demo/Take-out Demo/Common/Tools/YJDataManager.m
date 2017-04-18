//
//  YJDataManager.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/16.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJDataManager.h"
#import "FMDatabase.h"
#import "AdressModel.h"
#import "OneKit.h"
#import "YJUserModel.h"
static FMDatabase *dataBase;
@implementation YJDataManager
+(BOOL)openDB
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Take_Out" ofType:@"db"];
    dataBase = [[FMDatabase alloc] initWithPath:path];
    if ([dataBase open]) {
        NSLog(@"open success");
        return true;
    }else{
        return false;
    }
}
+(NSArray *)getData:(DataType)type
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    if ([self openDB]) {
        
    }else{
        return array;
    }
    switch (type) {
        case myAdress:
        {
            NSString *sql = @"select * FROM MyAdress";
            FMResultSet *re = [dataBase executeQuery:sql];
            while ([re next]) {
                AdressModel *model = [AdressModel new];
                model.name = [re stringForColumn:@"name"];
                model.telphone = [NSString stringWithFormat:@"%@",[re stringForColumn:@"telphone"]];
                model.accept_name = [NSString stringWithFormat:@"%@",[re stringForColumn:@"accept_nam"]];
                model.address = [NSString stringWithFormat:@"%@",[re stringForColumn:@"address"]];
                [array addObject:model];
            }
        }
            
            break;
        case categoty:
        {
            NSString *sql = @"select name FROM Categories";
            FMResultSet *re = [dataBase executeQuery:sql];
            while ([re next]) {
                AdressModel *model = [AdressModel new];
                model.name = [NSString stringWithFormat:@"%@",[re stringForColumn:@"name"]];
                [array addObject:model];
            }
        }
        break;
        case login:
        {
            NSString *sql = @"select * FROM User";
            FMResultSet *re = [dataBase executeQuery:sql];
            while ([re next]) {
                YJUserModel *model = [YJUserModel new];
                model.uname = [NSString stringWithFormat:@"%@",[re stringForColumn:@"uname"]];
                model.upsw = [NSString stringWithFormat:@"%@",[re stringForColumn:@"upsw"]];
                model.phone = [re intForColumn:@"phone"];
                [array addObject:model];
            }
        }
            
        default:
            break;
    }
    return array;
}
+(NSArray *)updateData:(DataType)type
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
    if ([self openDB]) {
        
    }else{
        return array;
    }
    switch (type) {
        case categoty:
        {
            //            NSString *sql =
        }
            break;
            
        default:
            break;
    }
    return array;
}
@end
