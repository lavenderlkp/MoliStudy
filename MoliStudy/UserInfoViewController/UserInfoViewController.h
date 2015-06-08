//
//  UserInfoViewController.h
//  MoliStudy
//
//  Created by lavender_molistudy on 15/6/8.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftImageRightTextButton.h"

@interface UserInfoViewController : UIViewController

@property (nonatomic, strong) UILabel * UserName;
@property (nonatomic, strong) UILabel * coinNum;
@property (nonatomic, strong) UILabel * registerNum;

@property (nonatomic, strong) UIImageView *UserImage;

@property (nonatomic, strong) LeftImageRightTextButton *btnFirst;
@property (nonatomic, strong) LeftImageRightTextButton *btnSecond;
@property (nonatomic, strong) LeftImageRightTextButton *btnThird;
@property (nonatomic, strong) LeftImageRightTextButton *btnForth;
@property (nonatomic, strong) LeftImageRightTextButton *btnSet;
@property (nonatomic, strong) LeftImageRightTextButton *btnNight;
@property (nonatomic, strong) LeftImageRightTextButton *btnWay;

@end
