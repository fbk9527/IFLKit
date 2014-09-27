//
//  IFLUser.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLUser.h"

@implementation IFLUser

-(NSArray*)jsonKeys
{
    return @[@"id",
             @"username",
             @"twitter",
             @"avatar_url",
             @"avatar_size_in_bytes",
             @"avatar_width",
             @"avatar_height",
             @"avatar_mime_type",
             @"bio_html",
             @"location",
             @"occupation",
             @"gender",
             @"birthdate",
             @"url_external",
             @"url_ifl_profile",
             @"url_ifl_wallpapers",
             @"date_joined",
             @"wallpaper_id_array",
             @"camera_id_array",
             @"lens_id_array"];
}
@end
