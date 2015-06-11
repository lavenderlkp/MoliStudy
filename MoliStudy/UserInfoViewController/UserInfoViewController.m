//
//  UserInfoViewController.m
//  MoliStudy
//
//  Created by lavender_molistudy on 15/6/8.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import "UserInfoViewController.h"

@interface UserInfoViewController ()

@property (nonatomic, strong) NSMutableArray *BtnTitleName;

@end

@implementation UserInfoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.BtnTitleName = [[NSMutableArray alloc] initWithObjects:@"我的收藏",@"成绩报告",@"强化训练",@"打卡日历", nil];
    
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
    
    self.funcTableView = [[UITableView alloc] initWithFrame:CGRectMake(3.0/60.0f * screenRect.size.width, 28.0/107.0f * screenRect.size.height, screenRect.size.width, 36.0/107.0f * screenRect.size.height) style:UITableViewStylePlain];
    self.funcTableView.scrollEnabled = NO;
    [self.view addSubview:self.funcTableView];
    self.funcTableView.backgroundColor = [UIColor blackColor];
    self.funcTableView.delegate = self;
    self.funcTableView.dataSource = self;
    self.funcTableView.separatorColor = [UIColor colorWithWhite:0.6 alpha:0.7f];
    self.funcTableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
    
    [self setBlurView:[JCRBlurView new]];
    [[self blurView] setFrame:CGRectMake(0.0f, 97.0/107.0f * screenRect.size.height, screenRect.size.width, 10.0/107.0f * screenRect.size.height)];
    [[self blurView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self.blurView setBlurTintColor:[UIColor colorWithWhite:0.08f alpha:0.4f]];
    self.blurView.layer.borderColor = [UIColor colorWithWhite:0.6 alpha:0.7f].CGColor;
    self.blurView.layer.borderWidth = 0.4f;
    [self.view addSubview:self.blurView];
    
    self.btnSet = [[LeftImageRightTextButton alloc] initWithFrame:CGRectMake(3.0/60.0f * screenRect.size.width, 3.6/107.0f * self.view.frame.size.height, 10.0/60.0f * screenRect.size.width, 2.8/107.0f * self.view.frame.size.height)];
    [self.blurView addSubview:self.btnSet];
    [self.btnSet setTitle:@"设置" forState:UIControlStateNormal];
    self.btnSet.titleLabel.numberOfLines = 1;
    self.btnSet.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self.btnSet setTitleColor:[UIColor colorWithWhite:0.7f alpha:0.8f] forState:UIControlStateNormal];
    [self.btnSet.titleLabel setFont:[UIFont systemFontOfSize:10.0/250.0f * screenRect.size.width]];
    [self.btnSet setImage:[UIImage imageNamed:@"set"] forState:UIControlStateNormal];
    self.btnSet.imageView.contentMode = UIViewContentModeScaleToFill;
    [self.btnSet addTarget:self action:@selector(setBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnNight = [[LeftImageRightTextButton alloc] initWithFrame:CGRectMake(19.0/60.0f * screenRect.size.width, 3.6/107.0f * self.view.frame.size.height, 10.0/60.0f * screenRect.size.width, 2.8/107.0f * self.view.frame.size.height)];
    [self.blurView addSubview:self.btnNight];
    [self.btnNight setTitle:@"夜间" forState:UIControlStateNormal];
    self.btnNight.titleLabel.numberOfLines = 1;
    self.btnNight.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self.btnNight setTitleColor:[UIColor colorWithWhite:0.7f alpha:0.8f] forState:UIControlStateNormal];
    [self.btnNight.titleLabel setFont:[UIFont systemFontOfSize:10.0/250.0f * screenRect.size.width]];
    [self.btnNight setImage:[UIImage imageNamed:@"mode"] forState:UIControlStateNormal];
    self.btnNight.imageView.contentMode = UIViewContentModeScaleToFill;
    [self.btnNight addTarget:self action:@selector(nightBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    
    self.btnWay = [[LeftImageRightTextButton alloc] initWithFrame:CGRectMake(34.3/60.0f * screenRect.size.width, 3.6/107.0f * self.view.frame.size.height, 10.0/60.0f * screenRect.size.width, 2.8/107.0f * self.view.frame.size.height)];
    [self.blurView addSubview:self.btnWay];
    [self.btnWay setTitle:@"研途" forState:UIControlStateNormal];
    self.btnWay.titleLabel.numberOfLines = 1;
    self.btnWay.titleLabel.adjustsFontSizeToFitWidth = YES;
    [self.btnWay setTitleColor:[UIColor colorWithWhite:0.7f alpha:0.8f] forState:UIControlStateNormal];
    [self.btnWay.titleLabel setFont:[UIFont systemFontOfSize:10.0/250.0f * screenRect.size.width]];
    [self.btnWay setImage:[UIImage imageNamed:@"way"] forState:UIControlStateNormal];
    self.btnWay.imageView.contentMode = UIViewContentModeScaleToFill;
    [self.btnWay addTarget:self action:@selector(wayBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *SeparatorOne = [[UIView alloc] initWithFrame:CGRectMake(15.0/60.0f * screenRect.size.width, 4.0/107.0f * screenRect.size.height, 0.08/60.0f * screenRect.size.width, 2.0/107.0f * screenRect.size.height)];
    SeparatorOne.backgroundColor = [UIColor colorWithWhite:0.7f alpha:0.8f];
    [self.blurView addSubview:SeparatorOne];
    
    UIView *SeparatorTwo = [[UIView alloc] initWithFrame:CGRectMake(32.0/60.0f * screenRect.size.width, 4.0/107.0f * screenRect.size.height, 0.1/60.0f * screenRect.size.width, 2.0/107.0f * screenRect.size.height)];
    SeparatorTwo.backgroundColor = [UIColor colorWithWhite:0.7f alpha:0.8f];
    [self.blurView addSubview:SeparatorTwo];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return (9.0/107.0f * self.view.frame.size.height);
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
        cell.backgroundColor = [UIColor blackColor];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    LeftImageRightTextButton *cellBtn = [LeftImageRightTextButton buttonWithType:UIButtonTypeCustom];
    cellBtn.frame = CGRectMake(0, 3.0/107.0f * self.view.frame.size.height, 17.0/60.0f * self.view.frame.size.width, 3.0/107.0f * self.view.frame.size.height);
    [cellBtn setTitle:[self.BtnTitleName objectAtIndex:indexPath.row] forState:UIControlStateNormal];
    [cellBtn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [cellBtn setImage:[UIImage imageNamed:[NSString stringWithFormat:@"%ld",indexPath.row]] forState:UIControlStateNormal];
    cellBtn.imageView.contentMode = UIViewContentModeScaleToFill;
    [cellBtn.titleLabel setFont:[UIFont systemFontOfSize:13.0/300.0f * self.view.frame.size.width]];
    cellBtn.titleLabel.numberOfLines = 1;
    cellBtn.titleLabel.adjustsFontSizeToFitWidth = YES;

    switch (indexPath.row)
    {
        case 0:
            [cellBtn addTarget:self action:@selector(firstBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
            break;
        case 1:
            [cellBtn addTarget:self action:@selector(secondBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
            break;
        case 2:
            [cellBtn addTarget:self action:@selector(thirdBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
            break;
        case 3:
            [cellBtn addTarget:self action:@selector(forthBtnPressed:) forControlEvents:UIControlEventTouchUpInside];
            break;
        default:
            break;
    }
    [cell addSubview:cellBtn];
    
    return cell;
}

- (void) firstBtnPressed: (UIButton *)button
{
    [button setTitleColor:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8] forState:UIControlStateHighlighted];
    StoreViewController *storeView = [[StoreViewController alloc] init];
    storeView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:storeView animated:YES completion:nil];
}

- (void) secondBtnPressed: (UIButton *)button
{
    [button setTitleColor:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8] forState:UIControlStateHighlighted];
    ReportViewController *reportView = [[ReportViewController alloc] init];
    reportView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:reportView animated:YES completion:nil];
}

- (void) thirdBtnPressed: (UIButton *)button
{
    [button setTitleColor:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8] forState:UIControlStateHighlighted];
    StudyPageViewController *studyView = [[StudyPageViewController alloc] init];
    studyView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:studyView animated:YES completion:nil];
}

- (void) forthBtnPressed: (UIButton *)button
{
    [button setTitleColor:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8] forState:UIControlStateHighlighted];
    CalendarPageViewController *calendarView = [[CalendarPageViewController alloc] init];
    calendarView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:calendarView animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setBtnPressed
{
    [_btnSet setTitleColor:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8] forState:UIControlStateHighlighted];
    SetPageViewController *setView = [[SetPageViewController alloc] init];
    setView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:setView animated:YES completion:nil];
}

- (void)nightBtnPressed
{
    [_btnNight setTitleColor:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8] forState:UIControlStateHighlighted];
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
}

- (void)wayBtnPressed
{
    [_btnWay setTitleColor:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8] forState:UIControlStateHighlighted];
    YanTuViewController *wayView = [[YanTuViewController alloc] init];
    wayView.modalTransitionStyle = UIModalTransitionStyleCrossDissolve;
    [self presentViewController:wayView animated:YES completion:nil];
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
