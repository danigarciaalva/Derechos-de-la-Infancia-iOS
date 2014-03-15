//
//  TweetsController.m
//  Derechos de la Infancia
//
//  Created by Daniel García Alvarado on 15/03/14.
//  Copyright (c) 2014 REDIM. All rights reserved.
//

#import "TweetsController.h"
#import "MFSideMenu.h"

@interface TweetsController ()

@end

@implementation TweetsController

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
    self.view.backgroundColor = [UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1];
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
