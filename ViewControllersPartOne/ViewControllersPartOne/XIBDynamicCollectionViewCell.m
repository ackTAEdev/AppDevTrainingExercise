//
//  XIBDynamicCollectionViewCell.m
//  ViewControllersPartOne
//
//  Created by Brian @ TAE on 30/05/2017.
//  Copyright © 2017 Brian @ TAE. All rights reserved.
//

#import "XIBDynamicCollectionViewCell.h"

@implementation XIBDynamicCollectionViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

+(NSString *)cell_id
{
    return @"XIBDynamicCollectionViewCell";
}

- (IBAction)stepperAction:(id)sender {
    
    if ([self.delegate respondsToSelector:@selector(collectionViewCell:stepperValueDidChange:)])
    {
        [self.delegate collectionViewCell:self stepperValueDidChange:sender];
    }
}

- (void)configCellWithPerson:(Person *)person
{
    // Set the text label
    [self.textLabel setText:[person formattedName]];
    
    // Set the age, check the attributes inspector on the storyboard for min, max & stepper values
    [self.stepper setValue:(double)person.age];
    
    // Reset the background colour
    [self setBackgroundColor:[UIColor whiteColor]];
}

@end
