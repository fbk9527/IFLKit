//
//  IFCameraBodyRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLCameraBodyRequest.h"

@implementation IFLCameraBodyRequest

#pragma mark - Initalization
-(id)initWithId:(NSNumber *)iflId
{
    self = [super init];
    if(self)
    {
        super.iflId = iflId;
    }
    return self;
}

#pragma mark - Abstract Method Override
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
    return @"camera";
}
@end
