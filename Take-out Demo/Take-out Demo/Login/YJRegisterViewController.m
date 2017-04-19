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
    [YJDataManager updateData:registe record:@{@"uname":userName,@"upsw":psw} callback:^(NSArray *array,BOOL isError)
    {
        if (isError) {
            [DIALOG alert:@"修改失败"];
            return ;
        }
        [DIALOG toast:@"注册成功，请登录!"];
        [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    }];
}


@end
