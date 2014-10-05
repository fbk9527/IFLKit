/// IFLKit - Objective-C wrapper to the Interfacelift.com API
/// Copyright (C) 2014  Fred Kelch <fred.kelch@gmail.com>
///
/// This program is free software: you can redistribute it and/or modify
/// it under the terms of the GNU General Public License as published by
/// the Free Software Foundation, either version 3 of the License, or
/// (at your option) any later version.
///
/// This program is distributed in the hope that it will be useful,
/// but WITHOUT ANY WARRANTY; without even the implied warranty of
/// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
/// GNU General Public License for more details.
///
/// You should have received a copy of the GNU General Public License
/// along with this program.  If not, see <http://www.gnu.org/licenses/>.

#import "IFLWallpaperByTimestampRequest.h"

@implementation IFLWallpaperByTimestampRequest

#pragma mark - Initalization
-(id)init
{
    self = [super init];
    if (self)
    {
        super.options = IFLURLOptionTreatRequiredAsOptional;
    }
    return self;
}

-(id)initWithTimestamp:(NSNumber *)timestamp
{
    self = [super init];
    if (self)
    {
        super.timestamp = timestamp;
        super.options = IFLURLOptionTreatRequiredAsOptional;
    }
    return self;
}

#pragma mark - Mark Command Construction
-(NSArray*)requiredParameters
{
    return @[@"timestamp"];
}

-(NSArray*)optionalParameters
{
    return @[@"direction", @"limit", @"resolution", @"tag_id"];
}

-(NSString*)command
{
    return @"wallpapersByTimestamp";
}

@end
