//
//  InfographsController.m
//  Derechos de la Infancia
//
//  Created by Daniel García Alvarado on 15/03/14.
//  Copyright (c) 2014 REDIM. All rights reserved.
//

#import "InfographsController.h"
#import "MFSideMenu.h"

@interface InfographsController ()

@end

@implementation InfographsController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.stateLabel.layer.borderWidth = 1.0f;
    self.stateLabel.layer.cornerRadius = 3.0f;
    self.stateLabel.layer.borderColor = [UIColor lightGrayColor].CGColor;
    
    self.downloadButton.backgroundColor = [UIColor colorWithRed:209.0/255.0 green:28.0/255.0 blue:26.0/255.0 alpha:1];
    self.downloadButton.layer.cornerRadius = 3.0f;
    [self.downloadButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showLeftSideMenu:(id)sender {
        [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}
@end
