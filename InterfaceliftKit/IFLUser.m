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
