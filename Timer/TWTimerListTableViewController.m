//
//  TWTimerListTableViewController.m
//  Timer
//
//  Created by TerryWong on 2018/10/18.
//  Copyright © 2018年 Apple. All rights reserved.
//

#import "TWTimerListTableViewController.h"
#import "TimerDetailViewController.h"

@interface TWTimerListTableViewController ()<TimerDetailViewControllerProtocal>

@end

@implementation TWTimerListTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    MGSwipeTableCell * cell = [[MGSwipeTableCell alloc]init];
    cell.textLabel.text = @"www";
    cell.delegate = self ;
    return cell;
}

-(BOOL) swipeTableCell:(MGSwipeTableCell*) cell canSwipe:(MGSwipeDirection) direction;
{
    return YES;
}

-(NSArray*) swipeTableCell:(MGSwipeTableCell*) cell swipeButtonsForDirection:(MGSwipeDirection)direction
             swipeSettings:(MGSwipeSettings*) swipeSettings expansionSettings:(MGSwipeExpansionSettings*) expansionSettings
{
    
    swipeSettings.transition = MGSwipeTransitionBorder;
    expansionSettings.buttonIndex = 0;
    
    __weak TWTimerListTableViewController * me = self;
    
    if (direction == MGSwipeDirectionLeftToRight) {
        
        expansionSettings.fillOnTrigger = NO;
        expansionSettings.threshold = 2;
        return @[[MGSwipeButton buttonWithTitle:@"xx" backgroundColor:[UIColor colorWithRed:0 green:122/255.0 blue:1.0 alpha:1.0] padding:5 callback:^BOOL(MGSwipeTableCell *sender) {
            [cell refreshContentView]; //needed to refresh cell contents while swipping
            
            //change button text
            [(UIButton*)[cell.leftButtons objectAtIndex:0] setTitle:@"" forState:UIControlStateNormal];
            
            return YES;
        }]];
    }
    else {
        
        expansionSettings.fillOnTrigger = YES;
        expansionSettings.threshold = 1.1;
        
        CGFloat padding = 15;
        
        MGSwipeButton * trash = [MGSwipeButton buttonWithTitle:@"Trash" backgroundColor:[UIColor colorWithRed:1.0 green:59/255.0 blue:50/255.0 alpha:1.0] padding:padding callback:^BOOL(MGSwipeTableCell *sender) {
            
            NSIndexPath * indexPath = [me.tableView indexPathForCell:sender];
            return NO; //don't autohide to improve delete animation
        }];
        MGSwipeButton * flag = [MGSwipeButton buttonWithTitle:@"Flag" backgroundColor:[UIColor colorWithRed:1.0 green:149/255.0 blue:0.05 alpha:1.0] padding:padding callback:^BOOL(MGSwipeTableCell *sender) {
            [cell refreshContentView]; //needed to refresh cell contents while swipping
            return YES;
        }];
        MGSwipeButton * more = [MGSwipeButton buttonWithTitle:@"More" backgroundColor:[UIColor colorWithRed:200/255.0 green:200/255.0 blue:205/255.0 alpha:1.0] padding:padding callback:^BOOL(MGSwipeTableCell *sender) {
            
            NSIndexPath * indexPath = [me.tableView indexPathForCell:sender];
            MGSwipeTableCell * cell = (MGSwipeTableCell*) sender;
            [cell hideSwipeAnimated:YES];
            
            return NO; //avoid autohide swipe
        }];
        
        return @[trash, flag, more];
    }
    
    return nil;
    
}

-(void) swipeTableCell:(MGSwipeTableCell*) cell didChangeSwipeState:(MGSwipeState)state gestureIsActive:(BOOL)gestureIsActive
{
    NSString * str;
    switch (state) {
        case MGSwipeStateNone: str = @"None"; break;
        case MGSwipeStateSwippingLeftToRight: str = @"SwippingLeftToRight"; break;
        case MGSwipeStateSwippingRightToLeft: str = @"SwippingRightToLeft"; break;
        case MGSwipeStateExpandingLeftToRight: str = @"ExpandingLeftToRight"; break;
        case MGSwipeStateExpandingRightToLeft: str = @"ExpandingRightToLeft"; break;
    }
    NSLog(@"Swipe state: %@ ::: Gesture: %@", str, gestureIsActive ? @"Active" : @"Ended");
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    TimerDetailViewController *tvc = [[TimerDetailViewController alloc]init];
    [self.navigationController pushViewController:tvc animated:YES];
}

-(void)setcurrentTime:(NSString *)time{
    
}


@end
