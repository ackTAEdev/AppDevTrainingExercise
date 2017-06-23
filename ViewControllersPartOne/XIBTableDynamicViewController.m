//
//  XIBTableDynamicViewController.m
//  ViewControllersPartOne
//
//  Created by Brian @ TAE on 30/05/2017.
//  Copyright © 2017 Brian @ TAE. All rights reserved.
//

#import "XIBTableDynamicViewController.h"

@interface XIBTableDynamicViewController ()

@property (strong, nonatomic) NSMutableArray *tableViewData;

@property float stepperOldValue;

@end

// Define a static string for the cell id
static NSString *cell_id = @"cell";

@implementation XIBTableDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    //Using 2D array to represent the sections & rows
    [self setTableViewData:[NSMutableArray array]];
    
    // have a reference to the old stepper value so that we can judge whether the '+' or '-' was pressed
    self.stepperOldValue = 50.0f;
    
    // Register the cells for the tableView as we are using Xibs
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:cell_id];
    
    // Remove the empty tableView cells
    [self.tableView setTableFooterView:[UIView new]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)stepperAction:(id)sender {
    
    float currentStepperValue = [(UIStepper *)sender value];
    
    // Switch was ON
    if (self.stateSwitch.isOn)
    {
        // It was a plus
        if (currentStepperValue > self.stepperOldValue)
        {
            //Add new section with no rows
            [self.tableViewData addObject:@[]];
        }
        else
        {
            // Remove last section
            [self.tableViewData removeLastObject];
        }
        
    }
    else // Switch was off
    {
        // It was a plus
        if (currentStepperValue > self.stepperOldValue)
        {
            // Add a new row to each section
            for(int index = 0; index < self.tableViewData.count; index ++)
            {
                // Find each array
                NSMutableArray *newArray = [NSMutableArray arrayWithArray:[self.tableViewData objectAtIndex:index]];
                
                // Add a new object to it, which is simply a NSNumber object
                [newArray addObject:[NSNumber numberWithInteger:[newArray count]]];
                
                // Replace the array
                [self.tableViewData setObject:newArray atIndexedSubscript:index];
            }
        }
        else
        {
            // Remove last row in each section
            for(int index = 0; index < self.tableViewData.count; index ++)
            {
                // Find each array
                NSMutableArray *newArray = [NSMutableArray arrayWithArray:[self.tableViewData objectAtIndex:index]];
                
                // Remove the last object
                [newArray removeLastObject];
                
                // Replace the array
                [self.tableViewData setObject:newArray atIndexedSubscript:index];
            }
        }
    }
    
    // Refresh the table
    [self.tableView reloadData];
    
    self.stepperOldValue = currentStepperValue;
}

- (IBAction)switchAction:(id)sender {
    
    // Get the value of the switch
    BOOL isOn = [(UISwitch *)sender isOn];
    
    //Set the helpful label
    [self.helpfulLabel setText:[NSString stringWithFormat:@"Now modifying: %@", (isOn ? @"SECTIONs" : @"ROWs")]];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [self.tableViewData count];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.tableViewData objectAtIndex:section] count];
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cell_id];
    
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cell_id];
    }
    
    // Get the number in the array
    NSNumber *numberForCell = [[self.tableViewData objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    // Set the text
    [cell.textLabel setText:[NSString stringWithFormat:@"Row: %@", numberForCell]];
    
    return cell;
}

// Set the title to help out the UX
-(NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [NSString stringWithFormat:@"Section: %@", [NSNumber numberWithInteger:section]];
}
@end
