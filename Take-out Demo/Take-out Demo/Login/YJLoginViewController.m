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
}
- (IBAction)login:(UIButton *)sender {
    __weak typeof (self)wealSelf = self;
    NSArray *array = [YJDataManager getData:user];
    NSMutableDictionary *muDic = [NSMutableDictionary new];
    NSMutableDictionary *phoneDic = [NSMutableDictionary new];
    self.array = array;
    for (int i = 0; i < self.array.count; i++) {
        self.model = self.array[i];
        NSString *username = self.model.uname;
        NSString *psw = self.model.upsw;
        int phone = self.model.phone;
        //[muDic setValue:@{username:psw} forKey:[NSString stringWithFormat:@"%d",i]];
        [muDic setValue:psw forKey:username];
        [phoneDic setValue:@(phone) forKey:username];
    }
    NSString *userName = self.userName.text;
    NSString *userPsw = self.password.text;
    NSArray *usernameArray = [muDic allKeys];
    NSInteger phone = (NSInteger)phoneDic[userName];
    if ([usernameArray containsObject:userName] && [userPsw isEqualToString:muDic[userName]]) {
        [MESSAGE sendMessage:@"USERNAME" data:@{@"userName":userName}];
        [CONFIG set:@"PHONE" value:@(phone)];
        wealSelf.delegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
        wealSelf.delegate.isLogin = YES;
        //[CONFIG set:ISLOGIN value:@YES];
        [CONFIG set:@"USERNAME" value:userName];
        [self dismissViewControllerAnimated:YES completion:nil];
        
        return;
    }else{
        [DIALOG alert:@"输入错误，请重新输入!"];
        ;
    }

}
- (IBAction)forgotPsw:(id)sender {
    [DIALOG toast:@"暂未开发，敬请期待"];
}
- (IBAction)register:(UIButton *)sender {
    YJRegisterViewController *registerVC = [STORYBOARD instantiateViewControllerWithIdentifier:@"YJRegisterViewController"];
    [self.navigationController pushViewController:registerVC animated:YES];
}



@end
