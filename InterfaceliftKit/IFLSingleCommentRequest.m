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

#import "IFLSingleCommentRequest.h"

@implementation IFLSingleCommentRequest
#pragma mark - Initalization
-(id)init
{
    self = [super init];
    if (self)
    {
    }
    return self;
}

-(id)initWithId:(NSNumber *)iflId
{
    self = [super init];
    if (self)
    {
        super.iflId = iflId;
    }
    return self;
}

#pragma mark - Abstract Methods
-(NSArray*)requiredParameters
{
    return @[@"iflId"];
}

-(NSArray*)optionalParameters
{
    return nil;
}

-(NSString*)command
{
    return @"comment";
}
@end
