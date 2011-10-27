//
//  GGRemoteListController.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 25/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGRemoteListController.h"
#import "GGActivityTableViewCell.h"
#import "GGRemoteObject.h"

@interface GGRemoteListController ()

- (void)loadObjectsAddingResults:(BOOL)addingResults;
- (void)configureCell:(UITableViewCell *)cell withObject:(GGRemoteObject *)object;

@property (nonatomic, strong, readonly) GGActivityTableViewCell *moreCell;

@end

@implementation GGRemoteListController

@synthesize game = _game;
@synthesize page = _page;
@synthesize delegate = _delegate;
@synthesize moreCell = _moreCell;

- (NSArray *)objects {
    return [NSArray arrayWithArray:_objects];
}

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
        
        _objects = [NSMutableArray array];
        _page = 1;
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
    [self loadObjectsAddingResults:NO];
}

- (void)cancel {
    if([_delegate respondsToSelector:@selector(remoteListControllerDidSelectListAction:)])
        [_delegate remoteListControllerDidSelectListAction:self];
}

- (void)loadObjectsAddingResults:(BOOL)addingResults {
    if(addingResults) {
        _moreCell.userInteractionEnabled = NO;
        [_moreCell startAnimating];
        _page++;
    }
    else {
        [_objects removeAllObjects];
        [self.tableView reloadData];
        [self showActivityWithMessage:@"Loading..."];
        _page = 1;
    }
    
    [[RKObjectManager sharedManager] loadObjectsAtResourcePath:[[[self.class objectClass] path]
                                                                appendQueryParams:[NSDictionary dictionaryWithObjectsAndKeys:
                                                                                   _game.uid, @"game",
                                                                                   [NSNumber numberWithUnsignedInteger:_page], @"page",
                                                                                   nil]]
                                                 objectMapping:[[self.class objectClass] mapping]
                                                      delegate:self];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects {
    NSMutableArray *indexPaths = [NSMutableArray array];
    
    for(NSInteger i = 0; i < objects.count; i++)
        [indexPaths addObject:[NSIndexPath indexPathForRow:_objects.count + i inSection:0]];

    if(_objects.count == 0) {
        [indexPaths addObject:[NSIndexPath indexPathForRow:objects.count inSection:0]];
        [self hideOverlayView];
    }
    else {
        [_moreCell stopAnimating];
        _moreCell.userInteractionEnabled = YES;
    }
    
    [_objects addObjectsFromArray:objects];
    [self.tableView insertRowsAtIndexPaths:indexPaths withRowAnimation:UITableViewRowAnimationAutomatic];
    
    if(_objects.count == 0)
        [self showMessage:[self emptyMessage]];
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error {
    [_objects removeAllObjects];
    [self.tableView reloadData];
    
    [self showMessage:[self errorMessage]];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.navigationController.navigationBar.tintColor = _game.color;
    self.tabBarController.tabBar.tintColor = _game.color;
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self loadObjectsAddingResults:NO];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _objects.count > 0 ? _objects.count + 1 : 0;
}

- (void)configureCell:(UITableViewCell *)cell withObject:(GGRemoteObject *)object {
    
}

- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex {
    GGRemoteObject *object = [_objects objectAtIndex:actionSheet.tag];
    
    if(buttonIndex == actionSheet.firstOtherButtonIndex)
        [[UIApplication sharedApplication] openURL:object.link];
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if(indexPath.row == _objects.count) {
        [self loadObjectsAddingResults:YES];
    }
    else {
        UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:nil
                                                           delegate:self
                                                  cancelButtonTitle:@"Cancel"
                                             destructiveButtonTitle:nil
                                                  otherButtonTitles:@"Open in Safari", nil];
        
        sheet.tag = indexPath.row;
        
        [sheet showInView:tableView];
    }
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    UITableViewCell *cell;
    
    if(indexPath.row == _objects.count) {
        _moreCell = [tableView dequeueReusableCellWithIdentifier:@"MoreCell"];
        
        if(!_moreCell)
            _moreCell = [[GGActivityTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"MoreCell"];
        
        _moreCell.titleLabel.text = @"Load more...";
        
        cell = _moreCell;
    }
    else {
        cell = [tableView dequeueReusableCellWithIdentifier:@"ObjectCell"];
        [self configureCell:cell withObject:[_objects objectAtIndex:indexPath.row]];
    }
    
    return cell;
}

@end
