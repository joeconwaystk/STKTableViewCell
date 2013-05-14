//
//  STKButtonCell.h
//  Cellulite
//
//  Created by Joe Conway on 5/13/13.
//  Copyright (c) 2013 Stable Kernel. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "STKTableViewCell.h"

@interface STKButtonCell : STKTableViewCell

@property (nonatomic, weak) IBOutlet UIButton *button;

- (IBAction)buttonTapped:(id)sender;

@end
