//
//  IFLCamera.h
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/20/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "IFLModel.h"

@interface IFLCamera : IFLModel
@property(nonatomic,strong)NSNumber* iflId;
@property(nonatomic,strong)NSString* brand;
@property(nonatomic,strong)NSString* model;
@property(nonatomic,strong)NSString* mount;
@property(nonatomic,strong)NSString* format;
@property(nonatomic,strong)NSString* date_introduced;
@property(nonatomic,strong)NSString* url_amazon;
@end
