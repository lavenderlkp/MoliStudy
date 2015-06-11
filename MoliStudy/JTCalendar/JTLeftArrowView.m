//
//  JTArrowView.m
//  CalenderTest
//
//  Created by lavender_molistudy on 15/5/28.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import "JTLeftArrowView.h"

@implementation JTLeftArrowView

- (instancetype) init
{
    self = [super init];
    if (!self) {
        return nil;
    }
    self.backgroundColor = [UIColor clearColor];
    UITapGestureRecognizer *gesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(leftArrowTapped)];
    [self addGestureRecognizer:gesture];

    return self;
}

- (void)leftArrowTapped
{
    //NSLog(@"left");
    [[NSNotificationCenter defaultCenter] postNotificationName:@"LeftArrowTapped" object:nil];
}

- (void)drawRect:(CGRect)rect
{
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0f);
    CGContextMoveToPoint(context, 5.0f, 0);
    CGContextAddLineToPoint(context, 0, 5.0f);
    CGContextAddLineToPoint(context, 5.0f, 10.0f);
    CGContextSetStrokeColorWithColor(context, [UIColor grayColor].CGColor);
    CGContextStrokePath(context);
}

@end
