#import "AppDelegate.h"

// searchkey: transform rotation
@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    
    MyViewController* myView = [[MyViewController alloc]init];
    
    [self.window setRootViewController:myView];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
