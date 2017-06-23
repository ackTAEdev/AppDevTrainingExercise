//
//  XIBCollectionViewDynamicViewController.m
//  ViewControllersPartOne
//
//  Created by Brian @ TAE on 30/05/2017.
//  Copyright © 2017 Brian @ TAE. All rights reserved.
//

#import "XIBCollectionViewDynamicViewController.h"
#import "XIBDynamicCollectionViewCell.h"
#import "Person.h"

@interface XIBCollectionViewDynamicViewController () <XIBDynamicCollectionViewCellDelegate>

@property (strong, nonatomic) NSMutableArray *collectionViewData;

@property (strong, nonatomic) NSMutableArray *indexesToDelete;

@end

@implementation XIBCollectionViewDynamicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setCollectionViewData:[NSMutableArray array]];

    // An array containing the Indexes to delete
    [self setIndexesToDelete:[NSMutableArray array]];
    
    // Register the cell
    [self.collectionView registerNib:[UINib nibWithNibName:@"XIBDynamicCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:[XIBDynamicCollectionViewCell cell_id]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UICollectionView Data Source
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.collectionViewData count];
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    XIBDynamicCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:[XIBDynamicCollectionViewCell cell_id] forIndexPath:indexPath];
    
    Person *person = [self.collectionViewData objectAtIndex:indexPath.row];
    
    [cell configCellWithPerson:person];
    
    [cell setDelegate:self];
    
    return cell;
}

#pragma mark - UICollectionView Delegate
-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.editingModeSwitch isOn])
    {
        if ([self.indexesToDelete containsObject:indexPath])
        {
            [self.indexesToDelete removeObject:indexPath];
        
            UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
            
            [cell setBackgroundColor:[UIColor clearColor]];
        }
        else
        {
            [self.indexesToDelete addObject:indexPath];
            
            UICollectionViewCell *cell = [collectionView cellForItemAtIndexPath:indexPath];
            
            [cell setBackgroundColor:[UIColor redColor]];
        }
    }
    else
    {
        Person *person = [self.collectionViewData objectAtIndex:indexPath.row];
        
        UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Cell Selected"
                                                                                 message:[person formattedName]
                                                                          preferredStyle:UIAlertControllerStyleAlert];
        
        [alertController addAction:[UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleCancel handler:nil]];
        
        [self presentViewController:alertController animated:YES completion:nil];
    }
}

#pragma mark - XIBDynamicCollectionViewCell Delegate
-(void)collectionViewCell:(UICollectionViewCell *)cell stepperValueDidChange:(UIStepper *)stepper
{
    // Get the indexPath for the cell
    NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
    
    // Get the person which displays in that cell
    Person *personForCell = [self.collectionViewData objectAtIndex:indexPath.row];
    
    // Update the age based on the UIStepper
    [personForCell setAge:(NSInteger)stepper.value];
    
    // Refresh the UICollectionViewCell
    BOOL animationsEnabled = [UIView areAnimationsEnabled];
    [UIView setAnimationsEnabled:NO];
    [self.collectionView reloadItemsAtIndexPaths:@[indexPath]];
    [UIView setAnimationsEnabled:animationsEnabled];
}

#pragma mark - IB Actions
- (IBAction)buttonAction:(id)sender {
    
    // Create a new person object
    Person *newPerson = [Person personWithFirstName:self.firstNameTextField.text
                                         middleName:self.middleNameTextField.text
                                           lastName:self.lastNameTextField.text
                                                age:[self.ageTextField.text integerValue]];
    
    // Add the new person to the array
    [self.collectionViewData addObject:newPerson];
    
    // Refresh the CollectionView
    [self.collectionView reloadData];
}

- (IBAction)switchAction:(id)sender {
    
    BOOL switchIsOn = [(UISwitch *)sender isOn];
    
    if (switchIsOn == NO)
    {
        NSMutableIndexSet *indxSet = [NSMutableIndexSet indexSet];
        
        for (NSIndexPath *paths in self.indexesToDelete)
        {
            [indxSet addIndex:paths.row];
        }
        
        //Remove from the data set
        [self.collectionViewData removeObjectsAtIndexes:indxSet];
        
        // remove form the collectionView
        [self.collectionView deleteItemsAtIndexPaths:self.indexesToDelete];
        
        [self.indexesToDelete removeAllObjects];
    }
    
    [self.editingModeField setText:[NSString stringWithFormat:@"Editing Mode: %@", (switchIsOn ? @"Deletion" : @"None")]];
}
@end
