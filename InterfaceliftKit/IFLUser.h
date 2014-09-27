//
//  IFLUser.h
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFLModel.h"

@interface IFLUser : IFLModel
@property(strong,nonatomic) NSNumber* iflId;
@property(strong,nonatomic) NSString* username;
@property(strong,nonatomic) NSString* twitter;
@property(strong,nonatomic) NSString* avatar_url;
@property(strong,nonatomic) NSNumber* avatar_size_in_bytes;
@property(strong,nonatomic) NSNumber* avatar_width;
@property(strong,nonatomic) NSNumber* avatar_height;
@property(strong,nonatomic) NSString* avatar_mime_type;
@property(strong,nonatomic) NSString* bio_html;
@property(strong,nonatomic) NSString* location;
@property(strong,nonatomic) NSString* occupation;
@property(strong,nonatomic) NSString* gender;
@property(strong,nonatomic) NSString* birthdate;
@property(strong,nonatomic) NSString* url_external;
@property(strong,nonatomic) NSString* url_ifl_profile;
@property(strong,nonatomic) NSString* url_ifl_wallpapers;
@property(strong,nonatomic) NSString* date_joined;
@property(strong,nonatomic) NSArray* wallpaper_id_array;
@property(strong,nonatomic) NSArray* camera_id_array;
@property(strong,nonatomic) NSArray* lens_id_array;
@end
