//
//  YJLoginViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/3/23.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJLoginViewController.h"
#import "YJDataManager.h"
#import "AppDelegate.h"
#import "YJUserModel.h"
#import "YJRegisterViewController.h"
#import "YJFindPSWController.h"
#import "ApiBLL.h"
@interface YJLoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property NSArray *array;
@property YJUserModel *model;
@property NSMutableDictionary *dic;
@property AppDelegate *delegate;
@end

@implementation YJLoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"v2_goback"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];

}
-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
	//[self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)login:(UIButton *)sender {
    NSString *userName = self.userName.text;
    NSString *userPsw = self.password.text;
    [BmobUser loginWithUsernameInBackground:userName password:userPsw block:^(BmobUser *user, NSError *error) {
        if (error) {
            [DIALOG alert:@"登录失败"];
            return ;
        }else{
           // [MESSAGE sendMessage:@"USERNAME" data:@{@"userName":userName}];
           // [CONFIG set:@"USERNAME" value:userName];
            [self dismissViewControllerAnimated:YES completion:nil];
        }
    }];
//    [ApiBLL logWithUsername:userName password:userPsw callback:^(BOOL isError, BOOL result) {
//        if (isError) {
//            return ;
//        }
//        if (result) {
//            [MESSAGE sendMessage:@"USERNAME" data:@{@"userName":userName}];
//            [CONFIG set:@"USERNAME" value:userName];
//            [self dismissViewControllerAnimated:YES completion:nil];
//        }else{
//            [DIALOG alert:@"输入错误，请重新输入!"];
//        }
//    }];
    
//    NSArray *usernameArray = [muDic allKeys];
//    NSInteger phone = (NSInteger)phoneDic[userName];
//    if ([usernameArray containsObject:userName] && [userPsw isEqualToString:muDic[userName]]) {
//        [MESSAGE sendMessage:@"USERNAME" data:@{@"userName":userName}];
//        [CONFIG set:@"PHONE" value:@(phone)];
//        wealSelf.delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
//        wealSelf.delegate.isLogin = YES;
//        //[CONFIG set:ISLOGIN value:@YES];
//        [CONFIG set:@"USERNAME" value:userName];
//        [self dismissViewControllerAnimated:YES completion:nil];
//        
//        return;
//    }else{
//        [DIALOG alert:@"输入错误，请重新输入!"];
//        ;
//    }

}
- (IBAction)forgotPsw:(id)sender {
	YJFindPSWController *findVC = [STORYBOARD instantiateViewControllerWithIdentifier:@"YJFindPSWController"];
	[self.navigationController pushViewController:findVC animated:YES];
}
- (IBAction)register_:(UIButton *)sender {
    YJRegisterViewController *registerVC = [STORYBOARD instantiateViewControllerWithIdentifier:@"YJRegisterViewController"];
    [self.navigationController pushViewController:registerVC animated:YES];
}



@end
