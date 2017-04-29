//
//  AppDelegate.h
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/20.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property BOOL isLogin;
@property (readonly, strong) NSPersistentContainer *persistentContainer;
@property NSDictionary *DATA;
- (void)saveContext;


@end

