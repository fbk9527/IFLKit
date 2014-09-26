//
//  IFLWallpaperDownloadRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLWallpaperDownloadRequest.h"

@implementation IFLWallpaperDownloadRequest

#pragma mark - Initalization
-(id)init
{
    self = [super init];
    if (self)
    {
        
    }
    return self;
}


-(id)initWithWallpaperId:(NSNumber *)wallpaperId withResolution:(NSString *)resolution
{
    self = [super init];
    if (self)
    {
        super.wallpaper_id = wallpaperId;
        super.resolution = resolution;
    }
    return self;
}

#pragma mark - Mark Command Construction
-(NSArray*)requiredParameters
{
    return @[@"wallpaper_id", @"resolution"];
}

-(NSArray*)optionalParameters
{
    return nil;
}

-(NSString*)command
{
    return @"wallpaper_download";
}

@end
