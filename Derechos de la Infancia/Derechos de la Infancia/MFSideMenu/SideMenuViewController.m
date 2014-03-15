//
//  SideMenuViewController.m
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.
/*
#import "SideMenuViewController.h"
#import "MFSideMenu.h"
#import "MainController.h"
#import "ConfigController.h"
#import "MenuCell.h"
#import "ProfileController.h"
#import "DetailController.h"
#import "ConfigCell.h"
#import "AppDelegate.h"
#import "TutorialController.h"

@interface SideMenuViewController(){
    NSArray * dummyMenu;
    UITableView * tableViewSelected;
    NSIndexPath * indexPathSelected;
}
@end
@implementation SideMenuViewController

-(void)viewDidLoad{
    [self.menuContainerViewController.shadow setEnabled:YES];
    [self.menuContainerViewController.shadow setRadius:0.0f];
    [self.menuContainerViewController.shadow setColor:[UIColor greenColor]];
    [self.menuContainerViewController.shadow setOpacity:0.35f];
    [self.menuContainerViewController setMenuSlideAnimationEnabled:YES];
    [self.menuContainerViewController setMenuSlideAnimationFactor:1.0f];
    
    [self.tableviewAccounts setBackgroundColor:[UIColor clearColor]];
    [self.tableViewProfile setBackgroundColor:[UIColor clearColor]];
    [self.tableViewSettings setBackgroundColor:[UIColor clearColor]];
    
    dummyMenu = [[NSArray alloc] initWithObjects:@"Cuenta 1", @"Cuenta 2",@"+ Añadir Cuenta", nil];
    
}

#pragma mark - UITableViewDelegate, UITableViewDataSource

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if(tableView == _tableViewProfile && indexPath.row == 0 && indexPath.section == 0){
        return 135;
    }else{
        return 44;
    }
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (tableView == _tableViewProfile) {
        if(indexPath.row == 0 && indexPath.section == 0){
            MenuCell * cell = (MenuCell *)[tableView dequeueReusableCellWithIdentifier:@"ProfileCell"];
            cell.imageProfile.image = [UIImage imageNamed:@"photo.jpg"];
            cell.imageProfile.layer.masksToBounds = YES;
            cell.imageProfile.layer.cornerRadius = 40.0f;
            cell.profileName.text = @"Daniel García";
            return cell;
        }else{
            ConfigCell * cell = (ConfigCell *)[tableView dequeueReusableCellWithIdentifier:@"SettingsCell"];
            cell.titleView.text = @"Resumen";
            cell.imageViewCell.image = [UIImage imageNamed:@"home.png"];
            return cell;
        }
        
    }else if(tableView == _tableviewAccounts){
        UITableViewCell * cell = (UITableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"AccountsCell"];
        cell.textLabel.text = [dummyMenu objectAtIndex:indexPath.row];
        return cell;
    }else if (tableView == _tableViewSettings){
        ConfigCell * cell = (ConfigCell *)[tableView dequeueReusableCellWithIdentifier:@"SettingsCell2"];
        NSArray * items = [[NSArray alloc] initWithObjects:@"Configuración",@"Cerrar Sesión", nil];
        cell.titleView.text = [items objectAtIndex:indexPath.row];
        cell.imageViewCell.image = [UIImage imageNamed:@"settings.png"];
        return cell; 
    }
    return nil;
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(tableView == self.tableViewProfile){
        return 2;
    }else if (tableView == self.tableviewAccounts){
        return dummyMenu.count;
    }else if (tableView == self.tableViewSettings){
        return 2;
    }
    return 0;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSIndexPath *)tableView:(UITableView *)tableView willSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell * cell = (UITableViewCell*)[tableView cellForRowAtIndexPath:indexPath];
    UIView *customColorView = [[UIView alloc] init];
    customColorView.backgroundColor = [UIColor colorWithRed:179/255.0 green:119/255.0 blue:0 alpha:0.8];
    cell.selectedBackgroundView =  customColorView;
    return indexPath;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableViewSelected deselectRowAtIndexPath:indexPathSelected animated:NO];
    tableViewSelected = tableView;
    indexPathSelected = indexPath;
    
    if(tableView == _tableViewProfile){
        if (indexPath.row == 0) {
            ProfileController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:controller];
            navigationController.viewControllers = controllers;
        }else{
            MainController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"MainController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:controller];
            navigationController.viewControllers = controllers;
        }
    }else if (tableView == _tableviewAccounts){
            DetailController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"DetailController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:controller];
            navigationController.viewControllers = controllers;

    }else{
        if(indexPath.row == 1){
            [self logout:self];
        }else{
            ConfigController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ConfigController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:controller];
            navigationController.viewControllers = controllers;
        }
    }
   [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
}

- (void)logout:(id)sender {
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"¿Estás seguro que deseas cerrar sesión?" delegate:self cancelButtonTitle:@"Cancelar" destructiveButtonTitle:@"Sí, seguro" otherButtonTitles:nil, nil];
    [actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}

-(void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
        {
            UIAlertView * alerta = [[UIAlertView alloc] initWithTitle:@"Cerrar sesión" message:@"Ya cerré tu sesión :)" delegate:nil cancelButtonTitle:@"Cerrar" otherButtonTitles:nil, nil];
            [alerta show];
        }
        case 1: break;
        default:
            break;
    }
}
@end
*/