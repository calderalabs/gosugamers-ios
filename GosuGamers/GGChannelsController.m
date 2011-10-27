//
//  GGManageChannelsController.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 27/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGChannelsController.h"
#import "Parse/Parse.h"
#import "GGGame.h"
#import "GGSwitchTableViewCell.h"

@implementation GGChannelsController

@synthesize delegate = _delegate;
@synthesize channels = _channels;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self showActivityWithMessage:@"Loading..."
                            color:[UIColor whiteColor]
           activityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    [PFPush getSubscribedChannelsInBackgroundWithBlock:^(NSSet *channels, NSError *error) {
        if(!error)
            [self showMessage:@"There was an error loading the channels from the server." color:[UIColor whiteColor]];
        else {
            _channels = channels;
            [self.tableView reloadData];
            [self hideOverlayView];
        }
    }];
}

- (IBAction)cancel:(id)sender {
    if([_delegate respondsToSelector:@selector(channelsControllerDidCancel:)])
        [_delegate channelsControllerDidCancel:self];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [GGGame all].count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    GGGame *game = [[GGGame all] objectAtIndex:section];
    return game.sections.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    GGGame *game = [[GGGame all] objectAtIndex:section];
    return game.description;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GGGame *game = [[GGGame all] objectAtIndex:indexPath.section];
    NSString *section = [game.sections objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChannelCell"];
    
    GGSwitchTableViewCell *channelCell = (GGSwitchTableViewCell *)cell;
    channelCell.titleLabel.text = [section capitalizedString];
    
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString *title = [self tableView:tableView titleForHeaderInSection:section];
    
    UIView *view = [[UIView alloc] init];
    
    UILabel *label = [[UILabel alloc] init];
    label.backgroundColor = [UIColor clearColor];
    label.textColor = [UIColor whiteColor];
    label.shadowColor = [UIColor blackColor];
    label.shadowOffset = CGSizeMake(0.0, 1.0);
    label.font = [UIFont boldSystemFontOfSize:16];
    label.text = title;
    [label sizeToFit];
    label.frame = CGRectMake(20, 0, label.frame.size.width, label.frame.size.height);
    [view addSubview:label];
    
    return view;
}

@end
