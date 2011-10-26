//
//  GGRemoteListController.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "GGRemoteListController.h"

@interface GGRemoteListController ()

- (void)loadObjects;
- (void)configureCell:(UITableViewCell *)cell withObject:(id)object;
- (void)showLoading:(BOOL)show;

@end

@implementation GGRemoteListController

@synthesize game = _game;
@synthesize objects = _objects;

+ (id)objectClass {
    return nil;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if((self = [super initWithCoder:aDecoder])) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemCancel
                                                                                              target:self
                                                                                              action:@selector(cancel)];
    }
    
    return self;
}

- (void)cancel {
    [self dismissModalViewControllerAnimated:YES];
}

- (void)loadObjects {
    [self showLoading:YES];
    
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:[[[self.class objectClass] path]
                                                                appendQueryParams:[NSDictionary dictionaryWithObject:_game.uid forKey:@"game"]]
                                                                objectMapping:[[self.class objectClass] mapping]
                                                                delegate:self];
}

- (void)showLoading:(BOOL)show {
    if(show) {
        [_loadingView removeFromSuperview];
        _loadingView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
        _loadingView.alpha = 1.0;
        [_loadingView startAnimating];
        [self.view addSubview:_loadingView];
        
        [UIView animateWithDuration:0.2 animations:^{ _loadingView.alpha = 1.0; }];
    } else {
        [UIView animateWithDuration:0.2
                         animations:^{ _loadingView.alpha = 0.0; }
                         completion:^(BOOL finished){ [_loadingView removeFromSuperview]; }];
    }
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    _objects = objects;
    
    [self.tableView reloadData];
    [self showLoading:NO];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error {
    [self.tableView reloadData];
    [self showLoading:NO];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self loadObjects];
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
    return _objects.count;
}

- (void)configureCell:(UITableViewCell *)cell withObject:(id)object {
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ObjectCell"];
    [self configureCell:cell withObject:[_objects objectAtIndex:indexPath.row]];
    
    return cell;
}

@end
