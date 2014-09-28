//
//  IFLWallpaper.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLWallpaper.h"

@implementation IFLWallpaper
-(NSArray*)jsonKeys
{
    return @[@"id",
             @"user_id",
             @"user_name",
             @"user_url_ifl",
             @"user_wallpaper_count",
             @"title",
             @"description",
             @"date_featured",
             @"date_featured_text",
             @"date_featured_timestamp",
             @"favorites_count",
             @"comments_count",
             @"url_ifl",
             @"url_ifl_short",
             @"latitude",
             @"longitude",
             @"camera_id",
             @"camera_brand",
             @"camera_model",
             @"lens_id",
             @"lens_brand",
             @"lens_model",
             @"exposure_focal_length",
             @"exposure_aperture",
             @"exposure_shutter_speed",
             @"exposure_iso",
             @"resolutions_available_array",
             @"tag_id_array",
             @"preview_width",
             @"preview_height",
             @"preview_size_in_bytes",
             @"preview_url",
             @"preview_width@2x",
             @"preview_height@2x",
             @"preview_size_in_bytes@2x",
             @"preview_url@2x"];
}
@end
