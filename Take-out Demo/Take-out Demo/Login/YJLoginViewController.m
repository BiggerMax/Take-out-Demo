//
//  YJLoginViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 17/3/23.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJLoginViewController.h"
#import "YJDataManager.h"
#import "YJUserModel.h"
@interface YJLoginViewController ()
@property (strong, nonatomic) IBOutlet UITextField *userName;
@property (strong, nonatomic) IBOutlet UITextField *password;
@property NSArray *array;
@property YJUserModel *model;
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
    NSArray *array = [YJDataManager getData:login];
    self.array = array;
    for (int i = 0; i < self.array.count; i++) {
        self.model = self.array[i];
        NSString *username = self.model.uname;
        NSString *psw = self.model.upsw;
        if ([self.userName.text isEqualToString:username] && [self.password.text isEqualToString:psw]) {
            [MESSAGE sendMessage:@"USERNAME" data:@{@"userName":username}];
            [self dismissViewControllerAnimated:YES completion:nil];
            
            return;
        }else{
            [DIALOG alert:@"输入错误，请重新输入!"];
            ;
        }

    }
}
- (IBAction)forgotPsw:(id)sender {
    [DIALOG toast:@"暂未开发，敬请期待"];
}
- (IBAction)registe:(UIButton *)sender {
}


@end
