//
//  SCBlurCoverView.h
//  EasyRecord
//
//  Created by 唐绍成 on 16/5/31.
//  Copyright © 2016年 唐绍成. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIImage+Blur.h"
#import "UIImage+Screenshot.h"

@interface SCBlurCoverView : UIImageView

+ (SCBlurCoverView*)shareInstance;
- (void)showWithView:(UIView*)view isResign:(BOOL)isResign;
- (void)removeFromSuperview;

@end
