//
//  InfographsController.h
//  Derechos de la Infancia
//
//  Created by Daniel García Alvarado on 15/03/14.
//  Copyright (c) 2014 REDIM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface InfographsController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UIButton *downloadButton;

- (IBAction)showLeftSideMenu:(id)sender;
@end
