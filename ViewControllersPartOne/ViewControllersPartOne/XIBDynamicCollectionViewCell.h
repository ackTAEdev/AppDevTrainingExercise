//
//  XIBDynamicCollectionViewCell.h
//  ViewControllersPartOne
//
//  Created by Brian @ TAE on 30/05/2017.
//  Copyright © 2017 Brian @ TAE. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Person.h"

@protocol XIBDynamicCollectionViewCellDelegate <NSObject>

@required
-(void)collectionViewCell:(UICollectionViewCell *)cell stepperValueDidChange:(UIStepper *)stepper;

@end

@interface XIBDynamicCollectionViewCell : UICollectionViewCell

@property (weak, nonatomic) IBOutlet UILabel *textLabel;

@property (weak, nonatomic) id<XIBDynamicCollectionViewCellDelegate> delegate;

@property (weak, nonatomic) IBOutlet UIStepper *stepper;

+(NSString *)cell_id;

- (IBAction)stepperAction:(id)sender;

- (void)configCellWithPerson:(Person *)person;

@end
