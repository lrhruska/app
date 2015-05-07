//
//  TableViewController.m
//  This-Or-That
//
//  Created by Varun Tolani on 5/5/15.
//  Copyright (c) 2015 Lukas Hruska. All rights reserved.
//

#import "TableViewController.h"
#import "TableViewCell.h"
@interface TableViewController ()

@end

@implementation TableViewController
//static NSArray* thisOrThats;
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.estimatedRowHeight = 60;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    
    [self loadQuestionData];
}


- (void) loadQuestionData {
    NSURL *url = [NSURL URLWithString:@"https://boiling-headland-8319.herokuapp.com/calpoly/getQuestions"];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request
                                       queue:[NSOperationQueue mainQueue]
                           completionHandler:^(NSURLResponse *response,
                                               NSData *data, NSError *connectionError)
     {
         if (data.length > 0 && connectionError == nil)
         {
             NSArray *results = [NSJSONSerialization JSONObjectWithData:data
                                                                options:0
                                                                  error:NULL];
             self.thisOrThats = results;
             [self.myView reloadData];
         }
     }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return [self.thisOrThats count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *CellIdentifier = @"Cell";
    int row = indexPath.row;
    TableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    if (cell == nil) {
        cell = [[TableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    }
    
    [cell.this adjustsFontSizeToFitWidth];
    [cell.that adjustsFontSizeToFitWidth];
    [cell.time adjustsFontSizeToFitWidth];
    cell.this.text = [self.thisOrThats[row] objectForKey:@"this"];
    cell.that.text = [self.thisOrThats[row] objectForKey:@"that"];
    int thisVote = (int) [self.thisOrThats[row] objectForKey:@"thisVote"];
    int thatVote = (int) [self.thisOrThats[row] objectForKey:@"thatVote"];
    cell.thisVote.text = @(thisVote).stringValue;
    cell.thatVote.text = @(thatVote).stringValue;
    cell.time.text = @"4 days ago";

    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 150;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

/*
 - (CLLocation *) getLocation {
 //    self.locationManager.delegate = self;
 if ([self.locationManager respondsToSelector:@selector(requestWhenInUseAuthorization)]) {
 [self.locationManager requestWhenInUseAuthorization];
 }
 [self.locationManager startUpdatingLocation];
 return [self.locationManager location];
 }
 
 - (IBAction)locationButtonClicked {
 CLLocationCoordinate2D currLocation = [[self getLocation] coordinate];
 NSNumber* latitude = [[NSNumber alloc] initWithDouble:currLocation.latitude];
 NSNumber* longitude = [[NSNumber alloc] initWithDouble:currLocation.longitude];
 NSDictionary *location = @{@"latitude": latitude, @"longitude": longitude};
 NSData *requestData = [NSJSONSerialization dataWithJSONObject:location options:nil error:nil];
 
 NSURL *url = [NSURL URLWithString:@"https://boiling-headland-8319.herokuapp.com/findSchool"];
 NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
 
 [request setHTTPMethod:@"POST"];
 [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
 [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
 [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[requestData length]] forHTTPHeaderField:@"Content-Length"];
 [request setHTTPBody: requestData];
 
 [NSURLConnection sendAsynchronousRequest:request
 queue:[NSOperationQueue mainQueue]
 completionHandler:^(NSURLResponse *response,
 NSData *data, NSError *connectionError)
 {
 if (connectionError == nil)
 {
 NSArray *result = [NSJSONSerialization JSONObjectWithData:data
 options:0
 error:NULL];
 self.schoolName = (NSString*) [result firstObject];
 
 self.schoolTitle.text = self.schoolName;
 }
 }];
 
 }
 */

@end
