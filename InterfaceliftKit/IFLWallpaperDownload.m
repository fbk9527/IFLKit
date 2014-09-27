//
//  IFLWallpaperDownload.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLWallpaperDownload.h"

@implementation IFLWallpaperDownload
-(NSArray*)jsonKeys
{
    return @[@"wallpaper_id",
             @"filename",
             @"resolution",
             @"width",
             @"height",
             @"timestamp_current",
             @"timestamp_expires",
             @"download_size_in_bytes",
             @"download_url"];
}
@end
