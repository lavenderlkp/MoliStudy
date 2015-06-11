//
//  CalendarPageViewController.m
//  MoliStudy
//
//  Created by lavender_molistudy on 15/6/9.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import "CalendarPageViewController.h"

@interface CalendarPageViewController ()
{
    NSMutableDictionary *eventsByDate;
}

@end

@implementation CalendarPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGRect naviRect = [[UIScreen mainScreen] bounds];
    self.naviBar = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, naviRect.size.width, 10.5/107.0f * naviRect.size.height)];
    [self.view addSubview:self.naviBar];
    UILabel *naviTitle = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 12.0/62.0f * naviRect.size.width, 4.0/107.0f * naviRect.size.height)];
    naviTitle.numberOfLines = 1;
    naviTitle.text = @"打卡日历";
    naviTitle.textColor = [UIColor whiteColor];
    naviTitle.adjustsFontSizeToFitWidth = YES;
    naviTitle.textAlignment = NSTextAlignmentCenter;
    naviTitle.font = [UIFont systemFontOfSize:12.0/250.0f * naviRect.size.width];
    self.naviItem = [[UINavigationItem alloc] init];
    self.naviItem.titleView = naviTitle;
    self.naviBar.tintColor = [UIColor whiteColor];//左右button显示为白色
    [self.naviBar pushNavigationItem:self.naviItem animated:YES];
    self.naviBar.translucent = NO;
    
    LeftArrow *leftBtn = [[LeftArrow alloc] initWithFrame:CGRectMake(2.5/62.0f * naviRect.size.width, 5.4/107.0f * naviRect.size.height, 3.0/62.0f * naviRect.size.width, 3.0/62.0f * naviRect.size.width)];
    [self.naviBar addSubview:leftBtn];
    leftBtn.backgroundColor = [UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(pageBack) name:@"NaviLeftArrow" object:nil];
    
    CalendarNaviRight *rightBtn = [[CalendarNaviRight alloc] initWithFrame:CGRectMake(56.0/62.0f * naviRect.size.width, 5.5/107.0f * naviRect.size.height, 3.0/62.0f * naviRect.size.width, 2.5/62.0f * naviRect.size.width)];
    [self.naviBar addSubview:rightBtn];
    rightBtn.backgroundColor = [UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(shareToPlatform) name:@"CalendarNaviRightPressed" object:nil];

    self.naviBar.barTintColor = [UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8];
    
    
    self.registerDays = [[UILabel alloc] initWithFrame:CGRectMake(26.5/62.0f * naviRect.size.width, 16.0/107.0f * naviRect.size.height, 11.0/62.0f * naviRect.size.width, 6.0/107.0f * naviRect.size.height)];
    self.registerDays.numberOfLines = 1;
    self.registerDays.adjustsFontSizeToFitWidth = YES;
    NSMutableAttributedString *attributeStr = [[NSMutableAttributedString alloc] initWithString:@"7天打卡"];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor colorWithRed:1.0f green:165.0/255.0f blue:0.0f alpha:1.0f] range:NSMakeRange(0, 1)];
    [attributeStr addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(1, 3)];
    [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:14.0/60.0f * naviRect.size.width] range:NSMakeRange(0, 1)];
    [attributeStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:12.0/250.0f * naviRect.size.width] range:NSMakeRange(1, 3)];
    self.registerDays.attributedText = attributeStr;
    [self.view addSubview:self.registerDays];
    
    self.calendarMenuView = [[JTCalendarMenuView alloc] initWithFrame:CGRectMake(0.0f, 26.5/107.0f * naviRect.size.height, naviRect.size.width, 11.5/107.0f * naviRect.size.height)];
    [self.view addSubview:self.calendarMenuView];
    
    self.calendarContentView = [[JTCalendarContentView alloc] initWithFrame:CGRectMake(0.0f, 38.0/107.0f * naviRect.size.height, naviRect.size.width, 40.0/107.0f * naviRect.size.height)];
    [self.view addSubview:self.calendarContentView];
    
    
    
    self.calendar = [JTCalendar new];
    self.calendar.calendarAppearance.calendar.firstWeekday = 2; // Sunday == 1, Saturday == 7
    self.calendar.calendarAppearance.dayCircleRatio = 9. / 10.;
    self.calendar.calendarAppearance.ratioContentMenu = 1.;
    self.calendar.calendarAppearance.focusSelectedDayChangeMode = YES;
    [self.calendar.calendarAppearance setDayDotColorForAll:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8]];
    self.calendar.calendarAppearance.dayDotColorSelected = [UIColor whiteColor];
    
    // Customize the text for each month
    self.calendar.calendarAppearance.monthBlock = ^NSString *(NSDate *date, JTCalendar *jt_calendar){
        NSCalendar *calendar = jt_calendar.calendarAppearance.calendar;
        NSDateComponents *comps = [calendar components:NSCalendarUnitYear|NSCalendarUnitMonth fromDate:date];
        NSInteger currentMonthIndex = comps.month;
        
        static NSDateFormatter *dateFormatter;
        if(!dateFormatter)
        {
            dateFormatter = [NSDateFormatter new];
            dateFormatter.timeZone = jt_calendar.calendarAppearance.calendar.timeZone;
        }
        
        while(currentMonthIndex <= 0)
        {
            currentMonthIndex += 12;
        }
        
        NSString *monthText = [[dateFormatter standaloneMonthSymbols][currentMonthIndex - 1] capitalizedString];
        
        return [NSString stringWithFormat:@"%ld\n%@", comps.year, monthText];
    };
    
    
    [self.calendar setMenuMonthsView:self.calendarMenuView];
    [self.calendar setContentView:self.calendarContentView];
    [self.calendar setDataSource:self];
    [self createRandomEvents];
    [self.calendar reloadData];
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 78.0/107.0f * naviRect.size.height, naviRect.size.width, 29.0/107.0f * naviRect.size.height) style:UITableViewStylePlain];
    [self.view addSubview:self.tableView];
    self.tableView.scrollEnabled = NO;
    self.tableView.showsHorizontalScrollIndicator = NO;
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 8.0/107.0f * self.view.frame.size.height;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell)
    {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier];
    }
    if (indexPath.row == 1)
    {
        cell.textLabel.text = @"已打卡";
        cell.detailTextLabel.text = @"·";
        [cell.detailTextLabel setTextColor:[UIColor colorWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:0.8]];
        [cell.detailTextLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    }
    if (indexPath.row == 2)
    {
        cell.textLabel.text = @"未打卡";
        cell.detailTextLabel.text = @"·";
        [cell.detailTextLabel setFont:[UIFont fontWithName:@"Helvetica-Bold" size:20]];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void) pageBack
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void) shareToPlatform
{
    
}

