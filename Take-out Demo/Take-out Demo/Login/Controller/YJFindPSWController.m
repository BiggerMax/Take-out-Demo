//
//  YJFindPSWController.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/5/9.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJFindPSWController.h"

@interface YJFindPSWController ()
@property (strong, nonatomic) IBOutlet UITextField *telphoneTF;
@property (strong, nonatomic) IBOutlet UITextField *smsCodeTF;
@property (strong, nonatomic) IBOutlet UITextField *pswTF;
@property (strong, nonatomic) IBOutlet UITextField *verifyPswTf;
@end

@implementation YJFindPSWController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"v2_goback"] style:UIBarButtonItemStyleDone target:self action:@selector(back)];
}
-(void)back{
	[self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)comfirmBtn:(id)sender {
	NSString *smsCode = self.smsCodeTF.text;
	NSString *password = self.pswTF.text;
	NSString *verifyPassword = self.verifyPswTf.text;
	if (!smsCode || [smsCode isEqualToString:@""] || !password || [password isEqualToString:@""] || !verifyPassword || [verifyPassword isEqualToString:@""] || ![password isEqualToString:verifyPassword]) {
		UIAlertView *tip = [[UIAlertView alloc] initWithTitle:nil message:@"验证码不能为空，密码及确认密码必须相等且不为空" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
		[tip show];
	} else {
		[BmobUser resetPasswordInbackgroundWithSMSCode:smsCode andNewPassword:password block:^(BOOL isSuccessful, NSError *error) {
			if (isSuccessful) {
				UIAlertView *tip = [[UIAlertView alloc] initWithTitle:nil message:@"重置密码成功" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
				[tip show];
				//跳转
				
				[self.navigationController popViewControllerAnimated:YES];
			} else {
				UIAlertView *tip = [[UIAlertView alloc] initWithTitle:nil message:@"验证码有误" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
				[tip show];
			}
		}];
	}
}
	
- (IBAction)getVerify:(UIButton *)sender {
	NSString *mobilePhone = self.telphoneTF.text;
	[BmobSMS requestSMSCodeInBackgroundWithPhoneNumber:mobilePhone andTemplate:@"注册验证码" resultBlock:^(int number, NSError *error) {
		if (error) {
			NSLog(@"%@",error);
			UIAlertView *tip = [[UIAlertView alloc] initWithTitle:nil message:@"请输入正确的手机号码" delegate:self cancelButtonTitle:@"确定" otherButtonTitles:nil, nil];
			[tip show];
		} else {
			//获得smsID
			NSLog(@"sms ID：%d",number);
			//设置不可点击
			[sender setEnabled:NO];
			sender.backgroundColor = [UIColor grayColor];
		}
	}];
}


@end
