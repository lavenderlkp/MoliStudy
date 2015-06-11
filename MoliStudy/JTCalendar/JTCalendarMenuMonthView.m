//
//  JTCalendarMenuMonthView.m
//  JTCalendar
//
//  Created by Jonathan Tribouharet
//

#import "JTCalendarMenuMonthView.h"

@interface JTCalendarMenuMonthView(){
    UILabel *textLabel;
}

@end

@implementation JTCalendarMenuMonthView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(!self){
        return nil;
    }
    
    [self commonInit];
    
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(!self){
        return nil;
    }
    
    [self commonInit];
    
    return self;
}

- (void)commonInit
{
    {
        textLabel = [UILabel new];
        [self addSubview:textLabel];
        
        textLabel.textAlignment = NSTextAlignmentCenter;
        textLabel.numberOfLines = 1;
        
        _leftArrowView = [[JTLeftArrowView alloc] init];
        [self addSubview:_leftArrowView];
        _rightArrowView = [[JTRightArrowView alloc] init];
        [self addSubview:_rightArrowView];
        
        self.backgroundColor = [UIColor colorWithRed:0.8f green:0.8f blue:0.8f alpha:0.5];
    }
}

- (void)setCurrentDate:(NSDate *)currentDate
{
    NSString *dateStr = self.calendarManager.calendarAppearance.monthBlock(currentDate, self.calendarManager);
    textLabel.text = [dateStr stringByReplacingOccurrencesOfString:@"\n" withString:@" "];
    //NSLog(@"%@",textLabel.text);
}

- (void)layoutSubviews
{
    textLabel.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    //NSLog(@"%lf.%lf",self.frame.size.width,self.frame.size.height);
    // No need to call [super layoutSubviews]
    _leftArrowView.frame = CGRectMake(0, 0, 10, 10);
    CGPoint leftPoint = textLabel.center;
    leftPoint.x = 30;
    _leftArrowView.center = leftPoint;
    
    _rightArrowView.frame = CGRectMake(0, 0, 10, 10);
    CGPoint rightPoint = textLabel.center;
    rightPoint.x = self.frame.size.width - 30;
    _rightArrowView.center = rightPoint;
}

- (void)reloadAppearance
{
    textLabel.textColor = self.calendarManager.calendarAppearance.menuMonthTextColor;
    textLabel.font = self.calendarManager.calendarAppearance.menuMonthTextFont;
}

@end
