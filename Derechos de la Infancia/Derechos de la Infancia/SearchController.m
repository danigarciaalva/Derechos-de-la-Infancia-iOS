//
//  DetailController.m
//  Gastalón
//
//  Created by Daniel García Alvarado on 05/01/14.
//  Copyright (c) 2014 Dragonfly Labs. All rights reserved.
//

#import "SearchController.h"
#import "MFSideMenu.h"

#define kStatePickerCell 1
#define kGenderPickerCell 3
#define kPickerCellHeight 164

@interface SearchController(){
    NSArray * pickerStateItems;
    NSArray * pickerGenderItems;
    NSArray * pickerDomainItems;
    NSArray * pickerIndicatorItems;
    NSArray * pickerAgeItems;
    NSArray * pickerYearItems;
    int pickerShowed;
    BOOL showing;
}
@end

@implementation SearchController

static bool constList[6] = {false, false, false, false, false, false};

-(void)viewDidLoad{
    [super viewDidLoad];
    [self.tableView setSeparatorInset:UIEdgeInsetsZero];
    pickerStateItems = [NSArray arrayWithObjects:@"Aguascalientes",@"Baja California Sur",@"Baja California Norte",@"Campeche",@"Colima",@"Puebla", nil];
    pickerGenderItems = [NSArray arrayWithObjects:@"Niños",@"Niñas",@"Ambos",nil];
    pickerDomainItems = [NSArray arrayWithObjects:@"Demografía",@"Seguridad",@"Educación", nil];
    pickerIndicatorItems = [NSArray arrayWithObjects:@"Indicador 1",@"Indicador 2",@"Indicador 3",@"Indicador 4", nil];
    pickerAgeItems = [NSArray arrayWithObjects:@"0 - 13 años",@"4 - 17 años", nil];
    pickerYearItems = [NSArray arrayWithObjects:@"2001",@"2003",@"2004", nil];
    
    pickerShowed = 0;
    self.stateLabel.text = [pickerStateItems objectAtIndex:0];
    self.genderLabel.text = [pickerGenderItems objectAtIndex:0];
    showing = NO;
    self.view.backgroundColor = [UIColor colorWithRed:232.0/255.0 green:232.0/255.0 blue:232.0/255.0 alpha:1];
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    if(pickerView == self.statePicker) return pickerStateItems.count;
    else if (pickerView == self.genderPicker) return pickerGenderItems.count;
    else if (pickerView == self.domainPicker) return pickerDomainItems.count;
    else if (pickerView == self.indicatorPicker) return pickerIndicatorItems.count;
    else if (pickerView == self.agePicker) return pickerAgeItems.count;
    else if (pickerView == self.yearPicker) return pickerYearItems.count;
    return 0;
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    if(pickerView == self.statePicker) return [pickerStateItems objectAtIndex:row];
    else if(pickerView == self.genderPicker) return [pickerGenderItems objectAtIndex:row];
    else if(pickerView == self.domainPicker) return [pickerDomainItems objectAtIndex:row];
    else if(pickerView == self.indicatorPicker) return [pickerIndicatorItems objectAtIndex:row];
    else if(pickerView == self.agePicker) return [pickerAgeItems objectAtIndex:row];
    else if(pickerView == self.yearPicker) return [pickerYearItems objectAtIndex:row];
    return @"Somethings wrong";
}

-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    if(pickerView == self.statePicker) self.stateLabel.text = [pickerStateItems objectAtIndex:row];
    else if(pickerView == self.genderPicker) self.genderLabel.text = [pickerGenderItems objectAtIndex:row];
    else if(pickerView == self.domainPicker) self.domainLabel.text = [pickerDomainItems objectAtIndex:row];
    else if(pickerView == self.indicatorPicker) self.indicatorLabel.text = [pickerIndicatorItems objectAtIndex:row];
    else if(pickerView == self.agePicker) self.ageLabel.text = [pickerAgeItems objectAtIndex:row];
    else if(pickerView == self.yearPicker) self.yearLabel.text = [pickerYearItems objectAtIndex:row];
}
- (IBAction)showLeftSideMenu:(id)sender {
    [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CGFloat height = self.tableView.rowHeight;
    if (indexPath.row == 13)
        return height;
    else if(indexPath.row == 12)
        return 30.0f;
    else if(indexPath.row % 2 != 0)
        return (constList[indexPath.row/2]) ? kPickerCellHeight : 0.0f;
    return height;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    if (indexPath.row == 13) {
        return;
    }
    if (indexPath.row % 2 == 0) {
        [self hidePickerCell];
        [self showPickerCell:((int)indexPath.row+1)/2];
    }
}

- (void)showPickerCell:(int)position {
    if (position != pickerShowed || !showing) {
        constList[position] = true;
        pickerShowed = position;
        [self.tableView beginUpdates];
        [self.tableView endUpdates];
        showing = YES;
    }else{
        showing = NO;
    }
}

- (void)hidePickerCell {
    constList[pickerShowed] = false;
    [self.tableView beginUpdates];
    [self.tableView endUpdates];
}

@end
