//
//  STKTableViewCell.m
//
//  Created by Joe Conway, Stable Kernel
//  Use it, share it, improve it.
//

#import "STKTableViewCell.h"

@interface STKTableViewCell ()

@property (nonatomic, weak) UITableView *owningTableView;
@property (nonatomic, weak) id actionTarget;

- (void)dispatchMessage:(SEL)msg toObject:(id)obj fromObject:(UIControl *)ctl;

@end

@implementation STKTableViewCell

+ (id)cellForTableView:(UITableView *)tv target:(id)target
{
    NSString *className = NSStringFromClass([self class]);
    
    STKTableViewCell *cell = [tv dequeueReusableCellWithIdentifier:className];
    if(!cell) {
        NSData *nibData = [NSData dataWithContentsOfFile:[[NSBundle mainBundle] pathForResource:className ofType:@"nib"]];
        if(nibData) {
            UINib *nib = [UINib nibWithData:nibData bundle:nil];
            [tv registerNib:nib forCellReuseIdentifier:className];
        } else
            [tv registerClass:self forCellReuseIdentifier:className];
        
        cell = [tv dequeueReusableCellWithIdentifier:className];
    }
    
    [cell setActionTarget:target];
    [cell setOwningTableView:tv];
        
    return cell;
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if(self) {
        [self cellDidLoad];
    }
    return self;
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self) {
        [self cellDidLoad];
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    [self layoutContent];
}

- (void)cellDidLoad
{
    // For override, does nothing initially
}

- (void)layoutContent
{
    // For override, does nothing initially
}


- (void)routeAction:(SEL)act fromObject:(id)obj
{
	[self dispatchMessage:act toObject:[self actionTarget] fromObject:obj];
}

- (void)dispatchMessage:(SEL)msg toObject:(id)obj fromObject:(UIControl *)ctl
{
	SEL newSel = NSSelectorFromString([NSStringFromSelector(msg) stringByAppendingFormat:@"atIndexPath:"]);
	NSIndexPath *ip = [[self owningTableView] indexPathForCell:self];
    if(ip) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Warc-performSelector-leaks"
        [obj performSelector:newSel withObject:ctl withObject:ip];
#pragma clang diagnostic pop

    }
}


@end
