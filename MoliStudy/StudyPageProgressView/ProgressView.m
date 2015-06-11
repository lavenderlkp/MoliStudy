//
//  ProgressView.m
//  StudyPage2.0
//
//  Created by lavender_molistudy on 15/6/2.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import "ProgressView.h"

@implementation ProgressView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.progressLayer = [CALayer layer];
        self.progressLayer.frame = CGRectMake(0, 0, 0, frame.size.height);
        self.progressLayer.backgroundColor = [[UIColor alloc] initWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:1].CGColor;
        [self.layer addSublayer:self.progressLayer];
        self.currentWidth = frame.size.width;
    }
    return self;
}

- (void) setProgress:(CGFloat)progress
{
    _progress = progress;
    self.progressLayer.frame = CGRectMake(0, 0, progress * self.currentWidth, self.frame.size.height);
}

@end
