//
//  ModifyAddressViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/12.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "ModifyAddressViewController.h"

@interface ModifyAddressViewController ()
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *telTextField;
@property (strong, nonatomic) IBOutlet UITextField *addTextField;

@end

@implementation ModifyAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = false;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = false;
}
- (IBAction)delCurrent:(UIButton *)sender {
}
- (IBAction)save:(UIBarButtonItem *)sender {
}

@end
