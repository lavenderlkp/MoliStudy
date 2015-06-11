//
//  JTCalendarMenuMonthView.h
//  JTCalendar
//
//  Created by Jonathan Tribouharet
//

#import <UIKit/UIKit.h>
#import "JTLeftArrowView.h"
#import "JTRightArrowView.h"
#import "JTCalendar.h"

@interface JTCalendarMenuMonthView : UIView

@property (weak, nonatomic) JTCalendar *calendarManager;
@property (strong, nonatomic) JTLeftArrowView *leftArrowView;
@property (strong, nonatomic) JTRightArrowView *rightArrowView;

- (void)setCurrentDate:(NSDate *)currentDate;

- (void)reloadAppearance;

@end
