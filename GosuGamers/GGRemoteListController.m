//
//  GGRemoteListController.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGRemoteListController.h"
#import "GGActivityLabel.h"

@interface GGRemoteListController ()

- (void)loadObjects;
- (void)configureCell:(UITableViewCell *)cell withObject:(id)object;
- (void)showMessage:(NSString *)message;
- (void)showOverlayView:(UIView *)view;
- (void)hideOverlayView;

@end

@implementation GGRemoteListController

@synthesize game = _game;
@synthesize objects = _objects;
@synthesize tableView = _tableView;
@synthesize delegate = _delegate;

+ (id)objectClass {
    return nil;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    if((self = [super initWithCoder:aDecoder])) {
        self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"List"]
                                                                                 style:UIBarButtonItemStyleBordered target:self
                                                                                action:@selector(cancel)];
        self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh
                                                                                               target:self
                                                                                               action:@selector(refresh)];
    }
    
    return self;
}

- (NSString *)emptyMessage {
    return nil;
}

- (NSString *)errorMessage {
    return @"There was an error loading data from the server.";
}

- (void)refresh {
    [self loadObjects];
}

- (void)cancel {
    if([_delegate respondsToSelector:@selector(remoteListControllerDidSelectListAction:)])
        [_delegate remoteListControllerDidSelectListAction:self];
}

- (void)loadObjects {
    GGActivityLabel *loadingView = [[GGActivityLabel alloc] initWithStyle:UIActivityIndicatorViewStyleGray];
    loadingView.label.text = @"Loading...";
    [loadingView sizeToFit];
    loadingView.autoresizingMask =
    UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleBottomMargin;
    loadingView.frame = CGRectMake(floor((self.view.frame.size.width - loadingView.frame.size.width) / 2),
                                   floor((self.view.frame.size.height - loadingView.frame.size.height) / 2),
                                   loadingView.frame.size.width,
                                   loadingView.frame.size.height);
    
    [self showOverlayView:loadingView];
    
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:[[[self.class objectClass] path]
                                                                appendQueryParams:[NSDictionary dictionaryWithObject:_game.uid forKey:@"game"]]
                                                 objectMapping:[[self.class objectClass] mapping]
                                                      delegate:self];
}

- (void)showOverlayView:(UIView *)view {
    [_overlayView removeFromSuperview];
    _overlayView = view;
    _overlayView.alpha = 0.0;
    [self.view addSubview:_overlayView];
    [UIView animateWithDuration:0.2 animations:^{
        _overlayView.alpha = 1.0;
        _tableView.alpha = 0.0;
    }];
}

- (void)hideOverlayView {
    [UIView animateWithDuration:0.2
                     animations:^{
                         _overlayView.alpha = 0.0;
                         _tableView.alpha = 1.0;
                     }
                     completion:^(BOOL finished){ [_overlayView removeFromSuperview]; }];
}

- (void)showMessage:(NSString *)message {
    UILabel *messageLabel = [[UILabel alloc] init];
    messageLabel.backgroundColor = [UIColor clearColor];
    messageLabel.font = [UIFont boldSystemFontOfSize:14.0];
    messageLabel.numberOfLines = 0;
    messageLabel.textAlignment = UITextAlignmentCenter;
    messageLabel.text = message;
    CGSize labelSize = [messageLabel.text sizeWithFont:messageLabel.font
                                     constrainedToSize:CGSizeMake(self.view.frame.size.width - 20, CGFLOAT_MAX)];
    
    messageLabel.frame = CGRectMake(floor((self.view.frame.size.width - labelSize.width) / 2),
                                    floor((self.view.frame.size.height - labelSize.height) / 2),
                                    labelSize.width,
                                    labelSize.height);
    messageLabel.autoresizingMask =
    UIViewAutoresizingFlexibleRightMargin |
    UIViewAutoresizingFlexibleLeftMargin |
    UIViewAutoresizingFlexibleTopMargin |
    UIViewAutoresizingFlexibleBottomMargin;
    
    [self showOverlayView:messageLabel];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    _objects = objects;
    [_tableView reloadData];
    
    NSString *emptyMessage = [self emptyMessage];
    
    if(_objects.count == 0 && emptyMessage)
        [self showMessage:emptyMessage];
    else
        [self hideOverlayView];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error {
    [_tableView reloadData];
    
    [self showMessage:[self errorMessage]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = _game.color;
    self.tabBarController.tabBar.tintColor = _game.color;
    
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self loadObjects];
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
