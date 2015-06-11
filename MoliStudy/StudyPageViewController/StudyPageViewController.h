//
//  StudyPageViewController.h
//  MoliStudy
//
//  Created by lavender_molistudy on 15/6/9.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavigationView.h"
#import "ProgressView.h"
#import "TabControlView.h"
#import "RadioButton.h"
#import "AKPickerView.h"
#import "DXPopover.h"

@interface StudyPageViewController : UIViewController<UITableViewDataSource,UITableViewDelegate,AKPickerViewDelegate,AKPickerViewDataSource>

@property (nonatomic, strong) NavigationView *navigationBar;
@property (nonatomic, strong) ProgressView *progressView;
@property (nonatomic, strong) TabControlView *tabControlView;
@property (nonatomic, strong) NSTimer *timer;
@property (nonatomic, strong) UITextView *questionView;
@property (nonatomic, strong) UITableView *answerChooseTable;

@property (nonatomic, strong) AKPickerView *pickerView;

@property (nonatomic, strong) NSMutableArray *dataArray;//存储备选答案
@property (nonatomic, strong) NSMutableArray *flagArray;//存储标签

@end
