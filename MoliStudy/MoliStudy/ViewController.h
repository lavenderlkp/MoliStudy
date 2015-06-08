//
//  ViewController.h
//  MoliStudy
//
//  Created by lavender_molistudy on 15/6/7.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BusinessLogicLayer.h"
#import "PersistenceLayer.h"
#import "SWRevealViewController.h"
#import "JCRBlurView.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) JCRBlurView *blurView;
@property (nonatomic, strong) SWRevealViewController * revealController;
@property (nonatomic, strong) UINavigationBar * naviBar;
@property (nonatomic, strong) UIView * PredictView;
@property (nonatomic, strong) UIView * RememberRateView;
@property (nonatomic, strong) UIView * CostNeedsView;

@property (nonatomic, strong) UILabel * gradeLabel;
@property (nonatomic, strong) UILabel * DaoJiShiNum;
@property (nonatomic, strong) UILabel * ShuaTiNum;
@property (nonatomic, strong) UILabel * CorrectRateNum;
@property (nonatomic, strong) UILabel * CurrentRemRateNum;
@property (nonatomic, strong) UILabel * RegisterNum;
@property (nonatomic, strong) UILabel * RegisterCardOrNot;
@property (nonatomic, strong) UILabel * NeedCostNum;
@property (nonatomic, strong) UILabel * TestCanOrNot;

@property (nonatomic, strong) UIButton * firstInfoBtn;
@property (nonatomic, strong) UIButton * secondInfoBtn;
@property (nonatomic, strong) UIProgressView * progressBar;
@property (nonatomic, strong) UIButton * startStudyBtn;
@property (nonatomic, strong) UIButton * startTestBtn;


@end

