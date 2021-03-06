//
//  AppDelegate.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/20.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "AppDelegate.h"
#import "YJConst.h"
#import "YJMainTabBarViewController.h"
#import "ApiBLL.h"
#import <SMS_SDK/SMSSDK.h>
@interface AppDelegate ()
{
    BOOL login;
}
@end

@implementation AppDelegate

//-(void)setIsLogin:(BOOL)isLogin
//{
//    isLogin ;
//}
//-(BOOL)isLogin{
//    return login;
//}
- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
	
    //短信验证
    [SMSSDK registerApp:@"1d7302403ef3a" withSecret:@"fa072d53ec2065a77545eece002c75ad"];
    
    //云服务器
    [Bmob registerWithAppKey:@"a118803b349a7e72dd3082a709b2de97"];
    
	[BmobUser logout];
    [CONFIG set:@"PHONE" value:nil];
   // [CONFIG set:ISLOGIN value:@(NO)];
   // self.isLogin = false;
    [self setAppStyle];
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
    if (true) {
        [self showMainTabBarController];
    }else{
        [self showMainTabBarController];
    }
    return YES;
}

-(void)setAppStyle{
    UITabBar *item = [UITabBar appearance];
    item.tintColor = [UIColor orangeColor];
    UINavigationBar *navigationBar = [UINavigationBar appearance];
    navigationBar.translucent = NO;
}
-(void)showMainTabBarController{
    self.window.rootViewController = [[YJMainTabBarViewController alloc]init];
}
- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    // Saves changes in the application's managed object context before the application terminates.
    [self saveContext];
}


#pragma mark - Core Data stack

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    // The persistent container for the application. This implementation creates and returns a container, having loaded the store for the application to it.
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"Take_out_Demo"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    // Replace this implementation with code to handle the error appropriately.
                    // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                    
                    /*
                     Typical reasons for an error here include:
                     * The parent directory does not exist, cannot be created, or disallows writing.
                     * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                     * The device is out of space.
                     * The store could not be migrated to the current model version.
                     Check the error message to determine what the actual problem was.
                    */
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

#pragma mark - Core Data Saving support

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        // Replace this implementation with code to handle the error appropriately.
        // abort() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@end
