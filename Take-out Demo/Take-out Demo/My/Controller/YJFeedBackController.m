//
//  YJFeedBackController.m
//  Take-out Demo
//
//  Created by 袁杰 on 2017/4/22.
//  Copyright © 2017年 袁杰. All rights reserved.
//

#import "YJFeedBackController.h"

@interface YJFeedBackController ()
@property (strong, nonatomic) IBOutlet UITextView *textView;

@end

@implementation YJFeedBackController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = @"意见反馈";
    self.navigationController.navigationBar.barStyle = UIBarStyleDefault;
    self.navigationController.navigationBar.hidden = FALSE;
}
- (IBAction)commitBtn:(UIBarButtonItem *)sender {
	BmobUser *user = [BmobUser currentUser];
	if (self.textView.text.length > 0) {
		BmobObject *object = [BmobObject objectWithClassName:@"Feedback"];
		[object setObject:user.username forKey:@"username"];
		[object setObject:self.textView.text forKey:@"content"];
		[object saveInBackgroundWithResultBlock:^(BOOL isSuccessful, NSError *error) {
			if (isSuccessful) {
				NSLog(@"%@",object);
				[DIALOG confirm:@"反馈成功，确认退出" callback:^(BOOL ok) {
					if (ok) {
						[self.navigationController popViewControllerAnimated:YES];
					}
				}];
			}else if (error){
				NSLog(@"%@",error);
			}else{
				NSLog(@"未知错误");
			}
		}];
	}
	
}

@end
