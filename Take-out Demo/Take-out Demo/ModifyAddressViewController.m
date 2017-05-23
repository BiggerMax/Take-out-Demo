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
@property BmobUser *user;
@end

@implementation ModifyAddressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.user = [BmobUser currentUser];
    self.navigationController.navigationBar.hidden = false;
	self.nameTextField.text = self.adress.accept_name;
	self.telTextField.text = self.adress.telphone;
	self.addTextField.text = self.adress.address;
}
-(void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationController.navigationBar.hidden = false;
}
- (IBAction)delCurrent:(UIButton *)sender {
	BmobObject *addObject = [BmobObject objectWithoutDataWithClassName:@"_User" objectId:self.user.objectId];
	NSString *name = self.nameTextField.text;
	NSString *telphone = self.telTextField.text;
	NSString *address = self.addTextField.text;
	[addObject removeObjectsInArray:@[@{@"name":name,@"phone":telphone,@"address":address}] forKey:@"addressArray"];
	[addObject updateInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
		if (isSuccessful) {
			[self.navigationController popViewControllerAnimated:YES];
		}else{
			[DIALOG alert:@"删除失败"];
		}
	}];
}
- (IBAction)save:(UIBarButtonItem *)sender {
	BmobObject *addObject = [BmobObject objectWithoutDataWithClassName:@"_User" objectId:self.user.objectId];
	if (self.nameTextField.text.length == 0 || self.telTextField.text.length == 0 || self.addTextField.text.length == 0) {
		[DIALOG alert:@"请正确填写收货信息"];
		return;
	}
	NSString *name = self.nameTextField.text;
	NSString *telphone = self.telTextField.text;
	NSString *address = self.addTextField.text;
	[addObject addUniqueObjectsFromArray:@[@{@"name":name,@"phone":telphone,@"address":address}] forKey:@"addressArray"];
	[addObject updateInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
		if (isSuccessful) {
			[self.navigationController popViewControllerAnimated:YES];
		}else
		{
			NSLog(@"添加失败");
		}
		if (error) {
			NSLog(@"%@",error);
		}
	}];
	

}

@end
