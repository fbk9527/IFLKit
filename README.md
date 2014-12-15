#IFLKit#
<HL/>
IFLKit is a [Interfacelift.com](http://www.interfacelift.com) wrapper, written in Objective-C.
<HL/>

#Getting Started#

IFLKit is free for both commercial and public use. Before you can use IFLKit you will need to obtain a private key from interfacelift. You can register for an account at [interfacelift.com](https://interfacelift.com/account/signup/) and obtain a private key at their API site [api.ifl.cc](https://api.ifl.cc/developer/keys/).

### IFLKit Client ###

IFLKit is structured around the ```IFLClient``` class. The ```IFLClient``` class manages both authentication and communication with the provider. The ```IFLClient``` is not a singleton class allowing users the ability to distribute request between multiple keys, but does provide a class level instance that can be shared throughout your application.

```Objective-C
// Create instance
IFLClient* client = [[IFLClient alloc]initWithPrivateKey:@"YOUR-PRIVATE-KEY"];

// Register client
[client registerAsSharedClient]
```



### IFLRequest ###
All request are descendents of the ```IFLRequest``` class. The following example will download the ten most recent wallpaper submissions since the provided unix timestamp.

```Objective-C
NSNumber* unixTimestamp = @1396378800;
NSNumber* limit = @10;

IFLWallpaperByTimestampRequest *req =
 [[IFLWallpaperByTimestampRequest alloc]initWithTimestamp:unixTimestamp];
 req.limit = limit;

 [req setSuccessBlock:^(id data, NSHTTPURLResponse* resp, NSError* error){
  // Handle success
 }];

 [req setFailureBlock:^(id data, NSHTTPURLResponse* resp, NSError* error){
  // Handle Failure
 }];

[[IFLClient sharedClient]processRequest:req];
```
 ***Note*** Users that are not using a shared client, but instead have a strong reference to a locally created instance, should pay special attention to avoiding retain cycles. All ```IFLRequest``` are subclasses of ```NSOperation``` and are managed by a local ```NSOperationQueue``` in the ```IFLClient```. If you need to make references to self in these instances you should create a weak reference first and refer to that reference.

Both the success & failure block are passed back the payload of the HTTP request. Both are passed back and NSData payload containing the content of the request.

Both the ```success``` and ```failure``` blocks are called on a background thread. Any UI updates that need to take place should be added to the main queue. You can easily do this by adding a block to the main operation queue.

 ```Objective-C
 [[NSOperationQueue mainQueue]addOperationWithBlock^{
  // Update view state
 }];
 ```
