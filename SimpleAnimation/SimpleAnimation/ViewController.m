#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    NSArray *imageNames = @[@"dance_0.png",
                            @"dance_1.png",
                            @"dance_2.png",
                            @"dance_3.png",
                            @"dance_4.png",
                            @"dance_5.png"];

    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }

    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 60, 400, 400)];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 0.5;

    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
