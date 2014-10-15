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

#import "IFLRequest.h"
#import "IFLCameraLensRequest.h"
#import "IFLSingleCommentRequest.h"
#import "IFLCommentsRequest.h"
#import "IFLFavoritesRequest.h"
#import "IFLSingleSubmissionRequest.h"
#import "IFLSubmissionsDownloadRequest.h"
#import "NSArray+DGParameterizeArray.h"

@interface IFLRequest ()

//******************************************************
//              NSOperation State                     //
//******************************************************
@property(readonly, getter=isFinished) BOOL finished;
@property(readonly, getter=isExecuting) BOOL executing;
@end



@implementation IFLRequest
@synthesize finished = _finished;
@synthesize executing = _executing;

NSString* kIFLRequestSortByDate      = @"date";
NSString* kIFLRequestSortById        = @"id";
NSString* kIFLRequestSortByFavorites = @"favorites";
NSString* kIFLRequestSortByDownloads = @"downloads";
NSString* kIFLRequestSortByComments  = @"comments";


#pragma mark - Generate URL Request
-(NSURL*)generateRequestURL
{

    NSURLComponents* comp = [[NSURLComponents alloc]initWithURL:[NSURL URLWithString:self.baseUrl]
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


#pragma mark - NSOperation(Executing The Operation)
-(void)start
{
    // Do not call super since we are not implementing [self main]
    // If cancelled, do not inform observers to avoid completionBlock calling.
    if (self.cancelled) {
        _finished = YES;
        return;
    }
    
    // Start background task
    [self.networkTask resume];
    
    // Update NSOperation Status
    // Use Getter/Setter so that KVO observers are informed
    self.executing = YES;
}


/*
-(void)main
{
       Do nothing.
       Per the apple documenation main doesn't need to be implemented on concurrent operations.
       Since IFLRequest now manages an NSURLSession, which is asynchronus by default, we will
       rely on the delegate to update the block state and no longer handle the block processing
       within main. All network task are now delegated to NSURLSessionTask.
 
}
*/

#pragma mark - NSOperation(Operation Status)
-(void)setFinished:(BOOL)finished
{
    // Inform observers the value has chnaged
    if (_finished != finished) {
        [self willChangeValueForKey:@"isFinished"];
        _finished = finished;
        [self didChangeValueForKey:@"isFinished"];
    }
}

-(void)setExecuting:(BOOL)executing
{
    // Inform observers the value has changed
    if (_executing != executing) {
        [self willChangeValueForKey:@"isExecuting"];
        _executing = executing;
        [self didChangeValueForKey:@"isExecuting"];
    }
}

-(BOOL)isConcurrent
{
    // The value of this property is YES for operations that run asynchronously with respect to the current thread.
    // Since the NSURLSessionTask is asynchronous we must provide a value of YES.
    return YES;
}

-(BOOL)isAsynchronous
{
    // The value of this property is YES for operations that run asynchronously with respect to the current thread.
    // Since the NSURLSessionTask is asynchronous we must provide a value of YES.
    return YES;
}

-(NSString*)name
{
    return [[NSString alloc]initWithFormat:@"%@ ~ %@",[self class], [self command]];
}




#pragma mark - Abstract Methods
-(NSString*)command
{
    NSAssert(true, @"Function: %s, Should not be called on %@",__PRETTY_FUNCTION__,[self class]);
    return nil; // None for generic superclass
}

-(NSArray*)requiredParameters
{
    NSAssert(true, @"Function: %s, Should not be called on %@",__PRETTY_FUNCTION__,[self class]);
    return nil; // None for generic superclass
}

-(NSArray*)optionalParameters
{
    NSAssert(true, @"Function: %s, Should not be called on %@",__PRETTY_FUNCTION__,[self class]);
    return nil; // None for generic superclass
}


#pragma mark - Description
-(NSString*)description
{
    NSString* descString = [super description];
    descString = [descString stringByAppendingFormat:@"Command: %@", self.command];
    descString = [descString stringByAppendingFormat:@"Required Params: %@",self.requiredParameters.description];
    descString = [descString stringByAppendingFormat:@"Optional Params: %@",self.optionalParameters.description];
    descString = [descString stringByAppendingFormat:@"RequestURL: %@", [self generateRequestURL]];
    return descString;
}
@end
