//
//  IFLWallpaperByTimestampRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLWallpaperByTimestampRequest.h"

@implementation IFLWallpaperByTimestampRequest

#pragma mark - Initalization
-(id)init
{
    self = [super init];
    if (self)
    {
        super.options = IFLURLOptionTreatRequiredAsOptional;
    }
    return self;
}

-(id)initWithTimestamp:(NSNumber *)timestamp
{
    self = [super init];
    if (self)
    {
        super.timestamp = timestamp;
        super.options = IFLURLOptionTreatRequiredAsOptional;
    }
    return self;
}

#pragma mark - Mark Command Construction
-(NSArray*)requiredParameters
{
    return @[@"timestamp"];
}

-(NSArray*)optionalParameters
{
    return @[@"direction", @"limit", @"resolution", @"tag_id"];
}

-(NSString*)command
{
    return @"wallpapersByTimestamp";
}

@end
