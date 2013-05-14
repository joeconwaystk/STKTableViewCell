//
//  STKViewController.m
//  Cellulite
//
//  Created by Joe Conway on 5/13/13.
//  Copyright (c) 2013 Stable Kernel. All rights reserved.
//

#import "STKViewController.h"
#import "STKButtonCell.h"
#import "STKWidgetCell.h"

@interface STKViewController () <UITableViewDataSource, UITableViewDelegate>

@end

@implementation STKViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (int)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (float)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath row] == 1) {
        return 116;
    }
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if([indexPath row] == 0)
        return [STKButtonCell cellForTableView:tableView target:self];
    if([indexPath row] == 1)
        return [STKWidgetCell cellForTableView:tableView target:self];

    return nil;
}

- (void)buttonTapped:(UIButton *)sender atIndexPath:(NSIndexPath *)ip
{
    NSLog(@"Button in row %d tapped", [ip row]);
}

- (void)sliderValueChanged:(UISlider *)sender atIndexPath:(NSIndexPath *)ip
{
    NSLog(@"The value of the slider at %d is %f", [ip row], [sender value]);
}

- (void)textFieldFinished:(UITextField *)sender atIndexPath:(NSIndexPath *)ip
{
    NSLog(@"The text at row %d is %@", [ip row], [sender text]);
}

@end
