//
//  IFLSingleTagRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLSingleTagRequest.h"

@implementation IFLSingleTagRequest

#pragma mark - Construction
-(id)init
{
    self = [super init];
    if (self) {
        [super setIflId:@-1];
    }
    return self;
}

-(id)initWithId:(NSNumber *)iflId
{
    self = [super init];
    if (self) {
        [super setIflId:iflId];
    }
    return self;
}


#pragma mark - Override Abstract Methods
-(NSArray*)requiredParameters
{
    return @[@"iflId"];
}

-(NSArray*)optionalParameters
{
    return nil;
}

-(NSString*)command
{
    return @"tag";
}
@end
