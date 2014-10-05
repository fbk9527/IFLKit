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
