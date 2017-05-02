//
//  YJRegisterViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/19.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJRegisterViewController.h"


@interface YJRegisterViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *passWord;
    @property (strong, nonatomic) IBOutlet UITextField *telPhone;
    @property (strong, nonatomic) IBOutlet UITextField *verifyCode;
    @property (strong, nonatomic) IBOutlet UIButton *message_btn;

@end

@implementation YJRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"v2_goback"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
}
-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)registe:(UIButton *)sender {
    NSString *userName = self.userName.text;
    NSString *psw = self.passWord.text;
    if (isEmpty(userName) || isEmpty(psw)) {
        [DIALOG toast:@"输入错误，请重新输入"];
        return;
    }
    if (_verifyCode.text.length == 0) {
        return;
    }else{
        [SMSSDK commitVerificationCode:self.verifyCode.text phoneNumber:self.telPhone.text zone:@"86" result:^(SMSSDKUserInfo *userInfo, NSError *error) {
            if (!error) {
//                [ApiBLL registerWithUsername:userName password:psw telPhone:[self.telPhone.text integerValue] callback:^(BOOL isError, BOOL result) {
//                    if (isError) {
//                        [DIALOG alert:@"注册失败"];
//                        return ;
//                    }else{
//                        [DIALOG toast:@"注册成功，请登录!"];
//                        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
//                    }
//                }];
                BmobUser *bUser = [BmobUser new];
                [bUser setUsername:userName];
                [bUser setPassword:psw];
                [bUser setMobilePhoneNumber:self.telPhone.text];
                [bUser signUpInBackgroundWithBlock:^(BOOL isSuccessful, NSError *error) {
                    if (isSuccessful ) {
                        [DIALOG toast:@"注册成功，请登录!"];
                        [self performSelector:@selector(dismiss) withObject:self afterDelay:1.0];
                        
                    }else if (error){
                        [DIALOG alert:@"注册失败,该手机号已被注册"];
                        return ;
                    }
                }];
            }
            else{
                [DIALOG alert:@"注册失败"];
            }
        }];
    }

}
    -(void)dismiss{
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }
- (IBAction)receiveMessage:(UIButton *)sender {
    [SMSSDK getVerificationCodeByMethod:SMSGetCodeMethodSMS phoneNumber:self.telPhone.text zone:@"86" customIdentifier:nil result:^(NSError *error) {
        if (!error) {
            NSLog(@"获取验证码成功");
            [sender setTitle:@"获取成功" forState:UIControlStateNormal];
        } else {
            NSLog(@"错误信息：%@",error);
            [DIALOG toast:@"验证码错误，请重新输入"];
        }
        
        }];
}


@end
