//
//  GGGameListController.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGGameListController.h"
#import "GGGame.h"

@interface GGGameListController ()

- (NSArray *)controllersForGame:(GGGame *)game;

@end

@implementation GGGameListController

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [GGGame all].count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    GGGame *game = [[GGGame all] objectAtIndex:indexPath.row];
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"GameCell"];
    cell.textLabel.text = game.description;
    cell.tag = indexPath.row;
    
    return cell;
}

- (void)remoteListControllerDidSelectListAction:(GGRemoteListController *)controller {
    [controller dismissModalViewControllerAnimated:YES];
}

- (void)channelsControllerDidCancel:(GGChannelsController *)controller {
    [controller dismissModalViewControllerAnimated:YES];
}

- (NSArray *)controllersForGame:(GGGame *)game {
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:@"SectionsStoryboard" bundle:nil];
    
    NSMutableArray *controllers = [NSMutableArray array];
    
    for(NSString *section in game.sections) {
        GGRemoteListController *controller = [storyboard instantiateViewControllerWithIdentifier:
                                              [NSString stringWithFormat:@"%@Controller", [section capitalizedString]]];
        controller.delegate = self;
        controller.game = game;
        [controllers addObject:[[UINavigationController alloc] initWithRootViewController:controller]];
    }
    
    return controllers;
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if([segue.identifier isEqualToString:@"SelectGame"]) {
        NSUInteger row = [sender tag];
        GGGame *game = [[GGGame all] objectAtIndex:row];
        
        UITabBarController *tabBarController = segue.destinationViewController;
        tabBarController.viewControllers = [self controllersForGame:game];
        [self.tableView deselectRowAtIndexPath:[NSIndexPath indexPathForRow:row inSection:0] animated:YES];
    }
    else if([segue.identifier isEqualToString:@"ManageChannels"]) {
        GGChannelsController *controller = (GGChannelsController *)((UINavigationController *)segue.destinationViewController).topViewController;
        controller.delegate = self;
    }
}

@end
