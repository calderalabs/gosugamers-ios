//
//  GGViewController.m
//  GosuGamers
//
//  Created by Eugenio Depalo on 27/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import "GGViewController.h"

@implementation GGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"TableBackground"]];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
