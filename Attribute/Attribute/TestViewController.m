//
//  TestViewController.m
//  Attribute
//
//  Created by Hengjie.chj on 14/2/2016.
//  Copyright © 2016 hengjie chen. All rights reserved.
//

#import "TestViewController.h"
#import "CustomView.h"

@implementation TestViewController

- (void) viewDidLoad {
    [super viewDidLoad];
    CGRect labelRect = CGRectMake(20, 20, 100, 30);
    UILabel *label = [[UILabel alloc] initWithFrame:labelRect];
    label.text = @"Draw in code";
    [self.view addSubview:label];
    
    CustomView *roundedRect = [[CustomView alloc] initWithFrame:CGRectMake(100, 100, 50, 50)];
    [self.view addSubview:roundedRect];
}

@end
