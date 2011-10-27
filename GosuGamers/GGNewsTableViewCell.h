//
//  GGNewsTableViewCell.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 26/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGNewsTableViewCell : UITableViewCell

@property (nonatomic, strong, readonly) IBOutlet UILabel *titleLabel;
@property (nonatomic, strong, readonly) IBOutlet UILabel *topDetailLabel;
@property (nonatomic, strong, readonly) IBOutlet UILabel *dateLabel;

@end
