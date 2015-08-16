//
//  ViewController.m
//  tut1
//
//  Created by aa aa on 12-06-16.
//  Copyright (c) 2012 asdfk. All rights reserved.
//

#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"


@implementation MyButton
-(id) initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame])
    {
        [self.layer setBorderWidth:1.0];
        [self.layer setCornerRadius:0];
        CGColorSpaceRef rgb=CGColorSpaceCreateDeviceRGB();
        CGFloat mycolor[] = {0.5, 0.5, 0.5, 0.5};
        CGColorRef col=CGColorCreate(rgb, mycolor);
        [self.layer setBackgroundColor:col];
        [self.layer setBorderColor:[[UIColor colorWithWhite:0.3 alpha:0.7]CGColor]];
        //cool
        
    }
    return self;
}
@end

@interface ViewController ()

@end

@implementation ViewController
@synthesize receivedData = _receivedData;
@synthesize fileName = _fileName;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    self.fileName = @"myimage.png";
    
	// Do any additional setup after loading the view, typically from a nib.
    //cool
    MyButton* mybut;
    mybut = [MyButton buttonWithType:UIBarButtonItemStylePlain];
    CGRect frame;
    frame = CGRectMake(100, 100, 100, 50);
    mybut.frame = frame;
    
    [mybut addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setBackgroundImage:[[UIImage imageNamed:@"pic.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [mybut setTitle:@"mybut" forState:(UIControlState) UIControlStateNormal];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:mybut];
    
    //[self makeRequest];
    [self makeConnection];
}

-(void)makeRequest{
    // make a request to the URL
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://tiny3.com/image/myimage.png"]];
    NSURLResponse* response = nil;
    NSError* error = nil;

    if(error == nil){
        NSLog(@"it seems to be ok");
    }else{
        NSLog(@"[ERROR][%@] %s", [error localizedDescription], __PRETTY_FUNCTION__);
    }
}

-(void)makeConnection{
    
    // read file from document directory
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *fullPath = [documentsDirectory stringByAppendingPathComponent:self.fileName];
    
    NSData* nsData = [[NSFileManager defaultManager] contentsAtPath:fullPath];

    // attach the nsdata to http request with filename
    NSMutableURLRequest* urlRequest = [self sendRequest:nsData fileName:self.fileName];

    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:urlRequest delegate:self];
    [connection start];
}

-(NSMutableURLRequest*)sendRequest:(NSData*)contentNSData fileName:(NSString*)fileName {
    NSString* uploadULR = @"http://tiny3.com/post.php";
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
    [request setURL:[NSURL URLWithString:uploadULR]];
    [request setHTTPMethod:@"POST"];
    
    NSMutableData* httpBody = [[NSMutableData alloc]init];
    
    NSString* boundary = @"-----------------------38782374123874172340";
    NSString* contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
    
    [httpBody appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    
    
    [httpBody appendData:[[NSString stringWithFormat:@"Content-Disposition: attachment; name=\"image\"; filename=\"myimage.png\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
    [httpBody appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [httpBody appendData:contentNSData];
    [httpBody appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    [httpBody appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:httpBody];
    return request;
}

-(void) clickMe:(id) sender{
    NSLog(@"click me");
}

- (void)viewDidUnload{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

#pragma mark NSURLConnection Delegate Methods

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // A response has been received, this is where we initialize the instance var you created
    // so that we can append data to it in the didReceiveData method
    // Furthermore, this method is called each time there is a redirect so reinitializing it
    // also serves to clear it
    self.receivedData = [[NSMutableData alloc] init];
    NSLog(@"length=[%lld]", response.expectedContentLength);
    NSLog(@"fileName[%@]", response.suggestedFilename);
    NSLog(@"URL=[%@]", response.URL);
    
    NSLog(@"cool stuff");
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    // Append the new data to the instance variable you declared
    [self.receivedData appendData:data];

    NSLog(@"%s", __PRETTY_FUNCTION__);
}

- (NSCachedURLResponse *)connection:(NSURLConnection *)connection
                  willCacheResponse:(NSCachedURLResponse*)cachedResponse {
    // Return nil to indicate not necessary to store a cached response for this connection
    NSLog(@"%s", __PRETTY_FUNCTION__);
    return nil;
}

-(void)saveToDocumentsDirectory:(NSData*)nsDataBuffer fileName:(NSString*)fileName{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];

    NSString *path = [documentsDirectory stringByAppendingPathComponent:fileName];

    NSLog(@"path=[%@]", path);
    [nsDataBuffer writeToFile:path atomically:YES];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    NSLog(@"%s", __PRETTY_FUNCTION__);
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
    NSString* fileName = @"myimage.png";
    [self saveToDocumentsDirectory:self.receivedData fileName:fileName];
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    NSLog(@"%s", __PRETTY_FUNCTION__);
}



//- (NSURLRequest *)buildRequest:(NSData *)paramData fileName:(NSString *)name {
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    NSString *charset = (NSString *)CFStringConvertEncodingToIANACharSetName(CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
//    [request setURL:@"http://tiny3.com/post.php"];
//    [request setHTTPMethod:@"POST"];
//    
//    NSString *boundary = @"0xKhTmLbOuNdArY";
//    NSString *endBoundary = [NSString stringWithFormat:@"\r\n--%@\r\n", boundary];
//    
//    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; charset=%@; boundary=%@", charset, boundary];
//    [request addValue:contentType forHTTPHeaderField: @"Content-Type"];
//    
//    NSMutableData *tempPostData = [NSMutableData data];
//    [tempPostData appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    // Sample Key Value for data
//    [tempPostData appendData:[[NSString stringWithFormat:@"Content- : form-data; name=\"%@\"\r\n\r\n", @"Key_Param"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [[tempPostData appendData:@"Value_Param"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [tempPostData appendData:[endBoundary dataUsingEncoding:NSUTF8StringEncoding]];
//    
//    // Sample file to send as data
//    [tempPostData appendData:[[NSString stringWithFormat:@"Content-Disposition: form-data; name=\"userfile\"; filename=\"%@\"\r\n", name] dataUsingEncoding:NSUTF8StringEncoding]];
//    [tempPostData appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    [tempPostData appendData:paramData];
//    [tempPostData appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [request setHTTPBody:tempPostData];
//    return request;
//}


//-(void) doit{
//    //Activate the status bar spinner
//    UIApplication* app = [UIApplication sharedApplication];
//    app.networkActivityIndicatorVisible = YES;
//
//    //The image you want to upload represented in JPEG
//    //NOTE: the 'selectedPhoto' needs to be replaced with the UIImage you'd like to upload
//    NSData *imageData = UIImageJPEGRepresentation(selectedPhoto, 1);
//
//    //NOTE: Change this to the upload URL you're posting to
//    NSString *uploadUrl = @"http://[YOUR UPLOAD URL]";
//
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] init];
//    [request setURL:[NSURL URLWithString:uploadUrl]];
//    [request setHTTPMethod:@"POST"];
//
//    NSMutableData *body = [NSMutableData data];
//
//    NSString *boundary = @"---------------------------14737809831466499882746641449";
//    NSString *contentType = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
//    [request addValue:contentType forHTTPHeaderField:@"Content-Type"];
//
//    //The file to upload
//    [body appendData:[[NSString stringWithFormat:@"--%@\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[[NSString stringWithFormat:@"Content-Disposition: attachment; name=\"image\"; filename=\"image.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[@"Content-Type: application/octet-stream\r\n\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//    [body appendData:[NSData dataWithData:imageData]];
//    [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
//
//    // close the form
//    [body appendData:[[NSString stringWithFormat:@"--%@--\r\n", boundary] dataUsingEncoding:NSUTF8StringEncoding]];
//
//    // set request body
//    [request setHTTPBody:body];
//
//    // Configure your request here.  Set timeout values, HTTP Verb, etc.
//    NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];
//
//    //start the connection
//    [connection start];
//
//    //Stop the status bar spinner
//    app.networkActivityIndicatorVisible = NO;
//}

@end
