//
//  DetailController.m
//  Gastalón
//
//  Created by Daniel García Alvarado on 05/01/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import "SearchController.h"
#import "MFSideMenu.h"

@implementation SearchController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.goButton.backgroundColor = [UIColor colorWithRed:209.0/255.0 green:28.0/255.0 blue:26.0/255.0 alpha:0.8];
    self.goButton.layer.cornerRadius = 3.0f;
    [self.goButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    self.stateLabel.layer.borderWidth = 1.0f;
    self.stateLabel.layer.cornerRadius = 3.0f;
    self.stateLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.sexLabel.layer.borderWidth = 1.0f;
    self.sexLabel.layer.cornerRadius = 3.0f;
    self.sexLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.domainLabel.layer.borderWidth = 1.0f;
    self.domainLabel.layer.cornerRadius = 3.0f;
    self.domainLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.indicatorLabel.layer.borderWidth = 1.0f;
    self.indicatorLabel.layer.cornerRadius = 3.0f;
    self.indicatorLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.ageLabel.layer.borderWidth = 1.0f;
    self.ageLabel.layer.cornerRadius = 3.0f;
    self.ageLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    self.yearLabel.layer.borderWidth = 1.0f;
    self.yearLabel.layer.cornerRadius = 3.0f;
    self.yearLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.stateLabel.userInteractionEnabled = YES;
    UITapGestureRecognizer *tapGesture =
    [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(imprime)];
    [self.stateLabel addGestureRecognizer:tapGesture];
}

-(void)imprime{
    NSLog(@"Holi :3");
}
-(void)showPicker{
    NSLog(@"Holi :3");
}

- (IBAction)showLeftSideMenu:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}
@end
