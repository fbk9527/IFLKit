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

@interface IFLWallpaperDownload : IFLModel
@property(strong,nonatomic) NSNumber* wallpaper_id;
@property(strong,nonatomic) NSString* filename;
@property(strong,nonatomic) NSString* resolution;
@property(strong,nonatomic) NSNumber* width;
@property(strong,nonatomic) NSNumber* height;
@property(strong,nonatomic) NSNumber* timestamp_current;
@property(strong,nonatomic) NSNumber* timestamp_expires;
@property(strong,nonatomic) NSNumber* download_size_in_bytes;
@property(strong,nonatomic) NSString* download_url;
@end
