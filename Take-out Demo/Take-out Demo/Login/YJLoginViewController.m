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
    //self.view.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];

}
-(void)back{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)login:(UIButton *)sender {
}
- (IBAction)forgotPsw:(id)sender {
}
- (IBAction)registe:(UIButton *)sender {
}


@end
