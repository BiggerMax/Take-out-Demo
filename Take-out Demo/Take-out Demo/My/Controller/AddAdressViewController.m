//
//  AddAdressViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/11.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "AddAdressViewController.h"

@interface AddAdressViewController ()
@property (strong, nonatomic) IBOutlet UITextField *nameTextField;
@property (strong, nonatomic) IBOutlet UITextField *telTextField;
@property (strong, nonatomic) IBOutlet UITextField *addTextField;


@end

@implementation AddAdressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBar.hidden = false;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = false;
}

- (IBAction)save:(UIBarButtonItem *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

@end
