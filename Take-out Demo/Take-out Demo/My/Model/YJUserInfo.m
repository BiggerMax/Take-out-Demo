//
//  YJUserInfo.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/4/8.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJUserInfo.h"


@implementation YJUserInfo
+(instancetype)shareInstance{
	static dispatch_once_t onceToken;
	static YJUserInfo *userInfo;
	dispatch_once(&onceToken, ^{
		userInfo = [[YJUserInfo alloc] init];
		[AdressData loadAdressData:^(NSArray *allAdress, NSError *error) {
			if (allAdress != nil) {
				userInfo.allAdress = [allAdress mutableCopy];
				//userInfo.defaultAddress = allAdress[1];
			}
		}];
		BmobUser *user = [BmobUser currentUser];
		NSString *username = user.username;
		BmobQuery *query = [BmobQuery queryWithClassName:@"_User"];
		[query whereKey:@"username" equalTo:username];
		[query findObjectsInBackgroundWithBlock:^(NSArray *array, NSError *error) {
			for (BmobUser *user in array) {
				Adress *model = [Adress new];
				model.name = [user objectForKey:@"accpet_name"];
				model.telphone = user.mobilePhoneNumber;
				model.address = [user objectForKey:@"address"];
				userInfo.defaultAddress = model;
			}
			
		}];
		
	});
	return userInfo;
}
-(Adress *)defaultAddress
{
	return _defaultAddress;
}
@end
