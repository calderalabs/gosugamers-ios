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

@interface GGChannelsController ()

- (NSString *)channelNameForIndexPath:(NSIndexPath *)indexPath;
    
@end

@implementation GGChannelsController

@synthesize delegate = _delegate;

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self showActivityWithMessage:@"Loading..."
                            color:[UIColor whiteColor]
           activityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    [PFPush getSubscribedChannelsInBackgroundWithBlock:^(NSSet *channels, NSError *error) {
        if(error)
            [self showMessage:@"There was an error loading the channels from the server." color:[UIColor whiteColor]];
        else {
            _channels = [NSMutableSet setWithSet:channels];
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

- (NSString *)channelNameForIndexPath:(NSIndexPath *)indexPath {
    GGGame *game = [[GGGame all] objectAtIndex:indexPath.section];
    NSString *section = [game.sections objectAtIndex:indexPath.row];
    
    return [NSString stringWithFormat:@"%@_%@", game.uid, section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GGGame *game = [[GGGame all] objectAtIndex:indexPath.section];
    NSString *section = [game.sections objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ChannelCell"];
    
    GGSwitchTableViewCell *channelCell = (GGSwitchTableViewCell *)cell;
    channelCell.titleLabel.text = [section capitalizedString];
    channelCell.switchView.on = [_channels containsObject:[self channelNameForIndexPath:indexPath]];
    channelCell.delegate = self;
    
    return cell;
}

- (void)switchTableViewCellDidChangeValue:(GGSwitchTableViewCell *)cell {
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    NSString *channel = [self channelNameForIndexPath:indexPath];
    
    if(cell.switchView.on) {
        [_channels addObject:channel];
        [PFPush subscribeToChannelInBackground:[self channelNameForIndexPath:indexPath]];
    }
    else {
        [_channels removeObject:channel];
        [PFPush unsubscribeFromChannelInBackground:channel];
    }
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
