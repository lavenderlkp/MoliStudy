//
//  LeftArrow.m
//  StudyPage2.0
//
//  Created by lavender_molistudy on 15/6/2.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import "LeftArrow.h"

@implementation LeftArrow

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftArrowPressed)];
        [self addGestureRecognizer:tapGesture];
    }
    return self;
}

- (void) leftArrowPressed
{
    [[NSNotificationCenter defaultCenter] postNotificationName:@"NaviLeftArrow" object:nil];
}

- (void) drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0f);
    CGContextMoveToPoint(context, 0.5 * rect.size.width, 0.0f);
    CGContextAddLineToPoint(context, 0.0f, 0.5 * rect.size.height);
    CGContextAddLineToPoint(context, 0.5 * rect.size.width, rect.size.height);
    CGContextMoveToPoint(context, 0.0f, 0.5 * rect.size.height);
    CGContextAddLineToPoint(context, rect.size.width, 0.5 * rect.size.height);
    CGContextSetStrokeColorWithColor(context, [UIColor whiteColor].CGColor);
    CGContextStrokePath(context);
}

@end
