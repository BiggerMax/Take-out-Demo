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
#import "YJCellCategory.h"
#import "YJHomeHeadData.h"
#import "YJProduct.h"
#import "YJCategory.h"
static FMDatabase *dataBase;
@implementation YJDataManager
+(BOOL)openDB
{
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject]stringByAppendingPathComponent:@"Take_Out.db"];
   // NSString *path = [[NSBundle mainBundle] pathForResource:@"Take_Out" ofType:@"sqlite"];
    NSString *path = [[NSBundle mainBundle] pathForResource:@"Take_Out" ofType:@"db"];
    NSError *error;
    NSFileManager *fileManager = [NSFileManager defaultManager];
    [fileManager copyItemAtPath:path toPath:filePath error:&error];
    dataBase = [[FMDatabase alloc] initWithPath:filePath];
    if ([dataBase open]) {
        NSLog(@"%@",filePath);
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
                model.accept_name = [NSString stringWithFormat:@"%@",[re stringForColumn:@"name"]];
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
        case user:
        {
            NSString *sql = @"select * FROM User";
            FMResultSet *re = [dataBase executeQuery:sql];
            while ([re next]) {
                YJUserModel *model = [YJUserModel new];
                model.uname = [NSString stringWithFormat:@"%@",[re stringForColumn:@"uname"]];
                model.upsw = [NSString stringWithFormat:@"%@",[re stringForColumn:@"upsw"]];
                model.phone = [re intForColumn:@"phone"];
                model.address = [NSString stringWithFormat:@"%@",[re stringForColumn:@"address"]];
                [array addObject:model];
            }
        }
            break;
        default:
            break;
    }
    [dataBase close];
    return array;
}
+(void)updateData:(UpdateType)type record:(NSDictionary *)record callback:(void(^)(NSArray *array,BOOL isError))callback
{
    NSMutableString* fields = [NSMutableString new];
    NSMutableString* values = [NSMutableString new];
    for (NSString* keys in record.allKeys) {
        [fields appendFormat:@",%@",keys];
        [values appendFormat:@",\"%@\"",record[keys]];
    }
    if ([self openDB]) {
        switch (type) {
            case registe:
            {
                NSString * sql = [NSString stringWithFormat:@"insert into User (%@) values(%@);",[fields substringFromIndex:1],[values substringFromIndex:1]];
                if ([dataBase executeUpdate:sql]) {
                    NSLog(@"插入成功");
                    callback([self getData:user],NO);
                };
            }
                break;
                case changePSW:
            {
                NSString *sql = [NSString stringWithFormat:@"update User set upsw = (%@) where uname = (%@);",[values substringFromIndex:1],[fields substringFromIndex:1]];
                if ([dataBase executeUpdate:sql]) {
                    NSLog(@"更新成功");
                    callback([self getData:user],NO);
                }else{
                    [DIALOG alert:@"修改失败"];
                    
                }
                ;
            }
                break;
            default:
                break;
        }
    }

}
    
+(NSArray *)fillData:(DataType)type
    {
        NSMutableArray *array_ = [[NSMutableArray alloc] init];
        switch (type) {
        case homeHeadData:
            {
                BmobQuery *query = [BmobQuery queryWithClassName:@"Categories"];
                [query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
                    for (BmobObject *obj in array) {
                        ActRow1 *model = [ActRow1 new];
                        model.category_detail.name = [obj objectForKey:@"name"];
                        [array_ addObject:model];
                    }
                }];
            }
            break;
		case produteData:
        {
			BmobQuery *query = [BmobQuery queryWithClassName:@"Products"];
			[query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
				for (BmobObject *obj in array) {
					YJProduct *model = [YJProduct new];
					model.pid = [obj objectForKey:@"pid"];
					model.pname = [obj objectForKey:@"pname"];
					[array_ addObject:model];
				}
			}];
        }
				break;
		case categories:
			{
				BmobQuery *query = [BmobQuery queryWithClassName:@"Categories"];
				[query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
					for (BmobObject *obj in array) {
						YJCategory *model = [YJCategory new];
						model._id = [obj objectForKey:@"id"];
						model.name = [obj objectForKey:@"name"];
						model.sort = [obj objectForKey:@"sort"];
						[array_ addObject:model];
					}
				}];
			}
            default:
            break;
        }
        return array_;
    }
@end
