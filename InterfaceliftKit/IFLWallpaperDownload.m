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

#import "IFLWallpaperDownload.h"

@implementation IFLWallpaperDownload
-(NSArray*)jsonKeys
{
    return @[@"wallpaper_id",
             @"filename",
             @"resolution",
             @"width",
             @"height",
             @"timestamp_current",
             @"timestamp_expires",
             @"download_size_in_bytes",
             @"download_url"];
}
@end
