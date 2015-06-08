//
//  UserInfoViewController.m
//  MoliStudy
//
//  Created by lavender_molistudy on 15/6/8.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    self.UserImage = [[UIImageView alloc] initWithFrame:CGRectMake(2.5/60.0f * screenRect.size.width, 12.0/107.0f * screenRect.size.height, 10.0/60.0f * screenRect.size.width, 10.0/60.0f * screenRect.size.width)];
    //将此layer下面的所有layer都覆盖掉
    self.UserImage.layer.masksToBounds = YES;
    //此地为设置成圆形的关键，将角度半径设置为长的一半
    self.UserImage.layer.cornerRadius = 5.0/60.0f * screenRect.size.width;
    self.UserImage.layer.borderWidth = 2.0f;
    self.UserImage.layer.borderColor = [UIColor colorWithWhite:0.7f alpha:1.0f].CGColor;
    [self.view addSubview:self.UserImage];
    UIImage *UserPor = [UIImage imageNamed:@"UserPortrait"];
    self.UserImage.backgroundColor = [UIColor whiteColor];
    self.UserImage.image = UserPor;
    
    self.UserName = [[UILabel alloc] initWithFrame:CGRectMake(15.8/60.0f * screenRect.size.width, 13.6/107.0f * screenRect.size.height, 30.0/60.0f * screenRect.size.width, 3.5/107.0f * screenRect.size.height)];
    self.UserName.numberOfLines = 1;
    self.UserName.textAlignment = NSTextAlignmentLeft;
    self.UserName.font = [UIFont systemFontOfSize:10.0/155.0f * screenRect.size.width];
    self.UserName.textColor = [UIColor whiteColor];
    self.UserName.text = @"Fsir";
    [self.view addSubview:self.UserName];
    
    UILabel *moliCoin = [[UILabel alloc] initWithFrame:CGRectMake(15.8/60.0f * screenRect.size.width, 18.7/107.0f * screenRect.size.height, 7.5/60.0f * screenRect.size.width, 3.0/107.0f * screenRect.size.height)];
    moliCoin.numberOfLines = 1;
    moliCoin.textAlignment = NSTextAlignmentCenter;
    moliCoin.adjustsFontSizeToFitWidth = YES;
    moliCoin.textColor = [UIColor whiteColor];
    moliCoin.text = @"魔力币:";
    moliCoin.font = [UIFont systemFontOfSize:14.0/300.0f * screenRect.size.width];
    [self.view addSubview:moliCoin];
    
    self.coinNum = [[UILabel alloc] initWithFrame:CGRectMake(24.0/60.0f * screenRect.size.width, 18.9/107.0f * screenRect.size.height, 5.0/60.0f * screenRect.size.width, 2.8/107.0f * screenRect.size.height)];
    self.coinNum.numberOfLines = 1;
    self.coinNum.textAlignment = NSTextAlignmentLeft;
    self.coinNum.font = [UIFont systemFontOfSize:10.0/250.0f * screenRect.size.width];
    self.coinNum.textColor = [UIColor whiteColor];
    self.coinNum.text = @"100";
    [self.view addSubview:self.coinNum];
    
    UILabel *registerLabel = [[UILabel alloc] initWithFrame:CGRectMake(30.5/60.0f * screenRect.size.width, 18.6/107.0f * screenRect.size.height, 5.0/60.0f * screenRect.size.width, 3.0/107.0f * screenRect.size.height)];
    registerLabel.numberOfLines = 1;
    registerLabel.textAlignment = NSTextAlignmentCenter;
    registerLabel.adjustsFontSizeToFitWidth = YES;
    registerLabel.textColor = [UIColor whiteColor];
    registerLabel.text = @"打卡:";
    registerLabel.font = [UIFont systemFontOfSize:14.0/300.0f * screenRect.size.width];
    [self.view addSubview:registerLabel];
    
    self.registerNum = [[UILabel alloc] initWithFrame:CGRectMake(37.0/60.0f * screenRect.size.width, 18.8/107.0f * screenRect.size.height, 8.0/60.0f * screenRect.size.width, 3.0/107.0f * screenRect.size.height)];
    self.registerNum.numberOfLines = 1;
    self.registerNum.textAlignment = NSTextAlignmentLeft;
    self.registerNum.font = [UIFont systemFontOfSize:10.0/250.0f * screenRect.size.width];
    self.registerNum.textColor = [UIColor whiteColor];
    self.registerNum.text = @"56天";
    [self.view addSubview:self.registerNum];
}

- (void) firstBtnPressed
{
    //NSLog(@"sdf");
    [_btnFirst setTitleColor:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8] forState:UIControlStateHighlighted];
}

- (void) secondBtnPressed
{
    [_btnSecond setTitleColor:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8] forState:UIControlStateHighlighted];
}

- (void) thirdBtnPressed
{
    [_btnThird setTitleColor:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8] forState:UIControlStateHighlighted];
}

- (void) forthBtnPressed
{
    [_btnForth setTitleColor:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8] forState:UIControlStateHighlighted];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBtnPressed
{
    [_btnSet setTitleColor:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8] forState:UIControlStateHighlighted];
}

//- (void)nightBtnPressed
//{
//    [_btnNight setTitleColor:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8] forState:UIControlStateHighlighted];
//    if ([_btnNight.titleLabel.text  isEqual: @"夜间"])
//    {
//        self.view.backgroundColor = [UIColor whiteColor];
//        [_btnFirst setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_btnSecond setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_btnThird setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_btnForth setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_btnSet setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_btnWay setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_btnNight setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
//        [_btnNight setTitle:@"白天" forState:UIControlStateNormal];
//        
//        _nameLabel.textColor = [UIColor blackColor];
//        _moliCoin.textColor = [UIColor blackColor];
//        _coinNum.textColor = [UIColor blackColor];
//        _registerLabel.textColor = [UIColor blackColor];
//        _registerDays.textColor = [UIColor blackColor];
//    }
//    else if ([_btnNight.titleLabel.text  isEqual: @"白天"])
//    {
//        self.view.backgroundColor = [UIColor blackColor];
//        [_btnFirst setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_btnSecond setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_btnThird setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_btnForth setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_btnSet setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_btnWay setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_btnNight setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [_btnNight setTitle:@"夜间" forState:UIControlStateNormal];
//        
//        _nameLabel.textColor = [UIColor whiteColor];
//        _moliCoin.textColor = [UIColor whiteColor];
//        _coinNum.textColor = [UIColor whiteColor];
//        _registerLabel.textColor = [UIColor whiteColor];
//        _registerDays.textColor = [UIColor whiteColor];
//    }
//}

- (void)wayBtnPressed
{
    [_btnWay setTitleColor:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8] forState:UIControlStateHighlighted];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
