//
//  IFLFavoritesRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLFavoritesRequest.h"

@implementation IFLFavoritesRequest
#pragma mark - Initalization
-(id)init
{
    self = [super init];
    if(self)
    {
    }
    return self;
}

-(id)initWithUserId:(NSNumber *)user_id
{
    self = [super init];
    if (self)
    {
        super.user_id = user_id;
    }
    return self;
}

#pragma mark - Abstract Methods
-(NSArray*)requiredParameters
{
    return @[@"user_id"];
}

-(NSArray*)optionalParameters
{
    return @[@"limit", @"resolution", @"sort_by", @"sort_order", @"iflstart"];
}

-(NSString*)command
{
    return @"favorites";
}
@end
