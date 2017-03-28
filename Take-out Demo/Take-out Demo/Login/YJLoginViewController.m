//
//  YJLoginViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/3/23.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJLoginViewController.h"

@interface YJLoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;

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
    if ([self.userName.text isEqualToString:@"admin"] && [self.password.text isEqualToString:@"123456"]) {
        [MESSAGE sendMessage:@"USERNAME" data:@{@"userName":@"admin"}];
        [self dismissViewControllerAnimated:YES completion:nil];
    }else{
        [DIALOG alert:@"输入错误，请重新输入!"];
        return;
    }
}
- (IBAction)forgotPsw:(id)sender {
    [DIALOG toast:@"暂未开发，敬请期待"];
}
- (IBAction)registe:(UIButton *)sender {
}


@end
