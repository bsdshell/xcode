#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface ViewController()
@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(100, 250, 140, 50);
    mybut.frame = frame;

    [mybut addTarget:self action:@selector(clickMe:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setBackgroundImage:[[UIImage imageNamed:@"pic.png"] stretchableImageWithLeftCapWidth:0.0 topCapHeight:0.0] forState:UIControlStateNormal];
    [mybut setTitle:@"mybut" forState:(UIControlState) UIControlStateNormal];
    self.view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:mybut];
    
}
-(void) clickMe:(id) sender{
    NSLog(@"click me");
}
@end
