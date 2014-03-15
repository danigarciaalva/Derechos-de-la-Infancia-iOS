//
//  DetailController.m
//  Gastalón
//
//  Created by Daniel García Alvarado on 05/01/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import "DetailController.h"
#import "MFSideMenu.h"

@implementation DetailController

-(void)viewDidLoad{
    [super viewDidLoad];
}

- (IBAction)showLeftSideMenu:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}
@end
