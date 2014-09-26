//
//  IFLSingleWallpaperRequestTest.m
//  IFLKit
//
//  Created by Freddy kelch on 9/24/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLWallpapersRequest.h"

@interface IFLWallpapersRequestTest : XCTestCase
@property(strong,nonatomic) NSNumber* limit;
@property(strong,nonatomic) NSString* resolution;
@property(strong,nonatomic) NSString* sort_by;
@property(strong,nonatomic) NSString* sort_order;
@property(strong,nonatomic) NSNumber* start;
@property(strong,nonatomic) NSNumber* tag_id;
@property(strong,nonatomic) NSString* base_url;

@property(strong,nonatomic) NSArray* valid_sort_order;
@property(strong,nonatomic) NSArray* valid_srot_by;
@end

@implementation IFLWallpapersRequestTest

- (void)setUp {
    [super setUp];
    
    self.limit = @10;
    self.resolution = @"1920x1080";
    self.sort_by = @"date";
    self.sort_order = @"desc";
    self.start = @0;
    self.tag_id = @199;
    
    self.base_url = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/";
    self.valid_sort_order = @[@"desc", @"asc"];
    self.valid_srot_by = @[@"date", @"id", @"favorites", @"downloads", @"comments"];
}

- (void)tearDown {
    [super tearDown];
}


#pragma mark - Happy Path
-(void)testCommandRequestURL_OnlyRequired
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/wallpapers/";
    IFLWallpapersRequest* req = [[IFLWallpapersRequest alloc]init];
    req.baseUrl = self.base_url;
    NSURL* url = [req generateRequestURL];
    XCTAssert([expecting isEqualToString:[url description]],@"The URL is incorrectly formatted! %@",[url description]);
}

-(void)testCommandRequestURLWithOptionals_Limit
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/wallpapers/?limit=10";
    IFLWallpapersRequest* req = [[IFLWallpapersRequest alloc]init];
    req.baseUrl = self.base_url;
    req.limit = self.limit;
    NSURL* url = [req generateRequestURL];
    
    NSURLComponents* good_comp = [NSURLComponents componentsWithURL:[NSURL URLWithString:expecting] resolvingAgainstBaseURL:YES];
    NSURLComponents* test_comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    // Test schema
    XCTAssert([[good_comp scheme]isEqualToString:[test_comp scheme]], @"Schemas dont match! %@ vs. %@",[good_comp scheme], [test_comp scheme]);
    XCTAssert([[good_comp host]isEqualToString:[test_comp host]],     @"Host dont match! %@ vs. %@", [good_comp host], [test_comp host]);
    XCTAssert([[good_comp path]isEqualToString:[test_comp path]],     @"Path dont match! %@ vs. %@", [good_comp path], [test_comp path]);
    
    // Testing query items
    NSArray* good_items = [good_comp queryItems];
    NSArray* test_items = [test_comp queryItems];
    
    BOOL queryObjectsEqual = YES;
    for (id obj in good_items)
        queryObjectsEqual = queryObjectsEqual && ( [test_items indexOfObject:obj] != NSNotFound);
    
    XCTAssert(queryObjectsEqual, @"The query items didn't align..");
    
}

-(void)testCommandRequestURLWithOptionals_LimitResolution
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/wallpapers/?limit=10&resolution=1920x1080";
    IFLWallpapersRequest* req = [[IFLWallpapersRequest alloc]init];
    req.baseUrl = self.base_url;
    req.limit = self.limit;
    req.resolution = self.resolution;
    NSURL* url = [req generateRequestURL];
    
    NSURLComponents* good_comp = [NSURLComponents componentsWithURL:[NSURL URLWithString:expecting] resolvingAgainstBaseURL:YES];
    NSURLComponents* test_comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    // Test schema
    XCTAssert([[good_comp scheme]isEqualToString:[test_comp scheme]], @"Schemas dont match! %@ vs. %@",[good_comp scheme], [test_comp scheme]);
    XCTAssert([[good_comp host]isEqualToString:[test_comp host]], @"Host dont match! %@ vs. %@", [good_comp host], [test_comp host]);
    XCTAssert([[good_comp path]isEqualToString:[test_comp path]], @"Path dont match! %@ vs. %@", [good_comp path], [test_comp path]);
    
    // Testing query items
    NSArray* good_items = [good_comp queryItems];
    NSArray* test_items = [test_comp queryItems];
    
    BOOL queryObjectsEqual = YES;
    for (id obj in good_items)
        queryObjectsEqual = queryObjectsEqual && ( [test_items indexOfObject:obj] != NSNotFound);
    
    XCTAssert(queryObjectsEqual, @"The query items didn't align..");
    
}

-(void)testCommandRequestURLWithOptionals_LimitResolutionSortBy
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/wallpapers/?limit=10&resolution=1920x1080&sort_by=date";
    IFLWallpapersRequest* req = [[IFLWallpapersRequest alloc]init];
    req.baseUrl = self.base_url;
    req.limit = self.limit;
    req.resolution = self.resolution;
    req.sort_by = self.sort_by;
    NSURL* url = [req generateRequestURL];
    
    NSURLComponents* good_comp = [NSURLComponents componentsWithURL:[NSURL URLWithString:expecting] resolvingAgainstBaseURL:YES];
    NSURLComponents* test_comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    // Test schema
    XCTAssert([[good_comp scheme]isEqualToString:[test_comp scheme]], @"Schemas dont match! %@ vs. %@",[good_comp scheme], [test_comp scheme]);
    XCTAssert([[good_comp host]isEqualToString:[test_comp host]], @"Host dont match! %@ vs. %@", [good_comp host], [test_comp host]);
    XCTAssert([[good_comp path]isEqualToString:[test_comp path]], @"Path dont match! %@ vs. %@", [good_comp path], [test_comp path]);
    
    // Testing query items
    NSArray* good_items = [good_comp queryItems];
    NSArray* test_items = [test_comp queryItems];
    
    BOOL queryObjectsEqual = YES;
    for (id obj in good_items)
        queryObjectsEqual = queryObjectsEqual && ( [test_items indexOfObject:obj] != NSNotFound);
    
    XCTAssert(queryObjectsEqual, @"The query items didn't align..");
    
}

