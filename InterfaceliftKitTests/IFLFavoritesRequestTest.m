//
//  IFLFavoritesRequestTest.m
//  IFLKit
//
//  Created by Freddy kelch on 9/24/14.
//  Copyright (c) 2014 Frederick Kelch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <XCTest/XCTest.h>
#import "IFLFavoritesRequest.h"

@interface IFLFavoritesRequestTest : XCTestCase
@property(strong,nonatomic) NSNumber* user_id;
@property(strong,nonatomic) NSNumber* limit;
@property(strong,nonatomic) NSString* resolution;
@property(strong,nonatomic) NSString* sort_by;
@property(strong,nonatomic) NSString* sort_order;
@property(strong,nonatomic) NSNumber* start;
@property(strong,nonatomic) NSString* base_url;
@end

@implementation IFLFavoritesRequestTest

- (void)setUp {
    [super setUp];
    self.user_id = @312;
    self.limit = @10;
    self.resolution = @"1920x1080";
    self.sort_by = @"date";
    self.sort_order = @"desc";
    self.start = @0;
    self.base_url = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/";
}

- (void)tearDown {
    [super tearDown];
}

#pragma mark - HappyPathUrlConstruction
-(void)testCommandRequestURL_OnlyRequired
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/favorites/312/";
    IFLFavoritesRequest* req = [[IFLFavoritesRequest alloc]initWithUserId:self.user_id];
    
    NSURL* url =  [req generateRequestUrlWithBaseString:self.base_url];
    XCTAssert([expecting isEqualToString:[url description]],@"The URL is incorrectly formatted! %@",[url description]);
}

-(void)testCommandRequestURLWithOptionals_Limit
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/favorites/312/?limit=10";
    IFLFavoritesRequest* req = [[IFLFavoritesRequest alloc]initWithUserId:self.user_id];
    
    req.limit = self.limit;

    NSURL* url =  [req generateRequestUrlWithBaseString:self.base_url];
    
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

-(void)testCommandRequestURLWithOptionals_LimitResolution
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/favorites/312/?limit=10&resolution=1920x1080";
    IFLFavoritesRequest* req = [[IFLFavoritesRequest alloc]initWithUserId:self.user_id];
    
    req.limit = self.limit;
    req.resolution = self.resolution;

    NSURL* url =  [req generateRequestUrlWithBaseString:self.base_url];
    
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

-(void)testCommandRequestURLwithOptionals_LimitResolutionSortBy
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/favorites/312/?limit=10&resolution=1920x1080&sort_by=date";
    IFLFavoritesRequest* req = [[IFLFavoritesRequest alloc]initWithUserId:self.user_id];
    
    req.limit = self.limit;
    req.resolution = self.resolution;
    req.sort_by  = self.sort_by;

    NSURL* url =[req generateRequestUrlWithBaseString:self.base_url];
    
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
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/favorites/312/?limit=10&resolution=1920x1080&sort_by=date&sort_order=desc";
    IFLFavoritesRequest* req = [[IFLFavoritesRequest alloc]initWithUserId:self.user_id];
    
    req.limit = self.limit;
    req.resolution = self.resolution;
    req.sort_by  = self.sort_by;
    req.sort_order = self.sort_order;

    NSURL* url =  [req generateRequestUrlWithBaseString:self.base_url];
    
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

-(void)testCommandRequestURLWithOptionals_LimitResolutionSortBySortOrderStart
{
    NSString* expecting = @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1/favorites/312/?limit=10&resolution=1920x1080&sort_by=date&sort_order=desc&start=0";
    IFLFavoritesRequest* req = [[IFLFavoritesRequest alloc]initWithUserId:self.user_id];
    
    req.limit = self.limit;
    req.resolution = self.resolution;
    req.sort_by  = self.sort_by;
    req.sort_order = self.sort_order;
    req.iflstart = self.start;

    NSURL* url =  [req generateRequestUrlWithBaseString:self.base_url];
    
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
