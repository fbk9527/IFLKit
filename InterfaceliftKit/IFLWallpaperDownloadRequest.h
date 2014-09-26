//
//  IFLWallpaperDownloadRequest.h
//  InterfaceliftKit
//
//  Created by Freddy kelch on 9/18/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import "IFLRequest.h"

@interface IFLWallpaperDownloadRequest : IFLRequest

-(id)init;
-(id)initWithWallpaperId:(NSNumber*)wallpaperId withResolution:(NSString*)resolution;
@end
