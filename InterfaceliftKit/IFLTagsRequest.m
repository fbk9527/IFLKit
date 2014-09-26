//
//  IFLTagsRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLTagsRequest.h"

@implementation IFLTagsRequest

#pragma mark - Initalize
-(id)init
{
    self = [super init];
    if(self)
    {
        
    }
    return self;
}

#pragma mark - Abstract Methods
-(NSArray*)requiredParameters
{
    return nil;
}

-(NSArray*)optionalParameters
{
    return @[@"search", @"type"];
}

-(NSString*)command
{
    return @"tags";
}
@end
