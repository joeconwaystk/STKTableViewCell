//
//  STKTableViewCell.h
//
//  Created by Joe Conway, Stable Kernel
//  Use it, share it, improve it.
//

#import <UIKit/UIKit.h>

#define ROUTE(x) [self routeAction:_cmd fromObject:x]

@interface STKTableViewCell : UITableViewCell

+ (id)cellForTableView:(UITableView *)tv target:(id)target;

// Add subviews to content view if not loading from a XIB
// or, additional configuration step for content views from a XIB.
// No need to call super, it does nothing.
- (void)cellDidLoad;

// Override this method to layout content views when not using
// autolayout or autoresizing masks. Called by layoutSubviews.
// No need to call super, it does nothing.
- (void)layoutContent;

- (void)routeAction:(SEL)act fromObject:(id)obj;

@end
