//
//  IFLComment.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLComment.h"

@implementation IFLComment
-(NSArray*)jsonKeys
{
    return @[@"id",
             @"wallpaper_id",
             @"comment_text",
             @"date_timestamp",
             @"rating",
             @"user_id",
             @"user_name",
             @"user_avatar_url",
             @"user_avatar_size_in_bytes",
             @"user_avatar_width",
             @"user_avatar_height",
             @"user_avatar_mime_type",
             @"user_url_ifl_profile"];
}
@end
