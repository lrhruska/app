//
//  TableViewCell.h
//  This-Or-That
//
//  Created by Varun Tolani on 5/5/15.
//  Copyright (c) 2015 Lukas Hruska. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel* this;
@property (weak, nonatomic) IBOutlet UILabel* thisVote;
@property (weak, nonatomic) IBOutlet UILabel* that;
@property (weak, nonatomic) IBOutlet UILabel* thatVote;
@property (weak, nonatomic) IBOutlet UILabel* time;
@property NSInteger* questionNum;
- (IBAction) voteThis;
- (IBAction) voteThat;

@end
