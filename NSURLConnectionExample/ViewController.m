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

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
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
    
    
    // make a request to the URL
    NSURLRequest* request = [NSURLRequest requestWithURL:[NSURL URLWithString:@"http://tiny3.com/image/4Tile.svg"]];
    NSURLConnection* connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    
    NSURLResponse* response = nil;
    NSError* error = nil;
    NSData* data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];

    if(error == nil){
        NSLog(@"nsdata[%s]", data);
        NSLog(@"it seems to be ok");
    }
    
}
-(void) clickMe:(id) sender
{
    NSLog(@"click me");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
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

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // The request is complete and data has been received
    // You can parse the stuff in your instance variable now
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    NSString *path = [documentsDirectory stringByAppendingPathComponent:@"myfile.svg"];

    [self.receivedData writeToFile:path atomically:YES];
    
    NSLog(@"%s", __PRETTY_FUNCTION__);
    
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // The request has failed for some reason!
    // Check the error var
    NSLog(@"%s", __PRETTY_FUNCTION__);
}

@end
