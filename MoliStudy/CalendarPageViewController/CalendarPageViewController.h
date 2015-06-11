//
//  CalendarPageViewController.h
//  MoliStudy
//
//  Created by lavender_molistudy on 15/6/9.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JTCalendar.h"
#import "LeftArrow.h"
#import "CalendarNaviRight.h"

@interface CalendarPageViewController : UIViewController<JTCalendarDataSource,UITableViewDataSource,UITableViewDelegate>

@property (strong, nonatomic) JTCalendarMenuView *calendarMenuView;
@property (strong, nonatomic) JTCalendarContentView *calendarContentView;
@property (strong, nonatomic) JTCalendar *calendar;
@property (strong, nonatomic) UINavigationBar *naviBar;
@property (strong, nonatomic) UINavigationItem *naviItem;
@property (nonatomic, strong) UILabel *registerDays;
@property (nonatomic, strong) UITableView *tableView;

@end
