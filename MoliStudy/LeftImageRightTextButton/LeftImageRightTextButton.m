//
//  LeftImageRightTextButton.m
//  MoliStudy
//
//  Created by lavender_molistudy on 15/6/8.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import "LeftImageRightTextButton.h"

@implementation LeftImageRightTextButton

- (CGRect)contentRectForBounds:(CGRect)bounds
{
    return CGRectMake(0, 0, 120, 30);
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(40, 0, 80, 30);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(0, 0, 30, 30);
}

@end
