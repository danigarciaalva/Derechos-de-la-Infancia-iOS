//
//  DetailController.h
//  Gastalón
//
//  Created by Daniel García Alvarado on 05/01/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchController : UIViewController
@property (weak, nonatomic) IBOutlet UIButton *goButton;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UILabel *sexLabel;
@property (weak, nonatomic) IBOutlet UILabel *indicatorLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UILabel *domainLabel;
@end
