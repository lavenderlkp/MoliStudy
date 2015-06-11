//
//  NavigationView.m
//  StudyPage2.0
//
//  Created by lavender_molistudy on 15/6/2.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import "NavigationView.h"

@implementation NavigationView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.leftButton = [[LeftArrow alloc] initWithFrame:CGRectMake(16.0f, 28.0f, 16.0f, 16.0f)];
        [self addSubview:self.leftButton];
        
        self.rightLabel = [[UILabel alloc] initWithFrame:CGRectMake(frame.size.width - 45, 28.0f, 30.0f, 15.0f)];
        [self addSubview:self.rightLabel];
        NSMutableAttributedString *attributedStr = [[NSMutableAttributedString alloc] initWithString:@"3/5"];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:[[UIColor alloc] initWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:1] range:NSMakeRange(0, 1)];
        [attributedStr addAttribute:NSForegroundColorAttributeName value:[UIColor whiteColor] range:NSMakeRange(1, 2)];
        self.rightLabel.attributedText = attributedStr;
        
        self.middleImage = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 16.0f, 8.0f)];
        CGPoint imagePoint = self.center;
        imagePoint.y  = imagePoint.y + 2.0f;
        self.middleImage.center = imagePoint;
        [self addSubview:self.middleImage];
        UIImage *image = [UIImage imageNamed:@"clock"];
        [self.middleImage setImage:image];
        
        self.middleTimer = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 30.0f, 10.0f)];
        CGPoint textPoint = self.center;
        textPoint.y = imagePoint.y + 8.0f;
        self.middleTimer.center = textPoint;
        self.middleTimer.numberOfLines = 1;
        self.middleTimer.lineBreakMode = NSLineBreakByWordWrapping;
        self.middleTimer.font = [UIFont systemFontOfSize:12.0f];
        self.middleTimer.textColor = [UIColor whiteColor];
        [self.middleTimer setText:@"00:00"];
        [self addSubview:self.middleTimer];
        
        
        self.backgroundColor = [UIColor blackColor];
    }
    return self;
}

@end
