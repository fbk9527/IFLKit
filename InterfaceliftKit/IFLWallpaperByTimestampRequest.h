//
//  IFLWallpaperByTimestampRequest.h
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLRequest.h"

@interface IFLWallpaperByTimestampRequest : IFLRequest

-(id)init;
-(id)initWithTimestamp:(NSNumber*)timestamp;
@end
