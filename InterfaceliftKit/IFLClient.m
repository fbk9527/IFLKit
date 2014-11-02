//
// IFLKit - Objective-C wrapper to the Interfacelift.com API
// Copyright (C) 2014  Fred Kelch <fred.kelch@gmail.com>
//
// This program is free software: you can redistribute it and/or modify
// it under the terms of the GNU General Public License as published by
// the Free Software Foundation, either version 3 of the License, or
// (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program.  If not, see <http://www.gnu.org/licenses/>.

#import <UIKit/UIKit.h>
#import "IFLClient.h"
#import "IFLRequest.h"

IFLClient* sharedClient = nil;

@interface IFLClient ()
@property(strong,nonatomic) NSMutableDictionary* requestDictionary;
@property(strong,nonatomic) NSURLSession* urlSession;
@property(strong,nonatomic) NSOperationQueue* operationQueue;
@end

@implementation IFLClient



#pragma mark - Initalization
-(instancetype)init
{
    return [self initWithPrivateKey:@""];
}


-(instancetype)initWithPrivateKey:(NSString *)privateKey
{
    self = [super init];
    if (self)
    {
        // Operation Queue
        _operationQueue = [NSOperationQueue new];
        _operationQueue.name = [[NSString alloc]initWithFormat:@"IFLClient.%@",[[NSBundle mainBundle]bundleIdentifier]];
        _operationQueue.maxConcurrentOperationCount = 4;
        
        // Session
        _urlSession = [NSURLSession sessionWithConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]
                                                    delegate:self
                                               delegateQueue:nil];
        
        // Reuest dictionary
        _requestDictionary = [NSMutableDictionary new];
        
        // Authentication
        self.privateKey = privateKey;
        
        if(privateKey)
            _urlSession.configuration.HTTPAdditionalHeaders = @{ @"X-Mashape-Key" : privateKey };
    }
    return self;
}





#pragma mark - Private Key mgmt
-(void)setPrivateKey:(NSString *)privateKey
{
    self.urlSession.configuration.HTTPAdditionalHeaders =  @{ @"X-Mashape-Key" : privateKey };
}

-(NSString*)privateKey
{
    return [self.urlSession.configuration.HTTPAdditionalHeaders objectForKey:@"X-Mashape-Key"];
}




#pragma mark - Handle Request
///TODO: Handle task dependencies
-(void)processRequest:(IFLRequest *)request
{
    if ([request respondsToSelector:@selector(generateRequestUrlWithBaseString:)]) {

        NSURLSessionDownloadTask* task = [self.urlSession downloadTaskWithURL:[request generateRequestUrlWithBaseString:self.baseURL]
                                                            completionHandler:nil];
        request.networkTask = task;
        [self.requestDictionary setObject:request forKey:@(task.taskIdentifier)];
    }
    
    
    [self.operationQueue addOperation:request];
}

-(NSString*)baseURL
{
    return @"https://interfacelift-interfacelift-wallpapers.p.mashape.com/v1";
}



#pragma mark - Shared Client
-(void)registerAsSharedClient
{
    sharedClient = self;
}

+(IFLClient*)sharedClient
{
    return sharedClient;
}



#pragma mark - Screen Helpers
+(NSString*)nativeResolution
{
    CGFloat scale = [[UIScreen mainScreen]scale];
    CGRect bounds = [[UIScreen mainScreen]bounds];
    
    CGFloat width = bounds.size.width * scale;
    CGFloat height = bounds.size.height * scale;
    return [NSString stringWithFormat:@"%ix%i",(int)width,(int)height];
}



#pragma mark - NSURLSession ‚Delegate Methods
-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didResumeAtOffset:(int64_t)fileOffset expectedTotalBytes:(int64_t)expectedTotalBytes
{
    IFLRequest* request = self.requestDictionary[@(downloadTask.taskIdentifier)];
    if(request)
    {
        if ([request respondsToSelector:@selector(URLSession:downloadTask:didResumeAtOffset:expectedTotalBytes:)]) {
            [request URLSession:session downloadTask:downloadTask didResumeAtOffset:fileOffset expectedTotalBytes:expectedTotalBytes];
        }
    }
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didWriteData:(int64_t)bytesWritten totalBytesWritten:(int64_t)totalBytesWritten totalBytesExpectedToWrite:(int64_t)totalBytesExpectedToWrite
{
    IFLRequest* request = self.requestDictionary[@(downloadTask.taskIdentifier)];
    if(request)
    {
        if ([request respondsToSelector:@selector(URLSession:downloadTask:didWriteData:totalBytesWritten:totalBytesExpectedToWrite:)]) {
            [request URLSession:session downloadTask:downloadTask didWriteData:bytesWritten totalBytesWritten:totalBytesExpectedToWrite totalBytesExpectedToWrite:totalBytesExpectedToWrite];
        }
    }
}

-(void)URLSession:(NSURLSession *)session downloadTask:(NSURLSessionDownloadTask *)downloadTask didFinishDownloadingToURL:(NSURL *)location
{
    IFLRequest* request = self.requestDictionary[@(downloadTask.taskIdentifier)];
    if(request)
    {
        if ([request respondsToSelector:@selector(URLSession:downloadTask:didFinishDownloadingToURL:)]) {
            [request URLSession:session downloadTask:downloadTask didFinishDownloadingToURL:location];
        }
        
        // Remove object from dictionary
        [self.requestDictionary removeObjectForKey:@(downloadTask.taskIdentifier)];
    }
}
@end
