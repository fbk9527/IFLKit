//
//  IFLSubmissionsRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLSubmissionsRequest.h"

@implementation IFLSubmissionsRequest

#pragma mark - Initalization
-(id)init
{
    self = [super init];
    if (self)
    {  
    }
    return self;
}

#pragma mark - Abstract Methods
-(NSArray*)requiredParameters
{
    return nil; // None
}

-(NSArray*)optionalParameters
{
    return @[@"limit",@"start",@"user_id"];
}

-(NSString*)command
{
    return @"submissions";
}
@end
