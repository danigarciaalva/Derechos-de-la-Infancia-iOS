//
//  TweetCell.h
//  Derechos de la Infancia
//
//  Created by Daniel García Alvarado on 16/03/14.
//  Copyright (c) 2014 REDIM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TweetCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *text;
@property (weak, nonatomic) IBOutlet UIImageView *retweet;
@property (weak, nonatomic) IBOutlet UIImageView *reply;
@property (weak, nonatomic) IBOutlet UIImageView *favorite;
@property (weak, nonatomic) IBOutlet UILabel *date;
@property (weak, nonatomic) IBOutlet UILabel *screename;
@property (weak, nonatomic) NSString * id_str;
@end
