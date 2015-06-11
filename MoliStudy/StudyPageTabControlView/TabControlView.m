//
//  TabControlView.m
//  StudyPage2.0
//
//  Created by lavender_molistudy on 15/6/2.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import "TabControlView.h"

@implementation TabControlView

- (instancetype) initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        self.submitBtn = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        self.submitBtn.frame = CGRectMake(21.5/61.0f * frame.size.width, 0.15 * frame.size.height, 18.0/61.0f * frame.size.width, 0.71f * frame.size.height);
        [self.submitBtn setTitle:@"提交" forState:UIControlStateNormal];
        self.submitBtn.backgroundColor = [[UIColor alloc] initWithRed:(70.0f/255.0f) green:(193.0f/255.0f) blue:(166.0f/255.0f) alpha:1];
        self.submitBtn.tintColor = [UIColor whiteColor];
        self.submitBtn.layer.cornerRadius = 20;
        [self addSubview:self.submitBtn];
        
        self.helpLabel = [[UILabel alloc] initWithFrame:CGRectMake(6.0/61.0f * frame.size.width, 0.62 * frame.size.height, 3.0/61.0f * frame.size.width, 0.2 * frame.size.height)];
        self.helpLabel.text = @"点拨";
        self.helpLabel.font = [UIFont fontWithName:nil size:0.024 * frame.size.width];
        self.helpLabel.numberOfLines = 1;
        self.helpLabel.adjustsFontSizeToFitWidth = YES;
        self.helpLabel.lineBreakMode = NSLineBreakByWordWrapping;
        [self addSubview:self.helpLabel];
        
        self.helpBtn = [[UIButton alloc] initWithFrame:CGRectMake(6.0/61.0f * frame.size.width, 0.15 * frame.size.height, 3.0/61.0f * frame.size.width, 0.41 * frame.size.height)];
        UIImage *image = [UIImage imageNamed:@"tips"];
        [self.helpBtn setImage:image forState:UIControlStateNormal];
        self.helpBtn.imageView.contentMode = UIViewContentModeScaleToFill;
        self.helpBtn.adjustsImageWhenHighlighted = NO;//取消点击效果
        [self addSubview:self.helpBtn];
        
    }
    
    return self;
}

@end
