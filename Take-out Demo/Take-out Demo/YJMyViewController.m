//
//  YJMyViewController.m
//  Take-out Demo
//
//  Created by 袁杰 on 16/12/20.
//  Copyright © 2016年 袁杰. All rights reserved.
//

#import "YJMyViewController.h"
#import "YJMyHeadView.h"
#import "YJOrderHeadView.h"
#import "YJMenuView.h"
#import "YJFooterBannerData.h"
#import "YJScrollPageView.h"
#import "YJLoginViewController.h"
#import "OneKit.h"
#import "YJSettingController.h"
#import "YJMyOrderingController.h"
#import "MyAdressViewController.h"
#import "AppDelegate.h"
#import "YJFeedBackController.h"
@interface YJMyViewController ()
@property(nonatomic,strong)NSArray *orderArr;
@property(nonatomic,strong)NSArray *mineArr;
@property(nonatomic,strong)UIView *mainScrollView;
@property(nonatomic,strong)UIView *footerView;
@property UIImage *avartar;
@property UIButton *avartarBtn;
@property UIButton *nameBtn;
@property NSInteger viewTag;
@property(nonatomic,strong)UIImageView *mainHeadView;
@property AppDelegate *delegate;
@end

@implementation YJMyViewController

-(NSArray *)orderArr{
    if (!_orderArr) {
        _orderArr = @[
                      [YJTitleIconAction titleIconWithTitle:@"待支付" icon:[UIImage imageNamed:@"icon_daifukuan"] controller:nil tag:0],
                      [YJTitleIconAction titleIconWithTitle:@"待收货" icon:[UIImage imageNamed:@"icon_daishouhuo"] controller:nil tag:1],
                      [YJTitleIconAction titleIconWithTitle:@"待评价" icon:[UIImage imageNamed:@"icon_daipingjia"] controller:nil tag:2],
                      [YJTitleIconAction titleIconWithTitle:@"退款/售后" icon:[UIImage imageNamed:@"icon_tuikuan"] controller:nil tag:3],
                      ];
    }
    return _orderArr;
}
- (NSArray *)mineArr{
    if (!_mineArr) {
        _mineArr = @[
                     [YJTitleIconAction titleIconWithTitle:@"收货地址" icon:[UIImage imageNamed:@"v2_my_address_icon-1"] controller:nil tag:201],
                     [YJTitleIconAction titleIconWithTitle:@"意见反馈" icon:[UIImage imageNamed:@"v2_my_feedback_icon-1"] controller:nil tag:202],
                     [YJTitleIconAction titleIconWithTitle:@"分享给朋友" icon:[UIImage imageNamed:@"v2_my_share_icon-1"] controller:nil tag:0],
                     [YJTitleIconAction titleIconWithTitle:@"帮助中心" icon:[UIImage imageNamed:@"icon_help"] controller:nil tag:0],
                       ];
    }
    return _mineArr;
}
- (void)viewDidLoad {
    [super viewDidLoad];
	//[self updateProfile];
    [self setHeaderView];
    [self buildScrollView];
    [self buildFooterView];
}
-(void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	[self updateProfile];
}
-(void)buildScrollView{
    self.mainScrollView = [[UIView alloc] initWithFrame:CGRectMake(0, 150, self.view.frame.size.width, self.view.frame.size.height-49-150)];
    self.mainScrollView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.mainScrollView];
    
    [self.mainScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.view).offset(150);
        make.leading.trailing.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(49);
    }];
    //
    UIView *contenView = [[UIView alloc] init];
    contenView.backgroundColor = [UIColor colorWithRed:0.94 green:0.94 blue:0.94 alpha:1.00];
    [self.mainScrollView addSubview:contenView];
    [contenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.mainScrollView);
        make.width.equalTo(self.mainScrollView);
    }];
    //
    YJOrderHeadView *orderHeadView = [[YJOrderHeadView alloc] init];
    [orderHeadView setTag:101];
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapView:tag:)];
    [orderHeadView addGestureRecognizer:tapGesture];
    //orderHeadView.backgroundColor = [UIColor redColor];
    [self.mainScrollView addSubview:orderHeadView];
    [orderHeadView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mainScrollView).offset(10);
        make.leading.trailing.equalTo(self.mainScrollView);
        make.height.mas_equalTo(40);
    }];
    //
    YJMenuView *orderMenuView = [[YJMenuView alloc] initMenu:self.orderArr withLine:NO];
	orderMenuView.callback = ^(NSInteger tag) {
		[self creatViewByTag:tag];
	};
   // orderMenuView.backgroundColor = [UIColor redColor];
    YJMenuView *mineMenView = [[YJMenuView alloc] initMenu:self.mineArr withLine:YES];
    mineMenView.callback = ^(NSInteger tag){
        [self creatViewByTag:tag];
    };
   // mineMenView.backgroundColor = [UIColor yellowColor];
    [contenView addSubview:orderMenuView];
    [contenView addSubview:mineMenView];
    
    [orderMenuView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(orderHeadView.mas_bottom).offset(5);
        make.leading.trailing.equalTo(contenView);
        make.height.mas_equalTo(75);
    }];
    [mineMenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(orderMenuView.mas_bottom).offset(10);
        make.leading.trailing.equalTo(contenView);
        make.height.mas_equalTo(100);
    }];
    _footerView = [[UIView alloc] init];
   // _footerView.backgroundColor = [UIColor redColor];
    [contenView addSubview:_footerView];
    
    [_footerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(mineMenView.mas_bottom).offset(20);
        make.leading.trailing.equalTo(contenView);
        make.bottom.equalTo(self.view).offset(-49);
       // make.height.mas_equalTo(150);
    }];
    [contenView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(_footerView);
    }];
    
}

