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
