//
//  TransitionAnimation.h
//  transitionAnimationTest
//
//  Created by 徐天宇 on 16/9/12.
//  Copyright © 2016年 devhy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, AnimationType) {
    
    AnimationTypeModalPresent = 0,  //Modal弹出动画
    AnimationTypeModalDismiss,      //Modal消失动画
    AnimationTypeNavPush,           //Nav Push动画
    AnimationTypeNavPop             //Nav Pop动画
};

@interface TransitionAnimation : NSObject<UIViewControllerAnimatedTransitioning>

/**
 *  初始化方法过场动画
 */
+ (instancetype)animationWithAnimationType:(AnimationType)animationType;

@end