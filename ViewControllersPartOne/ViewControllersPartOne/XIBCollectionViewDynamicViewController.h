//
//  XIBCollectionViewDynamicViewController.h
//  ViewControllersPartOne
//
//  Created by Brian @ TAE on 30/05/2017.
//  Copyright © 2017 Brian @ TAE. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface XIBCollectionViewDynamicViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *middleNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;

@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UILabel *editingModeField;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@property (weak, nonatomic) IBOutlet UISwitch *editingModeSwitch;

- (IBAction)buttonAction:(id)sender;

- (IBAction)switchAction:(id)sender;
@end
