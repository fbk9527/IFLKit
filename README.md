#IFLKit#
<HL/>
IFLKit is a [Interfacelift.com](www.interfacelift.com) warapper, written in Objective-C.
<HL/>
#Getting Started#

IFLKit is free for both commercial and public use. However, the REST feed provided by [Interfacelift.com](www.interfacelift.com) is not. Before IFLKit can be used a developer will need to register and subscribe to one of the pricing models at [mashape.com](www.mashape.com).

### IFLKit Client ###

IFLKit is structured around the ```IFLClient``` class. The ```IFLClient``` class manages both authentication and communication with the provider. The ```IFLClient``` is not a singleton class allowing users the ability to distribute request between multiple keys, but does provide a class level instance that can be shared throughout your application. 

```Objective-C
[[[IFLClient alloc]initWithPrivateKey:@"YOUR-PRIVATE-KEY"]registerAsSharedClient];
```

The UIApplicationDelegate method```-(BOOL)applicaiton:(UIApplicaiton*)application didFinishLaunchingWithOptions:(NSDictionary*)launchOptions``` is a good place to seed the shared key. This key can later be accessed by calling the clas method ```[IFLClient sharedClient]```. Once you have registered your shared key you can start processesing request.

## IFLRequest ##
All request are descendents of the ```IFLRequest``` class and follow the same use pattern. The following example will download the ten most recent wallapaper submissions since the provided unix timestamp.

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
 ***Note*** Users that are not using a shared client, but instead have a strong reference to a locally created instance, should pay special attention to avoiding retain cycles. All ```IFLRequest``` are subclasses of ```NSOperation``` and are managed by a local ```NSOperationQueue``` in the ```IFLClient```. If you need to make references to self in these instences you should create a weak reference first and refer to that reference.

Both the success & failure block are passed back the payload of the HTTP request. In the success block the user is given either an Array or Dictionary depending on if the request expects a single or multiple values.

Both the ```success``` and ```failure``` blocks are called on a background thread. Any updates that need to take place should be added to the main queue. You can easily do this by adding a block to the main operation queue.
 
 ```Objective-C
 [[NSOperationQueue mainQueue]addOperationWithBlock^{
  // Update view state
 }];
 ```
 
## Documentation ##
 
