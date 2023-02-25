//
//  WDViewController.m
//  WDLogLib
//
//  Created by PureWindSN on 02/11/2023.
//  Copyright (c) 2023 PureWindSN. All rights reserved.
//

#import "WDViewController.h"
#import "WindLogManager.h"

@interface WDViewController ()

@end

@implementation WDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    NSLog(@"53w");
    WindLogD(@"debug log");
    WindLogD(@"%@ %@",@"test",@"demo");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
