//
//  HomeViewController.m
//  transitionAnimationTest
//
//  Created by 徐天宇 on 16/9/12.
//  Copyright © 2016年 devhy. All rights reserved.
//

#import "HomeViewController.h"
#import "NormalTableViewController.h"
#import "TransitionAnimation.h"

@interface HomeViewController ()<UIViewControllerTransitioningDelegate, UINavigationControllerDelegate>

@end

@implementation HomeViewController

#pragma mark - cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    //navgation的push、pop转场动画需要遵守UINavigationControllerDelegate协议
    self.navigationController.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - action
- (IBAction)clickPush:(id)sender {
    
    NormalTableViewController *viewController = [[NormalTableViewController alloc] init];
    viewController.bModal = NO;
    viewController.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:viewController animated:YES];
}

- (IBAction)clickModal:(id)sender {
    
    NormalTableViewController *viewController = [[NormalTableViewController alloc] init];
    viewController.bModal = YES;
    
    //modal要弹出界面的转场代理要设置成父界面
    viewController.transitioningDelegate = self;
    
    [self presentViewController:viewController animated:YES completion:nil];
}

#pragma mark - modal transition animation delegate
- (id<UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented
                                                                  presentingController:(UIViewController *)presenting
                                                                      sourceController:(UIViewController *)source{
    return [TransitionAnimation animationWithAnimationType:AnimationTypeModalPresent];
}

- (id<UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    
    return [TransitionAnimation animationWithAnimationType:AnimationTypeModalDismiss];
}

#pragma mark - nav transition animation delegate
- (id<UIViewControllerAnimatedTransitioning>)navigationController:(UINavigationController *)navigationController
                                  animationControllerForOperation:(UINavigationControllerOperation)operation
                                               fromViewController:(UIViewController *)fromVC
                                                 toViewController:(UIViewController *)toVC{
    
    if (operation == UINavigationControllerOperationPush) {
        return [TransitionAnimation animationWithAnimationType:AnimationTypeNavPush];
    }else if(operation == UINavigationControllerOperationPop){
        return [TransitionAnimation animationWithAnimationType:AnimationTypeNavPop];
    }else{
        return nil;
    }
}



/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
