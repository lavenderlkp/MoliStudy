//
//  ViewController.m
//  MoliStudy
//
//  Created by lavender_molistudy on 15/6/7.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _revealController = [self revealViewController];
    [_revealController panGestureRecognizer];
    [_revealController tapGestureRecognizer];
    self.view.backgroundColor = [UIColor whiteColor];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.naviBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, 10.0/107.0f * screenRect.size.height)];
    self.naviBar.barTintColor = [UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:1.0f];
    [self.view addSubview:self.naviBar];
    self.naviBar.translucent = NO;
    UINavigationItem *naviItem = [[UINavigationItem alloc] init];
    
    UIButton *customLeftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *leftBtnImage = [UIImage imageNamed:@"RevealBtn"];
    customLeftBtn.frame = CGRectMake(0, 0, leftBtnImage.size.width, leftBtnImage.size.height);
    [customLeftBtn setImageEdgeInsets:UIEdgeInsetsMake(2, 2, 2, 2)];
    [customLeftBtn setImage:leftBtnImage forState:UIControlStateNormal];
    [customLeftBtn addTarget:self action:@selector(revealToNextPage) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *revealBtn = [[UIBarButtonItem alloc] initWithCustomView:customLeftBtn];
    naviItem.leftBarButtonItem = revealBtn;
    [self.naviBar pushNavigationItem:naviItem animated:YES];
    
    
    self.PredictView = [[UIView alloc] initWithFrame:CGRectMake(0, self.naviBar.frame.size.height, screenRect.size.width, 30.0/107.0f * screenRect.size.height)];
    self.PredictView.backgroundColor = [UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:1.0f];
    self.PredictView.layer.borderColor = [UIColor colorWithWhite:0.5f alpha:0.6f].CGColor;
    self.PredictView.layer.borderWidth = 0.5f;
    [self.view addSubview:self.PredictView];
    
    UILabel *scoreTitle = [[UILabel alloc] initWithFrame:CGRectMake(3.0/60.0f * screenRect.size.width, 5.0/107.0f * screenRect.size.height, 7.0/60.0f * screenRect.size.width, 2.4f/107.0f * screenRect.size.height)];
    scoreTitle.lineBreakMode = NSLineBreakByWordWrapping;
    scoreTitle.numberOfLines = 1;
    scoreTitle.adjustsFontSizeToFitWidth = YES;
    scoreTitle.textColor = [UIColor whiteColor];
    scoreTitle.text = @"预测分";
    scoreTitle.font = [UIFont fontWithName:nil size:10.0/300.0f * screenRect.size.width];
    scoreTitle.textAlignment = NSTextAlignmentCenter;
    [self.PredictView addSubview:scoreTitle];
    
    self.gradeLabel = [[UILabel alloc] initWithFrame:CGRectMake(24.0/60.0f * screenRect.size.width, 3.5/107.0f * screenRect.size.height, 13.5/60.0f * screenRect.size.width, 11.5/107.0f * screenRect.size.height)];
    self.gradeLabel.numberOfLines = 1;
    self.gradeLabel.adjustsFontSizeToFitWidth = YES;
    self.gradeLabel.textColor = [UIColor whiteColor];
    self.gradeLabel.text = @"71";
    self.gradeLabel.font = [UIFont fontWithName:nil size:13.5/60.0f * screenRect.size.width];
    self.gradeLabel.textAlignment = NSTextAlignmentCenter;
    [self.PredictView addSubview:self.gradeLabel];
    
    UILabel *gradeName = [[UILabel alloc] initWithFrame:CGRectMake(54.0/60.0f * screenRect.size.width, 13.0/107.0f * screenRect.size.height, 2.8/60.0f * screenRect.size.width, 2.5/107.0f * screenRect.size.height)];
    gradeName.numberOfLines = 1;
    gradeName.adjustsFontSizeToFitWidth = YES;
    gradeName.textAlignment = NSTextAlignmentCenter;
    gradeName.textColor = [UIColor whiteColor];
    gradeName.text = @"分";
    gradeName.font = [UIFont fontWithName:nil size:12.0/300.0f * screenRect.size.width];
    [self.PredictView addSubview:gradeName];
    
    UILabel *DaoJiShi = [[UILabel alloc] initWithFrame:CGRectMake(6.8/60.0f * screenRect.size.width, 21.5/107.0f * screenRect.size.height, 8.2/60.0f * screenRect.size.width, 2.4/107.0f * screenRect.size.height)];
    DaoJiShi.numberOfLines = 1;
    DaoJiShi.textAlignment = NSTextAlignmentCenter;
    DaoJiShi.textColor = [UIColor whiteColor];
    DaoJiShi.adjustsFontSizeToFitWidth = YES;
    DaoJiShi.text = @"距离考研";
    DaoJiShi.font = [UIFont fontWithName:nil size:11.0/300.0f * screenRect.size.width];
    [self.PredictView addSubview:DaoJiShi];
    
    UILabel *ShuaTi = [[UILabel alloc] initWithFrame:CGRectMake(27.0/60.0 * screenRect.size.width, 21.5/107.0f * screenRect.size.height, 6.0/60.0f * screenRect.size.width, 2.4/107.0 * screenRect.size.height)];
    ShuaTi.numberOfLines = 1;
    ShuaTi.textAlignment = NSTextAlignmentCenter;
    ShuaTi.textColor = [UIColor whiteColor];
    ShuaTi.text = @"刷题量";
    ShuaTi.font = [UIFont fontWithName:nil size:11.0/300.0f * screenRect.size.width];
    ShuaTi.adjustsFontSizeToFitWidth = YES;
    [self.PredictView addSubview:ShuaTi];
    
    UILabel *CorrectRate = [[UILabel alloc] initWithFrame:CGRectMake(46.5/60.0f *screenRect.size.width, 21.5/107.0f * screenRect.size.height, 6.0/60.0f * screenRect.size.width, 2.4/107.0 * screenRect.size.height)];
    CorrectRate.numberOfLines = 1;
    CorrectRate.textAlignment = NSTextAlignmentCenter;
    CorrectRate.textColor = [UIColor whiteColor];
    CorrectRate.text = @"正确率";
    CorrectRate.font = [UIFont fontWithName:nil size:11.0/300.0f * screenRect.size.width];
    CorrectRate.adjustsFontSizeToFitWidth = YES;
    [self.PredictView addSubview:CorrectRate];
    
    self.DaoJiShiNum = [[UILabel alloc] initWithFrame:CGRectMake(6.8/60.0f * screenRect.size.width, 25.0/107.0f * screenRect.size.height, 8.2/60.0f * screenRect.size.width, 2.4/107.0f * screenRect.size.height)];
    self.DaoJiShiNum.numberOfLines = 1;
    self.DaoJiShiNum.textAlignment = NSTextAlignmentCenter;
    self.DaoJiShiNum.textColor = [UIColor whiteColor];
    self.DaoJiShiNum.text = @"67";
    self.DaoJiShiNum.font = [UIFont fontWithName:nil size:11.0/300.0f * screenRect.size.width];
    self.DaoJiShiNum.adjustsFontSizeToFitWidth = YES;
    [self.PredictView addSubview:self.DaoJiShiNum];
    
    self.ShuaTiNum = [[UILabel alloc] initWithFrame:CGRectMake(27.0/60.0 * screenRect.size.width, 25.0/107.0f * screenRect.size.height, 6.0/60.0f * screenRect.size.width, 2.4/107.0 * screenRect.size.height)];
    self.ShuaTiNum.numberOfLines = 1;
    self.ShuaTiNum.textAlignment = NSTextAlignmentCenter;
    self.ShuaTiNum.textColor = [UIColor whiteColor];
    self.ShuaTiNum.text = @"35";
    self.ShuaTiNum.font = [UIFont fontWithName:nil size:11.0/300.0f * screenRect.size.width];
    self.ShuaTiNum.adjustsFontSizeToFitWidth = YES;
    [self.PredictView addSubview:self.ShuaTiNum];
    
    self.CorrectRateNum = [[UILabel alloc] initWithFrame:CGRectMake(46.5/60.0f *screenRect.size.width, 25.0/107.0f * screenRect.size.height, 6.0/60.0f * screenRect.size.width, 2.4/107.0 * screenRect.size.height)];
    self.CorrectRateNum.numberOfLines = 1;
    self.CorrectRateNum.textAlignment = NSTextAlignmentCenter;
    self.CorrectRateNum.textColor = [UIColor whiteColor];
    self.CorrectRateNum.text = @"2%";
    self.CorrectRateNum.font = [UIFont fontWithName:nil size:11.0/300.0f * screenRect.size.width];
    self.CorrectRateNum.adjustsFontSizeToFitWidth = YES;
    [self.PredictView addSubview:self.CorrectRateNum];
    
    UIView *Interval1 = [[UIView alloc] initWithFrame:CGRectMake(21.0/60.0f * screenRect.size.width, 22.0/107.0f * screenRect.size.height, 0.08/60.0f * screenRect.size.width, 5.0/107.0f * screenRect.size.height)];
    Interval1.backgroundColor = [UIColor whiteColor];
    [self.PredictView addSubview:Interval1];
    
    UIView *Interval2 = [[UIView alloc] initWithFrame:CGRectMake(40.0/60.0f * screenRect.size.width, 22.0/107.0f * screenRect.size.height, 0.08/60.0f * screenRect.size.width, 5.0/107.0f * screenRect.size.height)];
    Interval2.backgroundColor = [UIColor whiteColor];
    [self.PredictView addSubview:Interval2];
    

    
    self.RememberRateView = [[UIView alloc] initWithFrame:CGRectMake(0, self.naviBar.frame.size.height + self.PredictView.frame.size.height, screenRect.size.width, 33.0/107.0f * screenRect.size.height)];
    self.RememberRateView.backgroundColor = [UIColor colorWithWhite:0.87f alpha:1.0f];
    self.RememberRateView.layer.borderColor = [UIColor colorWithWhite:0.7f alpha:1.0f].CGColor;
    self.RememberRateView.layer.borderWidth = 0.5f;
    [self.view addSubview:self.RememberRateView];
    
    UILabel *CurrentRemRate = [[UILabel alloc] initWithFrame:CGRectMake(3.0/60.0f * screenRect.size.width, 5.0/107.0f * screenRect.size.height, 11.0/60.0f * screenRect.size.width, 2.4f/107.0f * screenRect.size.height)];
    CurrentRemRate.numberOfLines = 1;
    CurrentRemRate.adjustsFontSizeToFitWidth = YES;
    CurrentRemRate.textAlignment = NSTextAlignmentCenter;
    //这个色号不对，需要修改
    CurrentRemRate.textColor = [UIColor colorWithRed:(150.0f/255.0f) green:(180.0f/255.0f) blue:(140.0f/255.0f) alpha:1.0f];
    CurrentRemRate.text = @"当前记忆率";
    CurrentRemRate.font = [UIFont fontWithName:nil size:11.0/300.0f * screenRect.size.width];
    [self.RememberRateView addSubview:CurrentRemRate];
    
    self.CurrentRemRateNum = [[UILabel alloc] initWithFrame:CGRectMake(25.0/60.0 * screenRect.size.width, 9.0/107.0f * screenRect.size.height, 11.0/60.0f * screenRect.size.width, 7.5f/107.0f * screenRect.size.height)];
    self.CurrentRemRateNum.numberOfLines = 1;
    self.CurrentRemRateNum.adjustsFontSizeToFitWidth = YES;
    self.CurrentRemRateNum.textAlignment = NSTextAlignmentCenter;
    //这个色号不对，需要修改
    self.CurrentRemRateNum.textColor = [UIColor colorWithRed:(150.0f/255.0f) green:(180.0f/255.0f) blue:(140.0f/255.0f) alpha:1.0f];
    self.CurrentRemRateNum.text = @"38";
    self.CurrentRemRateNum.font = [UIFont fontWithName:nil size:11.0/65.0f * screenRect.size.width];
    [self.RememberRateView addSubview:self.CurrentRemRateNum];
    
    UILabel *PercentLabel = [[UILabel alloc] initWithFrame:CGRectMake(54.0/60.0f * screenRect.size.width, 14.0/107.0f * screenRect.size.height, 3.0/60.0f * screenRect.size.width, 2.4/107.0f * screenRect.size.height)];
    PercentLabel.numberOfLines = 1;
    PercentLabel.adjustsFontSizeToFitWidth = YES;
    PercentLabel.textAlignment = NSTextAlignmentCenter;
    //这个色号不对，需要修改
    PercentLabel.textColor = [UIColor colorWithRed:(150.0f/255.0f) green:(180.0f/255.0f) blue:(140.0f/255.0f) alpha:1.0f];
    PercentLabel.text = @"%";
    PercentLabel.font = [UIFont fontWithName:nil size:13.0/300.0f * screenRect.size.width];
    [self.RememberRateView addSubview:PercentLabel];
    
    self.firstInfoBtn = [[UIButton alloc] initWithFrame:CGRectMake(54.0/60.0f * screenRect.size.width, 4.5/107.0f * screenRect.size.height, 3.0/60.0f * screenRect.size.width, 3.0/107.0f * screenRect.size.height)];
    UIImage *image = [UIImage imageNamed:@"InfoBtn"];
    [self.firstInfoBtn setImage:image forState:UIControlStateNormal];
    //点击光亮遮住中间部分
    self.firstInfoBtn.showsTouchWhenHighlighted=YES;
    [self.RememberRateView addSubview:self.firstInfoBtn];
    [self.firstInfoBtn addTarget:self action:@selector(firstInfoBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *TodayLabel = [[UILabel alloc] initWithFrame:CGRectMake(12.0/60.0f * screenRect.size.width, 20.0/107.0f * screenRect.size.height, 4.5/60.0 * screenRect.size.width, 2.4/107.0f *screenRect.size.height)];
    TodayLabel.numberOfLines = 1;
    TodayLabel.adjustsFontSizeToFitWidth = YES;
    TodayLabel.textAlignment = NSTextAlignmentCenter;
    //这个色号不对，需要修改
    TodayLabel.textColor = [UIColor colorWithRed:(150.0f/255.0f) green:(180.0f/255.0f) blue:(140.0f/255.0f) alpha:1.0f];
    TodayLabel.text = @"今日";
    TodayLabel.font = [UIFont fontWithName:nil size:13.0/300.0f * screenRect.size.width];
    [self.RememberRateView addSubview:TodayLabel];
    
    self.progressBar = [[UIProgressView alloc] initWithFrame:CGRectMake(19.0/60.0f * screenRect.size.width, 21.3/107.0f * screenRect.size.height, 14.0/60.0f * screenRect.size.width, 0.6/107.0f * screenRect.size.height)];
    self.progressBar.progressTintColor = [UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:1.0f];
    //某个事件可以出发进度条变化
    [self.progressBar setProgress:0.7f];
    [self.RememberRateView addSubview:self.progressBar];
    
    self.RegisterNum = [[UILabel alloc] initWithFrame:CGRectMake(34.0/60.0f * screenRect.size.width, 20.4/107.0f * screenRect.size.height, 5.0/60.0f * screenRect.size.width, 2.1/107.0f * screenRect.size.height)];
    self.RegisterNum.numberOfLines = 1;
    self.RegisterNum.adjustsFontSizeToFitWidth = YES;
    self.RegisterNum.textAlignment = NSTextAlignmentCenter;
    //这个色号不对，需要修改
    self.RegisterNum.textColor = [UIColor colorWithRed:(150.0f/255.0f) green:(180.0f/255.0f) blue:(140.0f/255.0f) alpha:1.0f];
    self.RegisterNum.text = @"7/10";
    self.RegisterNum.font = [UIFont fontWithName:nil size:10.0/300.0f * screenRect.size.width];
    [self.RememberRateView addSubview:self.RegisterNum];
    
    self.RegisterCardOrNot = [[UILabel alloc] initWithFrame:CGRectMake(44.0/60.0f * screenRect.size.width, 20.0/107.0f * screenRect.size.height, 6.8/60.0 * screenRect.size.width, 2.4/107.0f *screenRect.size.height)];
    self.RegisterCardOrNot.numberOfLines = 1;
    self.RegisterCardOrNot.adjustsFontSizeToFitWidth = YES;
    self.RegisterCardOrNot.textAlignment = NSTextAlignmentCenter;
    //这个色号不对，需要修改
    self.RegisterCardOrNot.textColor = [UIColor colorWithRed:(150.0f/255.0f) green:(180.0f/255.0f) blue:(140.0f/255.0f) alpha:1.0f];
    self.RegisterCardOrNot.text = @"未打卡";
    self.RegisterCardOrNot.font = [UIFont fontWithName:nil size:12.0/300.0f * screenRect.size.width];
    [self.RememberRateView addSubview:self.RegisterCardOrNot];
    
    self.startStudyBtn = [[UIButton alloc] initWithFrame:CGRectMake(2.8/60.0f * screenRect.size.width, 24.0/107.0 * screenRect.size.height, 54.5/60.0 * screenRect.size.width, 6.6/107.0f * screenRect.size.height)];
    self.startStudyBtn.backgroundColor = [UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:1.0f];
    [self.startStudyBtn setTitle:@"开始学习" forState:UIControlStateNormal];
    self.startStudyBtn.tintColor = [UIColor whiteColor];
    [self.startStudyBtn addTarget:self action:@selector(startLearningPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.RememberRateView addSubview:self.startStudyBtn];
    
    
    CGFloat PreviousHeightForCostNeeds = self.naviBar.frame.size.height + self.PredictView.frame.size.height + self.RememberRateView.frame.size.height;
    self.CostNeedsView  = [[UIView alloc] initWithFrame:CGRectMake(0, PreviousHeightForCostNeeds, screenRect.size.width, screenRect.size.height - PreviousHeightForCostNeeds)];
    self.CostNeedsView.backgroundColor = [UIColor colorWithWhite:0.87f alpha:1.0f];
    [self.view addSubview:self.CostNeedsView];
    
    UILabel *NeedsCostLabel = [[UILabel alloc] initWithFrame:CGRectMake(3.0/60.0f * screenRect.size.width, 5.5/107.0 * screenRect.size.height, 8.5/60.0 * screenRect.size.width, 2.1/107.0f * screenRect.size.height)];
    NeedsCostLabel.numberOfLines = 1;
    NeedsCostLabel.adjustsFontSizeToFitWidth = YES;
    NeedsCostLabel.textAlignment = NSTextAlignmentCenter;
    //这个色号不对，需要修改
    NeedsCostLabel.textColor = [UIColor colorWithRed:(150.0f/255.0f) green:(180.0f/255.0f) blue:(140.0f/255.0f) alpha:1.0f];
    NeedsCostLabel.text = @"需要花费";
    NeedsCostLabel.font = [UIFont fontWithName:nil size:11.0/300.0f * screenRect.size.width];
    [self.CostNeedsView addSubview:NeedsCostLabel];
    
    self.NeedCostNum = [[UILabel alloc] initWithFrame:CGRectMake(24.0/60.0f * screenRect.size.width, 9.0/107.0f * screenRect.size.height, 15.0/60.0f * screenRect.size.width, 7.5/107.0f * screenRect.size.height)];
    self.NeedCostNum.numberOfLines = 1;
    self.NeedCostNum.adjustsFontSizeToFitWidth = YES;
    self.NeedCostNum.textAlignment = NSTextAlignmentCenter;
    NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:@"15/14"];
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:11.0/65.0f * screenRect.size.width] range:NSMakeRange(0, 2)];
    [attributedStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15.0/300.0f * screenRect.size.width] range:NSMakeRange(2, 3)];
    //这个色号不对，需要修改
    [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:(150.0f/255.0f) green:(180.0f/255.0f) blue:(140.0f/255.0f) alpha:1.0f] range:NSMakeRange(0, 5)];
    self.NeedCostNum.attributedText = attributedStr;
    [self.CostNeedsView addSubview:self.NeedCostNum];
    
    self.secondInfoBtn = [[UIButton alloc] initWithFrame:CGRectMake(54.0/60.0f * screenRect.size.width, 4.5/107.0f * screenRect.size.height, 3.0/60.0f * screenRect.size.width, 3.0/107.0f * screenRect.size.height)];
    //UIImage *image = [UIImage imageNamed:@"1"];
    [self.secondInfoBtn setImage:image forState:UIControlStateNormal];
    //点击光亮遮住中间部分
    self.secondInfoBtn.showsTouchWhenHighlighted=YES;
    [self.CostNeedsView addSubview:self.secondInfoBtn];
    [self.secondInfoBtn addTarget:self action:@selector(secondInfoBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    
    UILabel *MoliCoinLabel = [[UILabel alloc] initWithFrame:CGRectMake(50.0/60.0f * screenRect.size.width, 14.6/107.0f * screenRect.size.height, 7.5/60.0f * screenRect.size.width, 2.2/107.0f * screenRect.size.height)];
    MoliCoinLabel.numberOfLines = 1;
    MoliCoinLabel.adjustsFontSizeToFitWidth = YES;
    MoliCoinLabel.textAlignment = NSTextAlignmentCenter;
    //这个色号不对，需要修改
    MoliCoinLabel.textColor = [UIColor colorWithRed:(150.0f/255.0f) green:(180.0f/255.0f) blue:(140.0f/255.0f) alpha:1.0f];
    MoliCoinLabel.text = @"魔力币";
    MoliCoinLabel.font = [UIFont fontWithName:nil size:13.0/300.0f * screenRect.size.width];
    [self.CostNeedsView addSubview:MoliCoinLabel];
    
    self.TestCanOrNot = [[UILabel alloc] initWithFrame:CGRectMake(24.0/60.0f * screenRect.size.width, 19.5/107.0f * screenRect.size.height, 12.0/60.0f * screenRect.size.width, 2.0/107.0f * screenRect.size.height)];
    self.TestCanOrNot.numberOfLines = 1;
    self.TestCanOrNot.adjustsFontSizeToFitWidth = YES;
    self.TestCanOrNot.textAlignment = NSTextAlignmentCenter;
    //这个色号不对，需要修改
    self.TestCanOrNot.textColor = [UIColor colorWithRed:(150.0f/255.0f) green:(180.0f/255.0f) blue:(140.0f/255.0f) alpha:1.0f];
    self.TestCanOrNot.text = @"不推荐测试";
    self.TestCanOrNot.font = [UIFont fontWithName:nil size:11.0/300.0f * screenRect.size.width];
    [self.CostNeedsView addSubview:self.TestCanOrNot];
    
    self.startTestBtn = [[UIButton alloc] initWithFrame:CGRectMake(2.8/60.0f * screenRect.size.width, 24.0/107.0 * screenRect.size.height, 54.5/60.0 * screenRect.size.width, 6.6/107.0f * screenRect.size.height)];
    self.startTestBtn.backgroundColor = [UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:1.0f];
    [self.startTestBtn setTitle:@"开始测试" forState:UIControlStateNormal];
    self.startTestBtn.tintColor = [UIColor whiteColor];
    [self.startTestBtn addTarget:self action:@selector(startTestPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.CostNeedsView addSubview:self.startTestBtn];
    
}

- (void) startTestPressed
{
    
}

- (void) startLearningPressed
{
    [self.startStudyBtn setTitle:@"开始学习" forState:UIControlStateHighlighted];
    //点击切换页面
    NSLog(@"sdg");
}

- (void) firstInfoBtnPressed
{
    [self setBlurView:[JCRBlurView new]];
    [[self blurView] setFrame:CGRectMake(0.0f, 0.0f, [self.view bounds].size.width, [self.view bounds].size.height)];
    [[self blurView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    
    UIButton *cancelBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 4.5/60.0 * self.view.bounds.size.width, 4.5/60.0 * self.view.bounds.size.width)];
    [cancelBtn setTitle:@"X" forState:UIControlStateNormal];
    [cancelBtn setTitleColor:[UIColor colorWithWhite:0.6f alpha:1.0f] forState:UIControlStateNormal];
    [cancelBtn sizeToFit];
    CGPoint BtnPoint = self.view.center;
    BtnPoint.y = 90.0/107.0f * self.view.bounds.size.height;
    cancelBtn.center = BtnPoint;
    [self.blurView addSubview:cancelBtn];
    //[self.blurView setBlurTintColor:[UIColor colorWithWhite:0.95f alpha:0.4f]];
    [self.view addSubview:[self blurView]];
    
    CATransition *animation = [CATransition animation];
    [animation setDuration:1.0f];
    [animation setType:kCATransitionReveal];
    [animation setSubtype:kCATransitionFromTop];
    [animation setFillMode:kCAFillModeForwards];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut]];
    
    [self.blurView.layer addAnimation:animation forKey:nil];
    
    [cancelBtn addTarget:self action:@selector(cancelInfoBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    
    UITextView *textView = [[UITextView alloc] initWithFrame:CGRectMake(11.0/60.0 * self.view.bounds.size.width, 23.0/107.0 * self.view.bounds.size.height, 38.0/60.0f * self.view.bounds.size.width, 55.0/107.0 * self.view.bounds.size.height)];
    [self.blurView addSubview:textView];
    textView.scrollEnabled = YES;
    textView.editable = NO;
    textView.textAlignment = NSTextAlignmentCenter;
    textView.text = @"关于该功能的简要说明";
    textView.font = [UIFont systemFontOfSize:10.0/170.0f * self.view.bounds.size.width];
    textView.backgroundColor = [UIColor clearColor];
    textView.textColor = [UIColor whiteColor];
}

- (void) secondInfoBtnPressed
{
    
}

- (void) cancelInfoBtnPressed
{
    self.blurView.hidden = YES;
}

- (void) revealToNextPage
{
    [self.revealController revealToggleAnimated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
