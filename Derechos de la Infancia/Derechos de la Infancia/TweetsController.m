//
//  TweetsController.m
//  Derechos de la Infancia
//
//  Created by Daniel García Alvarado on 15/03/14.
//  Copyright (c) 2014 REDIM. All rights reserved.
//

#import "TweetsController.h"
#import "MFSideMenu.h"
#import <Accounts/Accounts.h>
#import <Social/Social.h>
#import "TweetCell.h"

@interface TweetsController ()
@property (strong, nonatomic) NSArray * tweets;
@property (strong, nonatomic) NSDictionary * user;
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
    [self twitterTimeline];
}

-(void)twitterTimeline{
    ACAccountStore *account = [[ACAccountStore alloc] init];
    ACAccountType *accountType = [account accountTypeWithAccountTypeIdentifier:ACAccountTypeIdentifierTwitter];
    [account requestAccessToAccountsWithType:accountType options:nil completion:^(BOOL granted, NSError *error)
     {
         if (granted == YES){
             NSArray *arrayOfAccounts = [account accountsWithAccountType:accountType];
             if ([arrayOfAccounts count] > 0) {
                 ACAccount *twitterAccount = [arrayOfAccounts lastObject];
                 NSURL *requestAPI2 = [NSURL URLWithString:@"https://api.twitter.com/1.1/users/show.json"];
                 NSMutableDictionary *parameters2 = [[NSMutableDictionary alloc] init];
                 [parameters2 setObject:@"7239542" forKey:@"user_id"];
                 [parameters2 setObject:@"derechoinfancia" forKey:@"screen_name"];
                 SLRequest *posts2 = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:requestAPI2 parameters:parameters2];
                 posts2.account = twitterAccount;
                 //NSLog(@"%@",posts.account);
                 [posts2 performRequestWithHandler:
                  ^(NSData *response, NSHTTPURLResponse
                    *urlResponse, NSError *error)
                  {
                      self.user = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
                      NSURL *requestAPI = [NSURL URLWithString:@"https://api.twitter.com/1.1/statuses/user_timeline.json"];
                      NSMutableDictionary *parameters = [[NSMutableDictionary alloc] init];
                      [parameters setObject:@"30" forKey:@"count"];
                      [parameters setObject:@"false" forKey:@"include_entities"];
                      [parameters setObject:[self.user objectForKey:@"screen_name"] forKey:@"screen_name"];
                      [parameters setObject:@"t" forKey:@"trim_user"];
                      SLRequest *posts = [SLRequest requestForServiceType:SLServiceTypeTwitter requestMethod:SLRequestMethodGET URL:requestAPI parameters:parameters];
                      posts.account = twitterAccount;
                      //NSLog(@"%@",posts.account);
                      [posts performRequestWithHandler:
                       ^(NSData *response, NSHTTPURLResponse
                         *urlResponse, NSError *error)
                       {
                           self.tweets = [NSJSONSerialization JSONObjectWithData:response options:NSJSONReadingMutableLeaves error:&error];
                           
                           if (self.tweets.count != 0) {
                               dispatch_async(dispatch_get_main_queue(), ^{
                                   [self.tableView reloadData];
                               });
                           }
                       }];
                  }];
             }
             
         } else {
             NSLog(@"%@", [error localizedDescription]);
         }
     }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showLeftSideMenu:(id)sender {
        [self.menuContainerViewController toggleLeftSideMenuCompletion:nil];
}

#pragma mark UITableViewDataSource, UITableViewDelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.tweets.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * identifier = @"tweetCell";
    TweetCell * cell = (TweetCell *)[tableView dequeueReusableCellWithIdentifier:identifier];
    NSDictionary * tweet = self.tweets[indexPath.row];
    cell.screename.text = tweet[@"screen_name"];
    cell.text.text = tweet[@"text"];
    [cell.text setFont:[UIFont fontWithName:@"HelveticaNeue-Thin" size:13]];
    [cell.text setUserInteractionEnabled:NO];
    cell.id_str = tweet[@"id_str"];
    cell.date.text = tweet[@"created_at"];
    cell.screename.text = [self.user objectForKey:@"name"];
    return cell;
}
@end
