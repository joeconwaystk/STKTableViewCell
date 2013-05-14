//
//  STKWidgetCell.m
//  Cellulite
//
//  Created by Joe Conway on 5/13/13.
//  Copyright (c) 2013 Stable Kernel. All rights reserved.
//

#import "STKWidgetCell.h"

@interface STKWidgetCell () <UITextFieldDelegate>
@end

@implementation STKWidgetCell

- (IBAction)sliderValueChanged:(id)sender
{
    ROUTE(sender);
}

- (IBAction)textFieldFinished:(id)sender
{
    ROUTE(sender);    
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}

@end
