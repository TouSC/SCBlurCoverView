//
//  SCBlurCoverView.m
//  EasyRecord
//
//  Created by 唐绍成 on 16/5/31.
//  Copyright © 2016年 唐绍成. All rights reserved.
//

#import "SCBlurCoverView.h"

@implementation SCBlurCoverView

+ (SCBlurCoverView*)shareInstance;
{
    static SCBlurCoverView *cover;
    if (cover==nil)
    {
        cover = [[SCBlurCoverView alloc]init];
    }
    return cover;
}

- (id)init;
{
    self = [super initWithFrame:[UIScreen mainScreen].bounds];
    if (self)
    {
        ;
    }
    return self;
}

- (void)showWithView:(UIView*)view isResign:(BOOL)isResign;
{
    self.alpha = 0;
    @autoreleasepool {
        UIImage *image = [UIImage screenshot];
        NSData *imageData = UIImageJPEGRepresentation(image, 0.5);
        UIImage *blurredImage = [[UIImage imageWithData:imageData] blurredImage:0.5];
        self.image = blurredImage;
    }
    [[[UIApplication sharedApplication].delegate window] addSubview:self];
    [UIView animateWithDuration:0.2 animations:^{
        self.alpha = 1.0;
    }completion:^(BOOL finished) {
        self.userInteractionEnabled = YES;
        if (isResign)
        {
            [self addGestureRecognizer:[[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(removeFromSuperview)]];
        }
        [self addSubview:view];
    }];
}

- (void)removeFromSuperview;
{
    for (UIView *view in self.subviews)
    {
        [view removeFromSuperview];
    }
    [super removeFromSuperview];
}

- (void)dealloc;
{
    
}

@end
