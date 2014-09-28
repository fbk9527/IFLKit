//
//  IFLLens.h
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFLModel.h"

@interface IFLLens : IFLModel
@property(strong,nonatomic) NSNumber* iflId;
@property(strong,nonatomic) NSString* brand;
@property(strong,nonatomic) NSString* model;
@property(strong,nonatomic) NSString* mount;
@property(strong,nonatomic) NSString* max_format_size;
@property(strong,nonatomic) NSNumber* focal_length;
@property(strong,nonatomic) NSNumber* focal_length_tele;
@property(strong,nonatomic) NSNumber* max_aperture;
@property(strong,nonatomic) NSNumber* max_aperture_tele;
@property(strong,nonatomic) NSNumber* max_magnification;
@property(strong,nonatomic) NSNumber* min_focus;
@property(strong,nonatomic) NSNumber* filter_thread;
@property(strong,nonatomic) NSString* reach;
@property(strong,nonatomic) NSString* date_introduced;
@property(strong,nonatomic) NSString* url_amazon;
@end