-(void)buildFooterView{
    [YJFooterBannerData loadFooterBannerData:^(id data, NSError *error) {
        NSMutableArray *imageUrl = [NSMutableArray array];
//        [data enumerateObjectsUsingBlock:^(YJActivity  *_Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
//            [imageUrl addObject:obj[idx]];
//        }];
        imageUrl = data;
        YJScrollPageView *page = [YJScrollPageView pageController:imageUrl placeHolderImage:[UIImage imageNamed:@"v2_placeholder_full_size"]];
        [self.footerView addSubview:page];
        //
        [page mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(self.footerView);
            make.leading.equalTo(self.footerView).offset(5);
            make.trailing.equalTo(self.footerView).offset(-5);
            make.centerY.equalTo(self.footerView);
            make.height.equalTo(self.footerView).offset(-10);
           // make.height.mas_equalTo(self.footerView.mas_width).multipliedBy(0.37);
        }];
    }];
}
-(void)loadView{
    [super loadView];
    self.navigationController.navigationBar.hidden = YES;
}
-(void)setHeaderView{
    self.mainHeadView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 150)];
    self.mainHeadView.image = [UIImage imageNamed:@"v2_my_avatar_bg"];
    self.mainHeadView.userInteractionEnabled = YES;
    
    UIButton *settingBtn = [[UIButton alloc] init];
    [settingBtn setImage:[UIImage imageNamed:@"v2_my_settings_icon"] forState:UIControlStateNormal];
    [settingBtn addTarget:self action:@selector(settingClicked) forControlEvents:UIControlEventTouchUpInside];
    [_mainHeadView addSubview:settingBtn];
    [settingBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(_mainHeadView).offset(10);
        make.trailing.equalTo(_mainHeadView).offset(5);
        make.width.and.height.mas_equalTo(50);
    }];
    
    _avartarBtn = [UIButton new];
    _avartarBtn.imageView.layer.cornerRadius = 35;
    _avartar = [UIImage imageNamed:@"v2_my_avatar"];
    [_avartarBtn setImage:_avartar forState:UIControlStateNormal];
    [_avartarBtn addTarget:self action:@selector(changeAvatar) forControlEvents:UIControlEventTouchUpInside];
    [_mainHeadView addSubview:_avartarBtn];
    [_avartarBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_mainHeadView);
        make.leading.mas_equalTo(10);
        make.width.and.height.mas_equalTo(70);
        make.top.equalTo(_mainHeadView).offset(40);
    }];
    
    _nameBtn = [UIButton new];
    [_nameBtn setTitle:@"注册或登录" forState:UIControlStateNormal];
    [_nameBtn setTintColor:[UIColor whiteColor]];
    [_nameBtn addTarget:self action:@selector(login) forControlEvents:UIControlEventTouchUpInside];
    [_mainHeadView addSubview:_nameBtn];
    [_nameBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(_avartarBtn.mas_centerY);
        make.left.equalTo(_avartarBtn.mas_right).offset(5);
        // make.top.equalTo(avatarView);
        make.height.mas_equalTo(@30);
    }];
    
