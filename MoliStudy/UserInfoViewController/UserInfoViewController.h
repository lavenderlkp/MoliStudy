//
//  UserInfoViewController.h
//  MoliStudy
//
//  Created by lavender_molistudy on 15/6/8.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftImageRightTextButton.h"
#import "JCRBlurView.h"
#import "StudyPageViewController.h"
#import "CalendarPageViewController.h"
#import "ReportViewController.h"
#import "StoreViewController.h"
#import "SetPageViewController.h"
#import "YanTuViewController.h"

@interface UserInfoViewController : UIViewController<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UILabel * UserName;
@property (nonatomic, strong) UILabel * coinNum;
@property (nonatomic, strong) UILabel * registerNum;

@property (nonatomic, strong) UIImageView *UserImage;

@property (nonatomic, strong) LeftImageRightTextButton *btnSet;
@property (nonatomic, strong) LeftImageRightTextButton *btnNight;
@property (nonatomic, strong) LeftImageRightTextButton *btnWay;

@property (nonatomic, strong) UITableView *funcTableView;
@property (nonatomic, strong) JCRBlurView *blurView;

@end
