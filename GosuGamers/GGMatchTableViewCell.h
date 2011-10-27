//
//  GGMatchTableViewCell.h
//  GosuGamers
//
//  Created by Eugenio Depalo on 26/10/11.
//  Copyright (c) 2011 Eugenio Depalo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GGMatchTableViewCell : UITableViewCell

@property (nonatomic, strong, readonly) IBOutlet UILabel *playerOneLabel;
@property (nonatomic, strong, readonly) IBOutlet UILabel *playerTwoLabel;
@property (nonatomic, strong, readonly) IBOutlet UILabel *dateLabel;
@property (nonatomic, strong, readonly) IBOutlet UILabel *bottomRightDetailLabel;
@property (nonatomic, strong, readonly) IBOutlet UILabel *bottomLeftDetailLabel;

@end
