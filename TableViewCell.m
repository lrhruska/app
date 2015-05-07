//
//  TableViewCell.m
//  This-Or-That
//
//  Created by Varun Tolani on 5/5/15.
//  Copyright (c) 2015 Lukas Hruska. All rights reserved.
//

#import "TableViewCell.h"

@implementation TableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (IBAction)voteThis {
    int currVote = [self.thisVote.text intValue];
    currVote += 1;
    self.thisVote.text = @(currVote).stringValue;
}

- (IBAction)voteThat{
    int currVote = [self.thatVote.text intValue];
    currVote += 1;
    self.thatVote.text = @(currVote).stringValue;
}

@end
