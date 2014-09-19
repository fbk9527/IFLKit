//
//  IFLRequest.h
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/17/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface IFLRequest : NSObject

typedef NS_ENUM(NSInteger, IFLRequestTagType){
    IFLRequestTagTypeColor,
    IFLRequestTagTypeScene,
    IFLRequestTagTypeLocation,
    IFLRequestTagTypeEvent,
    IFLRequestTagTypeSubject,
    IFLRequestTagTypeEquipment,
    IFLRequestTagTypeMedium
};

typedef void (^IFLRequestCallback)(NSArray* obj, NSURLResponse* resp, NSError* error);

// Completion block


@property(strong,nonatomic) NSArray* sort_by;
@property(strong,nonatomic) NSNumber* iflId;
@property(strong,nonatomic) NSNumber* limit;
@property(strong,nonatomic) NSString* sort_order;
@property(strong,nonatomic) NSNumber* start;
@property(strong,nonatomic) NSNumber* user_id;
@property(strong,nonatomic) NSNumber* wallpaper_id;
@property(strong,nonatomic) NSString* resolution;
@property(strong,nonatomic) NSNumber* submission_id;
@property(strong,nonatomic) NSString* search;
@property(strong,nonatomic) NSString* type;
@property(strong,nonatomic) NSNumber* tag_id;
@property(strong,nonatomic) NSString* direction;
@property(strong,nonatomic) NSNumber* timestamp;
@property(copy,nonatomic) IFLRequestCallback callback;

extern NSString* kIFLRequestSortByDate;
extern NSString* kIFLRequestSortById;
extern NSString* kIFLRequestSortByFavorites;
extern NSString* kIFLRequestSortByDownloads;
extern NSString* kIFLRequestSortByComments;



// Parent performs nothing
-(void)processWithBaseUrl:(NSURL*)baseUrl
          withHTTPHeaders:(NSDictionary*)dict;

-(void)processWithBaseUrl:(NSURL *)baseUrl
          withHTTPHeaders:(NSDictionary *)dict
      enclosedInOperation:(NSOperation*)operation;



// Required & Optional
-(NSArray*)requiredParamaters;
-(NSArray*)optionalParamaters;


#pragma mark - Convenience Methods
+(instancetype)cameraBodyRequestWithId:(NSNumber*)cameraId completionBlock:(IFLRequestCallback)completoinBlock;
+(instancetype)cameraLensRequestWithId:(NSNumber*)lenseId completionBlock:(IFLRequestCallback)completionBlock;
+(instancetype)singleCommentRequestWithId:(NSNumber*)commentId completionBlock:(IFLRequestCallback)completoinBlock;
+(instancetype)favoritesRequestWithId:(NSNumber*)userId completionBlock:(IFLRequestCallback)completoinBlock;
+(instancetype)singleSubmissionRequestWithId:(NSNumber*)submissionId completionBlock:(IFLRequestCallback)completoinBlock;
+(instancetype)submissionsDownloadRequestWithId:(NSNumber*)submissionId completionBlock:(IFLRequestCallback)completoinBlock;
+(instancetype)singleTagRequestWithId:(NSNumber*)tagId completionBlock:(IFLRequestCallback)completoinBlock;
+(instancetype)singleWallpaperRequestWithId:(NSNumber*)wallpaperId completionBlock:(IFLRequestCallback)completoinBlock;
+(instancetype)WallpaperDownloadRequestWithId:(NSNumber*)wallpaperId forResolution:(NSString*)resolution ompletionBlock:(IFLRequestCallback)completoinBlock;
+(instancetype)wallpapersByTimestampRequest:(NSNumber*)timestamp completionBlock:(IFLRequestCallback)completoinBlock;
+(instancetype)wallpapersRequest:(IFLRequestCallback)completoinBlock;
+(instancetype)tagsRequest:(IFLRequestCallback)completoinBlock;
+(instancetype)commentsRequest:(IFLRequestCallback)completoinBlock;
+(instancetype)submissionsRequest:(IFLRequestCallback)completoinBlock;
@end
