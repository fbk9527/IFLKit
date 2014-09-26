//
//  IFLSingleWallpaperRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLSingleWallpaperRequest.h"

@implementation IFLSingleWallpaperRequest

#pragma mark Initalization
-(id)init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

-(id)initWithId:(NSNumber *)iflId
{
    self = [super init];
    if (self)
    {
        super.iflId = iflId;
    }
    return self;
}

#pragma mark Abstract Methods
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
    return @"wallpaper";
}
@end
