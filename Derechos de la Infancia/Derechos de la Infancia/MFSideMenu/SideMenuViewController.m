//
//  SideMenuViewController.m
//  MFSideMenuDemo
//
//  Created by Michael Frederick on 3/19/12.

#import "SideMenuViewController.h"
#import "MFSideMenu.h"
#import "DetailController.h"
#import "AppDelegate.h"

@interface SideMenuViewController(){
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
    [self.tableView setBackgroundView:[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"red.png"]]];
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath
{
    [cell setBackgroundColor:[UIColor clearColor]];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    UIView * view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, self.tableView.bounds.size.width, 30)];
    [view setBackgroundColor:[UIColor clearColor]];
    return view;
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
    /*            ConfigController *controller = [self.storyboard instantiateViewControllerWithIdentifier:@"ConfigController"];
            UINavigationController *navigationController = self.menuContainerViewController.centerViewController;
            NSArray *controllers = [NSArray arrayWithObject:controller];
            navigationController.viewControllers = controllers;
    */
   [self.menuContainerViewController setMenuState:MFSideMenuStateClosed];
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
