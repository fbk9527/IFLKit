//
//  IFLCommentsRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLCommentsRequest.h"

@implementation IFLCommentsRequest
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
    return nil;
}

-(NSArray*)optionalParameters
{
    return @[@"limit",@"sort_order",@"iflstart",@"user_id",@"wallpaper_id"];
}

-(NSString*)command
{
    return @"comments";
}
@end
