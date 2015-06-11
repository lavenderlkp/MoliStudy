//
//  NavigationView.h
//  StudyPage2.0
//
//  Created by lavender_molistudy on 15/6/2.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LeftArrow.h"

@interface NavigationView : UIView

@property (nonatomic, strong) LeftArrow *leftButton;
@property (nonatomic, strong) UILabel *rightLabel;
@property (nonatomic, strong) UIImageView *middleImage;
@property (nonatomic, strong) UILabel *middleTimer;

@end
