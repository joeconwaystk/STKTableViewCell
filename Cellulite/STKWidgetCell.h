//
//  STKWidgetCell.h
//  Cellulite
//
//  Created by Joe Conway on 5/13/13.
//  Copyright (c) 2013 Stable Kernel. All rights reserved.
//

#import "STKTableViewCell.h"

@interface STKWidgetCell : STKTableViewCell

@property (weak, nonatomic) IBOutlet UISlider *slider;
@property (weak, nonatomic) IBOutlet UITextField *textField;

- (IBAction)sliderValueChanged:(id)sender;
- (IBAction)textFieldFinished:(id)sender;

@end
