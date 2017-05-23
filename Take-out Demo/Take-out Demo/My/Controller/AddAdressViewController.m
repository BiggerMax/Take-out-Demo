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
	BmobUser *user = [BmobUser currentUser];
	BmobObject *addObject = [BmobObject objectWithoutDataWithClassName:@"_User" objectId:user.objectId];
	if (self.nameTextField.text.length == 0 || self.telTextField.text.length == 0 || self.addTextField.text.length == 0) {
		[DIALOG alert:@"请输入完整信息"];
		return;
	}
	NSString *name = self.nameTextField.text;
	NSString *telphone = self.telTextField.text;
	NSString *address = self.addTextField.text;
	//[addObject addUniqueObjectsFromArray:@[@{@"name":name,@"phone":telphone,@"address":address}] forKey:@"addressArray"];
	[addObject addObjectsFromArray:@[@{@"name":name,@"phone":telphone,@"address":address}] forKey:@"addressArray"];
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
