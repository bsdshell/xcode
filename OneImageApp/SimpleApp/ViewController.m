#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface ViewController ()
@end

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

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    CGRect originalFrame = CGRectMake(50, 10, 200, 200);
    CGRect frame = CGRectMake(50, 250, 200, 200);
    self.view.backgroundColor = [UIColor grayColor];

    UIImageView* oriImageView = [[UIImageView alloc]initWithFrame:originalFrame];
    UIImage* oriImage = [UIImage imageNamed:@"food.jpg"];
    oriImageView.image = oriImage;
    [self.view addSubview:oriImageView];
}

-(void) clickMe:(id) sender
{
    NSLog(@"click me");
}

- (void)viewDidUnload
{
    [super viewDidUnload];
}

@end
