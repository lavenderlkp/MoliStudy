//
//  CalendarNaviRight.m
//  MoliStudy
//
//  Created by lavender_molistudy on 15/6/9.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import "CalendarNaviRight.h"

@implementation CalendarNaviRight

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UITapGestureRecognizer *rightGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(rightNaviBtnPressed)];
        [self addGestureRecognizer:rightGesture];
    }
    return self;
}

- (void) rightNaviBtnPressed
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"CalendarNaviRightPressed" object:nil];
}

- (void) drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0f);
    CGContextMoveToPoint(context, 0.0f, 0.0f);
    CGContextAddLineToPoint(context, 0.0f, rect.size.height);
    CGContextAddLineToPoint(context, rect.size.width, rect.size.height);
    CGContextAddLineToPoint(context, rect.size.width, 0.0f);
    CGContextAddLineToPoint(context, 0.0f, 0.0f);
    CGContextMoveToPoint(context, rect.size.width, 0.0f);
    CGContextAddLineToPoint(context, 0.25 * rect.size.width, 0.75 * rect.size.height);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextStrokePath(context);
}

@end
