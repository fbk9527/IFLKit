//
//  IFLWallpaper.h
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFLModel.h"

@interface IFLWallpaper : IFLModel
@property(strong,nonatomic) NSNumber* iflId;
@property(strong,nonatomic) NSNumber* user_id;
@property(strong,nonatomic) NSString* user_name;
@property(strong,nonatomic) NSString* user_url_ifl;
@property(strong,nonatomic) NSNumber* user_wallpaper_count;
@property(strong,nonatomic) NSString* title;
@property(strong,nonatomic) NSString* ifldescription;
@property(strong,nonatomic) NSString* date_featured;
@property(strong,nonatomic) NSString* date_featured_text;
@property(strong,nonatomic) NSNumber* date_featured_timestamp;
@property(strong,nonatomic) NSNumber* favorites_count;
@property(strong,nonatomic) NSNumber* comments_count;
@property(strong,nonatomic) NSString* url_ifl;
@property(strong,nonatomic) NSString* url_ifl_short;
@property(strong,nonatomic) NSNumber* latitude;
@property(strong,nonatomic) NSNumber* longitude;
@property(strong,nonatomic) NSNumber* camera_id;
@property(strong,nonatomic) NSString* camera_brand;
@property(strong,nonatomic) NSString* camera_model;
@property(strong,nonatomic) NSNumber* lens_id;
@property(strong,nonatomic) NSString* lens_brand;
@property(strong,nonatomic) NSString* lens_model;
@property(strong,nonatomic) NSNumber* exposure_focal_length;
@property(strong,nonatomic) NSNumber* exposure_aperture;
@property(strong,nonatomic) NSNumber* exposure_shutter_speed;
@property(strong,nonatomic) NSNumber* exposure_iso;
@property(strong,nonatomic) NSArray* resolutions_available_array;
@property(strong,nonatomic) NSNumber* preview_width;
@property(strong,nonatomic) NSNumber* preview_height;
@property(strong,nonatomic) NSNumber* preview_size_in_bytes;
@property(strong,nonatomic) NSString* preview_url;
@property(strong,nonatomic) NSNumber* preview_2x_width;
@property(strong,nonatomic) NSNumber* preview_2x_height;
@property(strong,nonatomic) NSNumber* preview_2x_size_in_bytes;
@property(strong,nonatomic) NSString* preview_2x_url;
@property(strong,nonatomic) NSArray* tag_id_array;
@end
