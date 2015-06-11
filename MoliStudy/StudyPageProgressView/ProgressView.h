//
//  ProgressView.h
//  StudyPage2.0
//
//  Created by lavender_molistudy on 15/6/2.
//  Copyright (c) 2015年 lavender_molistudy. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProgressView : UIView

@property (nonatomic, strong) CALayer *progressLayer;
@property (nonatomic, assign) CGFloat progress;
@property (nonatomic, assign) CGFloat currentWidth;

@end
