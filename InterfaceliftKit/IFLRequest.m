//
//  IFLRequest.m
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/17/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLRequest.h"
#import "IFLCameraLenseRequest.h"
#import "IFLSingleCommentRequest.h"
#import "IFLCommentsRequest.h"
#import "IFLFavoritesRequest.h"
#import "IFLSingleSubmissionRequest.h"
#import "IFLSubmissionsDownloadRequest.h"

@implementation IFLRequest

NSString* kIFLRequestSortByDate      = @"date";
NSString* kIFLRequestSortById        = @"id";
NSString* kIFLRequestSortByFavorites = @"favorites";
NSString* kIFLRequestSortByDownloads = @"downloads";
NSString* kIFLRequestSortByComments  = @"comments";




-(void)processWithBaseUrl:(NSURL *)baseUrl withHTTPHeaders:(NSDictionary *)dict
{
    if ([[NSThread currentThread]isMainThread]) {
        NSLog(@"WARNING!!! Just because you 'can' do something does not mean you should. All AFLRequest should be handled through the IFLClient which processes them on a background thread.");
    }
}

-(NSString*)command
{
    return @"";
}


#pragma mark - Paramater Handling
-(NSArray*)requiredParamaters
{
    return nil;
}

-(NSArray*)optionalParamaters
{
    return nil;
}



#pragma mark - Intantiation Helpers
+(instancetype)cameraBodyRequestWithId:(NSNumber*)cameraId
                       completionBlock:(IFLRequestCallback)completionBlock
{
    return nil;
}
+(instancetype)cameraLensRequestWithId:(NSNumber*)lenseId
                       completionBlock:(IFLRequestCallback)completoinBlock
{
   return nil;
}
+(instancetype)singleCommentRequestWithId:(NSNumber*)commentId
                          completionBlock:(IFLRequestCallback)completoinBlock
{
   return nil;
}
+(instancetype)favoritesRequestWithId:(NSNumber*)userId
                      completionBlock:(IFLRequestCallback)completoinBlock
{
   return nil;
}
+(instancetype)singleSubmissionRequestWithId:(NSNumber*)submissionId
                             completionBlock:(IFLRequestCallback)completoinBlock
{
   return nil;
}
+(instancetype)submissionsDownloadRequestWithId:(NSNumber*)submissionId
                                completionBlock:(IFLRequestCallback)completoinBlock
{
    return nil;
}
+(instancetype)singleTagRequestWithId:(NSNumber*)tagId
                      completionBlock:(IFLRequestCallback)completoinBlock
{
    return nil;
}
+(instancetype)singleWallpaperRequestWithId:(NSNumber*)wallpaperId
                            completionBlock:(IFLRequestCallback)completoinBlock
{
    return nil;
}
+(instancetype)WallpaperDownloadRequestWithId:(NSNumber*)wallpaperId
                                forResolution:(NSString*)resolution
                               ompletionBlock:(IFLRequestCallback)completoinBlock
{
   return nil;
}
+(instancetype)wallpapersByTimestampRequest:(NSNumber*)timestamp
                            completionBlock:(IFLRequestCallback)completoinBlock
{
  return nil;
}
+(instancetype)wallpapersRequest:(IFLRequestCallback)completoinBlock
{
   return nil;
}
+(instancetype)tagsRequest:(IFLRequestCallback)completoinBlock
{
   return nil;
}
+(instancetype)commentsRequest:(IFLRequestCallback)completoinBlock
{
   return nil;
}
+(instancetype)submissionsRequest:(IFLRequestCallback)completoinBlock
{
   return nil;
}
@end