-(void)testCommandRequestURLWithOptionals_LimitResolutionSortBySortOrder
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/wallpapers/?limit=10&resolution=1920x1080&sort_by=date&sort_order=desc";
    IFLWallpapersRequest* req = [[IFLWallpapersRequest alloc]init];
    req.baseUrl = self.base_url;
    req.limit = self.limit;
    req.resolution = self.resolution;
    req.sort_by = self.sort_by;
    req.sort_order = self.sort_order;
    NSURL* url = [req generateRequestURL];
    
    NSURLComponents* good_comp = [NSURLComponents componentsWithURL:[NSURL URLWithString:expecting] resolvingAgainstBaseURL:YES];
    NSURLComponents* test_comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    // Test schema
    XCTAssert([[good_comp scheme]isEqualToString:[test_comp scheme]], @"Schemas dont match! %@ vs. %@",[good_comp scheme], [test_comp scheme]);
    XCTAssert([[good_comp host]isEqualToString:[test_comp host]], @"Host dont match! %@ vs. %@", [good_comp host], [test_comp host]);
    XCTAssert([[good_comp path]isEqualToString:[test_comp path]], @"Path dont match! %@ vs. %@", [good_comp path], [test_comp path]);
    
    // Testing query items
    NSArray* good_items = [good_comp queryItems];
    NSArray* test_items = [test_comp queryItems];
    
    BOOL queryObjectsEqual = YES;
    for (id obj in good_items)
        queryObjectsEqual = queryObjectsEqual && ( [test_items indexOfObject:obj] != NSNotFound);
    
    XCTAssert(queryObjectsEqual, @"The query items didn't align..");
    
}

-(void)testCommandRequestURLWithOptionals_LimitResolutionSortByStart
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/wallpapers/?limit=10&resolution=1920x1080&sort_by=date&sort_order=desc&start=0";
    IFLWallpapersRequest* req = [[IFLWallpapersRequest alloc]init];
    req.baseUrl = self.base_url;
    req.limit = self.limit;
    req.resolution = self.resolution;
    req.sort_by = self.sort_by;
    req.sort_order = self.sort_order;
    req.start = self.start;
    NSURL* url = [req generateRequestURL];
    
    NSURLComponents* good_comp = [NSURLComponents componentsWithURL:[NSURL URLWithString:expecting] resolvingAgainstBaseURL:YES];
    NSURLComponents* test_comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    // Test schema
    XCTAssert([[good_comp scheme]isEqualToString:[test_comp scheme]], @"Schemas dont match! %@ vs. %@",[good_comp scheme], [test_comp scheme]);
    XCTAssert([[good_comp host]isEqualToString:[test_comp host]], @"Host dont match! %@ vs. %@", [good_comp host], [test_comp host]);
    XCTAssert([[good_comp path]isEqualToString:[test_comp path]], @"Path dont match! %@ vs. %@", [good_comp path], [test_comp path]);
    
    // Testing query items
    NSArray* good_items = [good_comp queryItems];
    NSArray* test_items = [test_comp queryItems];
    
    BOOL queryObjectsEqual = YES;
    for (id obj in good_items)
        queryObjectsEqual = queryObjectsEqual && ( [test_items indexOfObject:obj] != NSNotFound);
    
    XCTAssert(queryObjectsEqual, @"The query items didn't align..");
    
}

-(void)testCommandRequestURLWithOptionals_LimitResolutionSortByStartTagId
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/wallpapers/?limit=10&resolution=1920x1080&sort_by=date&sort_order=desc&start=0&tag_id=199";
    IFLWallpapersRequest* req = [[IFLWallpapersRequest alloc]init];
    req.baseUrl = self.base_url;
    req.limit = self.limit;
    req.resolution = self.resolution;
    req.sort_by = self.sort_by;
    req.sort_order = self.sort_order;
    req.start = self.start;
    req.tag_id = self.tag_id;
    NSURL* url = [req generateRequestURL];
    
    NSURLComponents* good_comp = [NSURLComponents componentsWithURL:[NSURL URLWithString:expecting] resolvingAgainstBaseURL:YES];
    NSURLComponents* test_comp = [NSURLComponents componentsWithURL:url resolvingAgainstBaseURL:YES];
    
    // Test schema
    XCTAssert([[good_comp scheme]isEqualToString:[test_comp scheme]], @"Schemas dont match! %@ vs. %@",[good_comp scheme], [test_comp scheme]);
    XCTAssert([[good_comp host]isEqualToString:[test_comp host]], @"Host dont match! %@ vs. %@", [good_comp host], [test_comp host]);
    XCTAssert([[good_comp path]isEqualToString:[test_comp path]], @"Path dont match! %@ vs. %@", [good_comp path], [test_comp path]);
    
    // Testing query items
    NSArray* good_items = [good_comp queryItems];
    NSArray* test_items = [test_comp queryItems];
    
    BOOL queryObjectsEqual = YES;
    for (id obj in good_items)
        queryObjectsEqual = queryObjectsEqual && ( [test_items indexOfObject:obj] != NSNotFound);
    
    XCTAssert(queryObjectsEqual, @"The query items didn't align..");
    
}
@end