//    [headerView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.leading.and.trailing.equalTo(self.view);
//        make.height.mas_equalTo(150);
//    }];
    [self.view addSubview:_mainHeadView];
    
}
-(void)changeAvatar{
    BmobObject *obj = [[BmobObject alloc] initWithClassName:@"User"];
    [DIALOG chooseWithTitles:@[@"拍照",@"相册"] callback:^(int index) {
        switch (index) {
            case 1:
            {
                [CAMERA openCamera:self edit:NO callback:^(UIImage *image) {
                    [_avartarBtn setImage:image forState:UIControlStateNormal];
                    BmobFile *file = [[BmobFile alloc] initWithFileName:@"avatar" withFileData:UIImagePNGRepresentation(image)];
                    [file saveInBackground:^(BOOL isSuccessful, NSError *error) {
                        if (isSuccessful) {
                            [obj setObject:file  forKey:@"avatar"];
                            //此处相当于新建一条记录,         //关联至已有的记录请使用 [obj updateInBackground];
                            [obj updateInBackground];
                        }else{
                            //进行处理
                        }
                    }];
                }];
            }
                break;
            case 2:
            {
                [CAMERA openGallery:self edit:NO callback:^(UIImage *image) {
                    [_avartarBtn setImage:image forState:UIControlStateNormal];
                    BmobFile *file = [[BmobFile alloc] initWithFileName:@"avatar" withFileData:UIImagePNGRepresentation(image)];
                    [file saveInBackground:^(BOOL isSuccessful, NSError *error) {
                        if (isSuccessful) {
                            [obj setObject:file  forKey:@"filetype"];
                            //此处相当于新建一条记录,         //关联至已有的记录请使用 [obj updateInBackground];
                            [obj saveInBackground];
                        }else{
                            //进行处理
                        }
                    }];

                }];
            }
                break;
            default:
                break;
        }
    }];
}
-(void)login{
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YJLoginViewController *loginViewController = [storyboard instantiateViewControllerWithIdentifier:@"YJLoginViewController"];
    UINavigationController *navigatinCotroller = [[UINavigationController alloc] initWithRootViewController:loginViewController];
    [self presentViewController:navigatinCotroller animated:YES completion:nil];
}
-(void)updateProfile{
	BmobUser *user = [BmobUser currentUser];
	if (user) {
		_nameBtn.enabled = false;
		[_nameBtn setTitle:user.username forState:UIControlStateDisabled];
	}
//    [MESSAGE receiveMessage:@"USERNAME" callback:^(NSDictionary *data) {
//        if (!data) {
//            return ;
//        }
//        _nameBtn.enabled = false;
//        [_nameBtn setTitle:data[@"userName"] forState:UIControlStateDisabled];
//    }];
}
//
-(void)settingClicked
{
    //UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
    YJSettingController *settingViewController = [STORYBOARD instantiateViewControllerWithIdentifier:@"YJSettingController"];
    settingViewController.hidesBottomBarWhenPushed = YES;
//    UINavigationController *navigatinCotroller = [[UINavigationController alloc] initWithRootViewController:settingViewController];
    [self.navigationController pushViewController:settingViewController animated:YES];
}
-(void)tapView:(UITapGestureRecognizer*)tap tag:(NSInteger)tag{
    switch ([tap view].tag) {
        case 101:
        {
            
            YJMyOrderingController *orderingVC = [STORYBOARD instantiateViewControllerWithIdentifier:@"YJMyOrderingController"];
            [self.navigationController pushViewController:orderingVC animated:YES];
        }
            break;
        default:
            break;
    }
}
-(void)creatViewByTag:(NSInteger)tag
{
    switch (tag) {
        case 201:
        {
            MyAdressViewController *addressVC = [[MyAdressViewController alloc] init];
            [addressVC setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:addressVC animated:YES];
                    }
            break;
         case 202:
        {
            YJFeedBackController *feedbackVC = [STORYBOARD instantiateViewControllerWithIdentifier:@"YJFeedBackController"];
            [self.navigationController pushViewController:feedbackVC animated:YES];
        }
            break;
        default:
            break;
    }
}
@end
