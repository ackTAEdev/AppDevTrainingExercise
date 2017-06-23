//
//  XIBTableDynamicViewController.h
//  ViewControllersPartOne
//
//  Created by Brian @ TAE on 30/05/2017.
//  Copyright © 2017 Brian @ TAE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XIBTableDynamicViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (weak, nonatomic) IBOutlet UILabel *helpfulLabel;

@property (weak, nonatomic) IBOutlet UISwitch *stateSwitch;

- (IBAction)stepperAction:(id)sender;

- (IBAction)switchAction:(id)sender;


@end
