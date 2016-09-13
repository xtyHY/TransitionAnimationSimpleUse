//
//  NormalTableViewController.m
//  transitionAnimationTest
//
//  Created by 徐天宇 on 16/9/12.
//  Copyright © 2016年 devhy. All rights reserved.
//

#import "NormalTableViewController.h"

@interface NormalTableViewController ()

@property (nonatomic, strong) NSMutableArray *arrayDS;

@end

@implementation NormalTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSString *cellStr = _bModal ? @"click anyCell back" : @"click lefBarButtonItem back";
    
    self.arrayDS = [NSMutableArray array];
    for (NSInteger i=0; i<30; i++) {
        [self.arrayDS addObject:[NSString stringWithFormat:@"%@ %li",cellStr ,i]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return self.arrayDS.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellId = @"cellId";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellId];
    }
    
    cell.textLabel.textColor = [UIColor whiteColor];
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%255/255.0f green:arc4random()%255/255.0f blue:arc4random()%255/255.0f alpha:1];
    cell.textLabel.text = self.arrayDS[indexPath.row];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    if (_bModal) {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

@end
