//
//  ViewController.h
//  ViewControllersPartOne
//
//  Created by Brian @ TAE on 30/05/2017.
//  Copyright © 2017 Brian @ TAE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DictionaryTableViewController : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@end

