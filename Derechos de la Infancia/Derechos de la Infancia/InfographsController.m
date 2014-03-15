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
	// Do any additional setup after loading the view.
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
