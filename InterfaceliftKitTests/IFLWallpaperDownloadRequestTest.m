//
//  IFLWallpaperDownloadRequestTest.m
//  IFLKit
//
//  Created by Freddy kelch on 9/24/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLWallpaperDownloadRequest.h"

@interface IFLWallpaperDownloadRequestTest : XCTestCase
@property(strong,nonatomic) NSString* resolution;
@property(strong,nonatomic) NSNumber* wallpaper_id;
@property(strong,nonatomic) NSString* base_url;
@end

@implementation IFLWallpaperDownloadRequestTest

- (void)setUp
{
    [super setUp];
    self.resolution = @"1920x1080";
    self.wallpaper_id = @3001;
    self.base_url = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/";
}

- (void)tearDown
{
    [super tearDown];
}

#pragma mark - happy path
#pragma mark - Happy Path
-(void)testCommandRequestURL_OnlyRequired
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/wallpaper_download/3001/'1920x1080'/";
    IFLWallpaperDownloadRequest* req = [[IFLWallpaperDownloadRequest alloc]initWithWallpaperId:self.wallpaper_id withResolution:self.resolution];
    req.baseUrl = self.base_url;
    NSURL* url = [req generateRequestURL];
    XCTAssert([expecting isEqualToString:[url description]],@"The URL is incorrectly formatted! %@",[url description]);
}

@end
