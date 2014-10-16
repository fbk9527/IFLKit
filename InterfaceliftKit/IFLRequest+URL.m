//
// IFLKit - Objective-C wrapper to the Interfacelift.com API
//
// Copyright (C) 2014  Fred Kelch <fred.kelch@gmail.com>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License,
// any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

#import "IFLRequest+URL.h"

@implementation IFLRequest (URL)

#pragma mark - Generate URL Request
-(NSURL*)generateRequestUrlWithBaseString:(NSString *)base
{
    return [self generateRequestUrlWithBaseUrl:[NSURL URLWithString:base]];
}

-(NSURL*)generateRequestUrlWithBaseUrl:(NSURL*)base;
{
    
    NSURLComponents* comp = [[NSURLComponents alloc]initWithURL:base
                                        resolvingAgainstBaseURL:YES];
    
    // Throw exception. Only support secure connections
    if (![[comp scheme]isEqualToString:@"https"])
        return nil;
    
    
    // Handle path construction
    NSString* path = [comp path];
    NSMutableArray* queryItems = [NSMutableArray new];
    
    if ([path characterAtIndex:(([path length])-1)] == '/')
        path = [path substringWithRange:NSMakeRange(0, [path length]-1)];
    
    path = [path stringByAppendingPathComponent:[self command]];
    for (NSString* var in self.requiredParameters)
    {
        id value = [self valueForKey:var];
        
        // This is a programming error
        // The programmer didn't provide the required parameter
        if (!value)
        {
            NSException* exception = [NSException exceptionWithName:@"Missing Required Parameter"
                                                             reason:[NSString stringWithFormat:@"Missing: %@",var]
                                                           userInfo:nil];
            @throw exception;
        }
        
        if (self.options & IFLURLOptionTreatRequiredAsOptional)
        {
            [queryItems addObject:[NSURLQueryItem queryItemWithName:var value:[value description]]];
        }
        else
        {
            path = [path stringByAppendingPathComponent:[value description]];
        }
    }
    
    // Make sure the last required param ends with a forward slash
    if (path && path.length > 0 && [path characterAtIndex:path.length-1] != '/')
        path = [[NSString alloc]initWithFormat:@"%@/",path];
    
    comp.path = path;
    
    
    
    for (NSString* var in self.optionalParameters)
    {
        id value = [self valueForKey:var];
        if (value)
            [queryItems addObject:[NSURLQueryItem queryItemWithName:var value:[value description]]];
    }
    
    
    if (queryItems.count > 0)
        comp.queryItems = queryItems;
    
    return comp.URL;
}
@end
