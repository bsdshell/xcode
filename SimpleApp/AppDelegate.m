#import "AppDelegate.h"
#import "ViewController.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    
    
    ViewController* viewController = [[ViewController alloc]init];
    [self.window setRootViewController:viewController];
    
    [self.window makeKeyAndVisible];
    
    // Override point for customization after application launch.
    return YES;
}
@end
