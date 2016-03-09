#import "ViewController.h"
#import "QuartzCore/QuartzCore.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];

    
    [self CartesianCoordinate:self.view.layer];
    [self animationRectangle];
}

-(void)printLayerInfo:(CALayer*)layer{
    CGPoint anchorPoint = layer.anchorPoint;
    CGPoint position = layer.position;
    CGRect layerFrame = layer.frame;
    CGRect layerBounds = layer.bounds;
    NSLog(@"anchor_x=[%f] anchor_y=[%f]  position_x=[%f], position_y=[%f]", anchorPoint.x, anchorPoint.y, position.x, position.y);
    NSLog(@"anchor_point   =[%@]", [NSValue valueWithCGPoint:anchorPoint]);
    NSLog(@"layer_position =[%@]", [NSValue valueWithCGPoint:position]);
    NSLog(@"layer_frame    =[%@]", [NSValue valueWithCGRect:layerFrame]);
    NSLog(@"layer_bounds   =[%@]", [NSValue valueWithCGRect:layerBounds]);
}

-(void)animationRectangle{
    CGFloat width = 40.0;
    CGFloat height = 40.0;
    CGSize size          = [UIScreen mainScreen].bounds.size;
    CGFloat offsetX = 100.0;
    CGFloat offsetY = 50.0;
    //CGPoint leftUp = CGPointMake(size.width/2 - width/2, size.height/2 - height/2);
    CGPoint leftUp = CGPointMake(0, 0);

    
    CGFloat duration = 3.0;
    CGFloat repeat = 1.0;
    CABasicAnimation* rotationAnimation;
    rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat: M_PI * 2.0];
    rotationAnimation.duration = duration;
    rotationAnimation.cumulative = YES;
    rotationAnimation.repeatCount = repeat;

    CAShapeLayer* mainLayer = [CAShapeLayer layer];
    mainLayer.frame = CGRectMake(100, 100, 200, 150);
    mainLayer.lineWidth = 4.0f;
    mainLayer.strokeColor = [[UIColor blackColor]CGColor];
    
    for(int i=0; i<1; i++){
        for(int j=0; j<1; j++){
            CAShapeLayer* rectLayer = [CAShapeLayer layer];
            
            UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(leftUp.x + j*50, leftUp.y + i*50, width, height)];
            
            rectLayer.lineWidth = 1.0f;
            rectLayer.strokeColor = [[UIColor brownColor] CGColor];
            [rectLayer setFillColor:[[UIColor clearColor] CGColor]];
            [rectLayer setPath:[path CGPath]];
            //rectLayer.bounds = CGRectMake(0 + j*50, 0 + i*50, width, height);
            //rectLayer.position = CGPointMake(size.width/2, size.height/2);
            rectLayer.position = CGPointMake(0, 0);
        
            if(i % 2 == 0)
                rectLayer.backgroundColor = [[UIColor greenColor] CGColor];
            else
                rectLayer.backgroundColor = [[UIColor blueColor] CGColor];
            
            [self printLayerInfo:rectLayer];

            [self.view.layer addSublayer:rectLayer];
            
            //[mainLayer addSublayer:rectLayer];
        }
    }
    [mainLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    mainLayer.position = CGPointMake(100, 100);
    mainLayer.backgroundColor = [[UIColor clearColor] CGColor];
    mainLayer.anchorPoint = CGPointMake(0.5, 0.5);
    
    //[self.view.layer addSublayer:mainLayer];
    
    CAShapeLayer* newLayer = [CAShapeLayer layer];
    
    UIBezierPath* newPath = [UIBezierPath bezierPathWithRect:CGRectMake(leftUp.x, leftUp.y, width, height)];
    
    newLayer.lineWidth = 10.0f;
    newLayer.strokeColor = [[UIColor brownColor] CGColor];
    [newLayer setFillColor:[[UIColor clearColor] CGColor]];
    [newLayer setPath:[newPath CGPath]];
    
    newLayer.bounds = newPath.bounds;
    CGPoint newLayerCenter = CGPointMake(leftUp.x + width/2 , leftUp.y + height/2);
    
    newLayer.anchorPoint = CGPointMake(newLayerCenter.x/size.width, newLayerCenter.y/size.height);
    CGFloat offset = 100.0;
    newLayer.position = CGPointMake(size.width/2, size.height/2 + offset);
    
    [newLayer addAnimation:rotationAnimation forKey:@"rotationAnimation"];
    [self.view.layer addSublayer:newLayer];
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

-(void) clickMe:(id) sender{
    NSLog(@"click me");
}

- (void)viewDidUnload{
    [super viewDidUnload];
}

@end
