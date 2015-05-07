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
    
    
    NSURL *url = [NSURL URLWithString:@"https://boiling-headland-8319.herokuapp.com/calpoly/vote/2?this=true"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"PATCH"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (connectionError != nil)
         {
             NSLog(@"Your Connection Sucks");
         }
     }];

}

- (IBAction)voteThat{
    int currVote = [self.thatVote.text intValue];
    currVote += 1;
    self.thatVote.text = @(currVote).stringValue;
    
    NSURL *url = [NSURL URLWithString:@"https://boiling-headland-8319.herokuapp.com/calpoly/vote/2"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    
    [request setHTTPMethod:@"PATCH"];
    
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (connectionError != nil)
         {
             NSLog(@"Your Connection Sucks");
         }
     }];
}

@end
