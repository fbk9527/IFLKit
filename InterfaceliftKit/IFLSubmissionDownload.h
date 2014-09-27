//
//  IFLSubmissionDownload.h
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFLModel.h"

@interface IFLSubmissionDownload : IFLModel
@property(strong,nonatomic) NSNumber* submission_id;
@property(strong,nonatomic) NSString* filename;
@property(strong,nonatomic) NSNumber* timestamp_current;
@property(strong,nonatomic) NSNumber* timestamp_expires;
@property(strong,nonatomic) NSNumber* download_size_in_bytes;
@property(strong,nonatomic) NSString* resolution;
@property(strong,nonatomic) NSNumber* width;
@property(strong,nonatomic) NSNumber* height;
@property(strong,nonatomic) NSString* mime_type;
@property(strong,nonatomic) NSString* download_url;
@end