- (void)viewDidLayoutSubviews
{
    [self.calendar repositionViews];
}

- (BOOL)calendarHaveEvent:(JTCalendar *)calendar date:(NSDate *)date
{
    NSString *key = [[self dateFormatter] stringFromDate:date];
    
    if(eventsByDate[key] && [eventsByDate[key] count] > 0){
        return YES;
    }
    
    return NO;
}

- (void)calendarDidDateSelected:(JTCalendar *)calendar date:(NSDate *)date
{
    NSString *key = [[self dateFormatter] stringFromDate:date];
    NSArray *events = eventsByDate[key];
    
    NSLog(@"Date: %@ - %ld events", date, [events count]);
}

- (void)calendarDidLoadPreviousPage
{
    NSLog(@"Previous page loaded");
}

- (void)calendarDidLoadNextPage
{
    NSLog(@"Next page loaded");
}

- (NSDateFormatter *)dateFormatter
{
    static NSDateFormatter *dateFormatter;
    if(!dateFormatter){
        dateFormatter = [NSDateFormatter new];
        dateFormatter.dateFormat = @"dd-MM-yyyy";
    }
    
    return dateFormatter;
}

- (void)createRandomEvents
{
    eventsByDate = [NSMutableDictionary new];
    
    for(int i = 0; i < 30; ++i){
        // Generate 30 random dates between now and 60 days later
        NSDate *randomDate = [NSDate dateWithTimeInterval:(rand() % (3600 * 24 * 60)) sinceDate:[NSDate date]];
        
        // Use the date as key for eventsByDate
        NSString *key = [[self dateFormatter] stringFromDate:randomDate];
        
        if(!eventsByDate[key]){
            eventsByDate[key] = [NSMutableArray new];
        }
        
        [eventsByDate[key] addObject:randomDate];
    }
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
