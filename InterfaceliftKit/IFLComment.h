//
//  IFLComment.h
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFLModel.h"

@interface IFLComment : IFLModel
@property(strong,nonatomic) NSNumber* iflId;
@property(strong,nonatomic) NSNumber* wallpaper_id;
@property(strong,nonatomic) NSString* comment_text;
@property(strong,nonatomic) NSString* date;
@property(strong,nonatomic) NSString* date_text;
@property(strong,nonatomic) NSNumber* date_timestamp;
@property(strong,nonatomic) NSNumber* rating;
@property(strong,nonatomic) NSNumber* user_id;
@property(strong,nonatomic) NSString* user_name;
@property(strong,nonatomic) NSString* user_avatar_url;
@property(strong,nonatomic) NSNumber* user_avatar_size_in_bytes;
@property(strong,nonatomic) NSNumber* user_avatar_width;
@property(strong,nonatomic) NSNumber* user_avatar_height;
@property(strong,nonatomic) NSString* user_avatar_mime_type;
@property(strong,nonatomic) NSString* user_url_ifl_profile;
@end
