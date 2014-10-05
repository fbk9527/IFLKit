//
//  IFLKit - Objective-C wrapper to the Interfacelift.com API
//  Copyright (C) 2014  Fred Kelch <fred.kelch@gmail.com>
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
//  You should have received a copy of the GNU General Public License
//  along with this program.  If not, see <http://www.gnu.org/licenses/>.
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
