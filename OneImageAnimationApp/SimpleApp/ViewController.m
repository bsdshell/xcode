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
    
    [self CartesianCoordinate:self.view.layer];
    
    
    CGRect originalFrame = CGRectMake(50, 10, 200, 200);
    CGRect frame = CGRectMake(50, 250, 200, 200);
    self.view.backgroundColor = [UIColor grayColor];
    _rectLayer = [CAShapeLayer layer];

    _oriImageView = [[UIImageView alloc]initWithFrame:originalFrame];
    UIImage* oriImage = [UIImage imageNamed:@"food.jpg"];
    _oriImageView.image = oriImage;
    [self animationRectangle];

//    [self animationImage];
//    [self.view addSubview:_oriImageView];
}

-(void)myDrawRectangle{
    CGFloat width = 100.0;
    CGFloat height = 100.0;
    CGSize size          = [UIScreen mainScreen].bounds.size;
    CGFloat offset = 100.0;
    CGPoint centerPoint = CGPointMake(size.width/2 - width/2, size.height/2 - height/2 + offset);
    
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(centerPoint.x, centerPoint.y, width, height)];
    
    _rectLayer.lineWidth = 10.0f;
    _rectLayer.strokeColor = [[UIColor brownColor] CGColor];
    [_rectLayer setFillColor:[[UIColor clearColor] CGColor]];
    [_rectLayer setPath:[path CGPath]];
    
    [self animationRectangle];
    [self.view.layer addSublayer:_rectLayer];
}

-(void)animationRectangle{
    CGFloat width = 100.0;
    CGFloat height = 100.0;
    CGSize size          = [UIScreen mainScreen].bounds.size;
    CGFloat offset = 100.0;
    CGPoint leftUp = CGPointMake(size.width/2 - width/2, size.height/2 - height/2);
    
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(leftUp.x, leftUp.y, width, height)];
    
    _rectLayer.lineWidth = 10.0f;
    _rectLayer.strokeColor = [[UIColor brownColor] CGColor];
    [_rectLayer setFillColor:[[UIColor clearColor] CGColor]];
    [_rectLayer setPath:[path CGPath]];
    
    _rectLayer.bounds = CGRectMake(leftUp.x, leftUp.y, width, height);
    _rectLayer.anchorPoint = CGPointMake((size.width/2)/size.width, (size.height/2)/size.height);
    _rectLayer.position = CGPointMake(size.width/2 + 50, size.height/2 + 100);

//    _myViewController = [[UIViewController alloc]init];
//    
//    _myViewController.view.layer.anchorPoint = CGPointMake((size.width/2)/size.width, (size.height/2)/size.height);
//    _myViewController.view.layer.position = CGPointMake(size.width/2, size.height/2);
    
//    [_myViewController.view.layer addSublayer:_rectLayer];
//    [self.view addSubview:_myViewController.view];
    [self.view.layer addSublayer:_rectLayer];
    
    CGFloat duration = 3.0;
    CGFloat repeat = 1.0;

    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;
    
    //[_myViewController.view.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    
    [_rectLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
}

-(void)CartesianCoordinate:(CALayer*)layer{
    CGSize size          = [UIScreen mainScreen].bounds.size;
    
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    // Vertical line
    [path moveToPoint:CGPointMake(size.width/2, 0)];
    [path addLineToPoint:CGPointMake(size.width/2, size.height)];
    
    // Horizontal line
    [path moveToPoint:CGPointMake(0, size.height/2)];
    [path addLineToPoint:CGPointMake(size.width, size.height/2)];
    
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor blackColor] CGColor];
    shapeLayer.fillColor = [[UIColor brownColor] CGColor];
    shapeLayer.lineWidth = 1.0f;
    [layer addSublayer:shapeLayer];
}

-(void)animationImage{
    CGFloat duration = 1.0;
    CGFloat repeat = 1.0;
    
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;

    [_oriImageView.layer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
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
