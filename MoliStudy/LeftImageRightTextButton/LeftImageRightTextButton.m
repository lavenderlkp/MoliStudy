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
    return bounds;
}

- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    return CGRectMake(5.5/17.0f * contentRect.size.width, 0, 11.0/17.0f * contentRect.size.width, contentRect.size.height);
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    //self.contentMode = UIViewContentModeScaleToFill;
    return CGRectMake(0, 0, 3.0/17.0f * contentRect.size.width, contentRect.size.height);
}

@end
