//
//  DetailController.h
//  Gastalón
//
//  Created by Daniel García Alvarado on 05/01/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SearchController : UITableViewController<UIPickerViewDataSource, UIPickerViewDelegate>
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *statePicker;
@property (weak, nonatomic) IBOutlet UILabel *genderLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *genderPicker;
@property (weak, nonatomic) IBOutlet UILabel *domainLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *domainPicker;
@property (weak, nonatomic) IBOutlet UILabel *indicatorLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *indicatorPicker;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *agePicker;
@property (weak, nonatomic) IBOutlet UILabel *yearLabel;
@property (weak, nonatomic) IBOutlet UIPickerView *yearPicker;
@end
