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
