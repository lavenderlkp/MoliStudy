//
//  StudyPageViewController.m
//  MoliStudy
//
//  Created by lavender_molistudy on 15/6/9.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import "StudyPageViewController.h"

@interface StudyPageViewController ()

@end

@implementation StudyPageViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    _navigationBar = [[NavigationView alloc] initWithFrame:CGRectMake(0, 0, screenRect.size.width, 10.5/109.0f * screenRect.size.height)];
    [self.view addSubview:_navigationBar];
    
    self.progressView = [[ProgressView alloc] initWithFrame:CGRectMake(0, 10.5/109.0f * screenRect.size.height, screenRect.size.width, 0.5/109.0f * screenRect.size.height)];
    self.progressView.backgroundColor = [UIColor colorWithWhite:0.9f alpha:0.7f];
    [self.view addSubview:self.progressView];
    //self.progressView.layer.borderWidth = 1.0f;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(progressAnimation) userInfo:nil repeats:YES];
    
    self.questionView = [[UITextView alloc] initWithFrame:CGRectMake(0, 11.0/109.0f * screenRect.size.height, screenRect.size.width, 36.0/109.0f * screenRect.size.height)];
    [self.view addSubview:self.questionView];
    self.questionView.backgroundColor = [UIColor colorWithWhite:0.9f alpha:0.7f];
    self.questionView.editable = NO;
    self.questionView.scrollEnabled = YES;
    
    self.answerChooseTable = [[UITableView alloc] initWithFrame:CGRectMake(0, 47.0/109.0f * screenRect.size.height, screenRect.size.width, 50.0/109.0f * screenRect.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.answerChooseTable];
    self.answerChooseTable.delegate = self;
    self.answerChooseTable.dataSource = self;
    self.answerChooseTable.scrollEnabled = NO;
    
    self.tabControlView = [[TabControlView alloc] initWithFrame:CGRectMake(0, 100.6/109.0f * screenRect.size.height, screenRect.size.width, 8.4/109.0f * screenRect.size.height)];
    [self.view addSubview:self.tabControlView];
    self.tabControlView.backgroundColor = [UIColor colorWithWhite:0.95 alpha:0.6f];
    [self.tabControlView.submitBtn addTarget:self action:@selector(submitBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    [self.tabControlView.helpBtn addTarget:self action:@selector(tipsBtnPressed) forControlEvents:UIControlEventTouchUpInside];
    
    [RadioButton addObserverForGroupId:@"first group" observer:self];
    //以下是备选项中的内容
    self.dataArray = [NSMutableArray arrayWithObjects:@"sdf",@"sdfwg",@"sdxcv",@"ewgsdhjkfhewqghhsdhhwhegkhwghsdhjghjkshgwuhgsdfwegxggregthfgryhhdfe",nil];
    
    //以下是存储的标签
    self.flagArray = [NSMutableArray arrayWithObjects:@"定位",@"逻辑",@"信息", nil];
    
    self.pickerView = [[AKPickerView alloc] initWithFrame:CGRectMake(0, 92.5/109.0f * screenRect.size.height, screenRect.size.width, 9.5/109.0f * screenRect.size.height)];
    self.pickerView.delegate = self;
    self.pickerView.dataSource = self;
    self.pickerView.backgroundColor = [UIColor colorWithRed:(153.0f/255.0f) green:(204.0f/255.0f) blue:(102.0f/255.0f) alpha:1.0f];
    self.pickerView.font = [UIFont fontWithName:@"HelveticaNeue-Light" size:20];
    self.pickerView.textColor = [UIColor colorWithWhite:0.95f alpha:0.8f];
    self.pickerView.highlightedTextColor = [UIColor whiteColor];
    self.pickerView.highlightedFont = [UIFont fontWithName:@"HelveticaNeue" size:20];
    self.pickerView.interitemSpacing = 50.0;
    self.pickerView.fisheyeFactor = 0.001;
    self.pickerView.pickerViewStyle = AKPickerViewStyle3D;
    self.pickerView.maskDisabled = false;
    [self.view addSubview:self.pickerView];
    [self.pickerView reloadData];
    self.pickerView.hidden = YES;
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(naviArrowPressed) name:@"NaviLeftArrow" object:nil];
}

- (void) naviArrowPressed
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (NSString *)pickerView:(AKPickerView *)pickerView titleForItem:(NSInteger)item
{
    return self.flagArray[item];
}

- (NSUInteger)numberOfItemsInPickerView:(AKPickerView *)pickerView
{
    return [self.flagArray count];
}

- (void)pickerView:(AKPickerView *)pickerView didSelectItem:(NSInteger)item
{
    NSLog(@"%@", self.flagArray[item]);
    UILabel *textLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 300, 100)];
    textLabel.text = @"jkjljdalkjdkljalfjklajdlkfjla;jfl;jadkl;fjlka;djdfl;ajk";
    textLabel.backgroundColor = [UIColor whiteColor];
    
    DXPopover *popover = [DXPopover popover];
    [popover showAtView:pickerView withContentView:textLabel];
}

- (void)radioButtonSelectedAtIndex:(NSUInteger)index inGroup:(NSString*)groupId
{
    NSLog(@"changed to %ld in %@",index,groupId);
}

- (void) tipsBtnPressed
{
    [self.tabControlView.helpBtn setImage:[UIImage imageNamed:@"tips"] forState:UIControlStateHighlighted];
    self.pickerView.hidden = NO;
}

- (void) submitBtnPressed
{
    NSLog(@"submit btn is pressed");
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 12.0/109.0f * self.view.frame.size.height;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        RadioButton *radioBtn = [[RadioButton alloc] initWithGroupId:@"first group" index:indexPath.row];
        radioBtn.frame = CGRectMake(2.5/61.0f * screenRect.size.width, 0.53 * cell.frame.size.height, 30, 30);
        [cell addSubview:radioBtn];
        
        UILabel *dataLabel = [[UILabel alloc] initWithFrame:CGRectMake(10.0/61.0f * screenRect.size.width, 2.0/109.0f * screenRect.size.height, 46.0/61.0f * screenRect.size.width, 8.0/109.0f * screenRect.size.height)];
        dataLabel.lineBreakMode = NSLineBreakByWordWrapping;
        dataLabel.numberOfLines = 2;
        dataLabel.text = [self.dataArray objectAtIndex:indexPath.row];
        dataLabel.adjustsFontSizeToFitWidth = YES;
        dataLabel.font = [UIFont fontWithName:nil size:10.0/200.0f * screenRect.size.width];
        dataLabel.textAlignment = NSTextAlignmentLeft;
        [cell addSubview:dataLabel];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;//单元格不可选
    
    return cell;
}

- (void) progressAnimation
{
    self.progressView.progress = arc4random() % 100 / 100.f;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
