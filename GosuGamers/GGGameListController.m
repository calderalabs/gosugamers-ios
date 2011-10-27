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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = [UIColor colorWithRed:0/255.0
                                                                        green:100/255.0
                                                                         blue:113/255.0
                                                                        alpha:1];
    
    
    self.tableView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TableBackground"]];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

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
    }
}

@end
