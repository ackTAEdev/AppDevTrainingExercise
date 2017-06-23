//
//  Person.h
//  ViewControllersPartOne
//
//  Created by Brian @ TAE on 30/05/2017.
//  Copyright © 2017 Brian @ TAE. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject

@property (strong, nonatomic) NSString *firstName;

@property (strong, nonatomic) NSString *middleName;

@property (strong, nonatomic) NSString *lastName;

@property (nonatomic) NSUInteger age;

+(instancetype)personWithFirstName:(NSString *)fName middleName:(NSString *)mName lastName:(NSString *)lName age:(NSUInteger)age;

-(NSString *)formattedName;

@end
