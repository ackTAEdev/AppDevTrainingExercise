//
//  ViewController.m
//  ViewControllersPartOne
//
//  Created by Brian @ TAE on 30/05/2017.
//  Copyright © 2017 Brian @ TAE. All rights reserved.
//

#import "DictionaryTableViewController.h"

@interface DictionaryTableViewController ()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@property (strong, nonatomic) NSArray *sortedTitles;

@end

@implementation DictionaryTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.dictionary = [NSMutableDictionary dictionary];
    
    [self.dictionary setObject:@[@"123456789", @"Password", @"12345", @"P4SSW0RD"] forKey:@"Worst Password"];
    [self.dictionary setObject:@[@"AES-256", @"SHA-1", @"SSL", @"Common Crypto", @"Cert Pinning", @"OAuth 2.0", @"AES-512"] forKey:@"Security"];
    [self.dictionary setObject:@[@"UIKit", @"CoreData", @"Foundation", @"CoreAnimation", @"CoreImage"] forKey:@"Cocoa Touch"];
    
    // Sort the titles using the compare function
    self.sortedTitles = [[self.dictionary allKeys] sortedArrayUsingSelector:@selector(compare:)];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.dictionary count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.dictionary objectForKey:[self.sortedTitles objectAtIndex:section]] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cell_id = @"basicCell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    
    if (cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    
    // Get the array value from the dictionary
    NSArray *items = [self.dictionary objectForKey:[self.sortedTitles objectAtIndex:indexPath.section]];
    
    [cell.textLabel setText:[items objectAtIndex:indexPath.row]];

    return cell;
}

-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [self.sortedTitles objectAtIndex:section];
}
@end
