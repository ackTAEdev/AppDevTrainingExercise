//
//  Person.m
//  ViewControllersPartOne
//
//  Created by Brian @ TAE on 30/05/2017.
//  Copyright © 2017 Brian @ TAE. All rights reserved.
//

#import "Person.h"

@implementation Person

+(instancetype)personWithFirstName:(NSString *)fName middleName:(NSString *)mName lastName:(NSString *)lName age:(NSUInteger)age
{
    Person *newPerson = [Person new];
    
    [newPerson setFirstName:fName];
    [newPerson setMiddleName:mName];
    [newPerson setLastName:lName];
    [newPerson setAge:age];

    return newPerson;
}

// Formatting the name to avoid printing '(null)', seriously it looks really bad
-(NSString *)formattedName
{
    NSMutableString *newString = [NSMutableString string];
    
    if (self.firstName.length)
    {
        [newString appendFormat:@"%@,", self.firstName];
    }
    
    if (self.middleName.length)
    {
        [newString appendFormat:@"%@,", self.middleName];
    }
    
    if (self.lastName.length)
    {
        [newString appendFormat:@"%@", self.lastName];
    }
    
    [newString appendString:@"\n"];
    
    [newString appendFormat:@"Aged: %lu", self.age];
    
    return newString;
}

@end
