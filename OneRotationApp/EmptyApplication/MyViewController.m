//
//  MyViewController.m
//  OneCAShaperTransform
//
//  Created by cat on 3/4/16.
//  Copyright (c) 2016 searchBarDemo. All rights reserved.
//

#import "MyViewController.h"

@interface MyViewController ()

@end

@implementation MyViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _transform = CATransform3DIdentity;
    _nonCenterTransform = CATransform3DIdentity;
    
    CGSize size          = [UIScreen mainScreen].bounds.size;

    [self myDrawRectangle];
    
    CAShapeLayer* verticalLine = [self verticalLine];
    [self.view.layer addSublayer:verticalLine];
    
    [self myButtonX];
    [self myButtonY];
    [self myButtonZ];
    [self myButtonRot];
    
    _axisX = false;
    _axisY = false;
    _axisZ = false;
    _rotX = 0;
    _rotY = 0;
    _rotZ = 0;
    _nonCenter = 0;
    _isRotated = false;
    
    _rectLayer = [CAShapeLayer layer];
    _nonCenterLayer = [CAShapeLayer layer];
    _width = 100.0f;
    _height = 100.0f;
    
    _mycenter = CGPointMake(size.width/2 - _width/2, size.height/2 - _height/2);
    
    _curveCenter = CGPointMake(100, 100);
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(_mycenter.x, _mycenter.y, _width, _height)];
    _rectLayer.lineWidth = 10.0f;
    _rectLayer.strokeColor = [[UIColor brownColor] CGColor];
    [_rectLayer setFillColor:[[UIColor clearColor] CGColor]];
    [_rectLayer setPath:[path CGPath]];
    
    
    [_myView.view.layer addSublayer:_rectLayer];
    
    UIBezierPath* path1 = [UIBezierPath bezierPathWithRect:CGRectMake(_curveCenter.x - _width/2, _curveCenter.y - _height/2, _width, _height)];
    
    _nonCenterLayer.lineWidth = 10.0f;
    _nonCenterLayer.strokeColor = [[UIColor purpleColor] CGColor];
    [_nonCenterLayer setFillColor:[[UIColor clearColor] CGColor]];
    [_nonCenterLayer setPath:[path1 CGPath]];
    
    [self.view.layer addSublayer:_nonCenterLayer];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)myDrawRectangle{
    CGFloat width = 100.0;
    CGFloat height = 100.0;
    CGSize size          = [UIScreen mainScreen].bounds.size;
    CGFloat offset = 50.0;
    CGPoint centerPoint = CGPointMake(size.width/2 - width/2, size.height/2 - height/2 + offset);
    
    UIBezierPath* path = [UIBezierPath bezierPathWithRect:CGRectMake(centerPoint.x, centerPoint.y, width, height)];
    _rectLayer.lineWidth = 10.0f;
    _rectLayer.strokeColor = [[UIColor darkGrayColor] CGColor];
    [_rectLayer setFillColor:[[UIColor clearColor] CGColor]];
    [_rectLayer setPath:[path CGPath]];
    [self.view.layer addSublayer:_rectLayer];
}


-(CAShapeLayer*)CartesianCoordinate{
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
    return shapeLayer;
}

-(CAShapeLayer*)verticalLine{
    CGSize size          = [UIScreen mainScreen].bounds.size;
    
    CAShapeLayer* shapeLayer = [CAShapeLayer layer];
    UIBezierPath* path = [UIBezierPath bezierPath];
    
    // Vertical line
    [path moveToPoint:CGPointMake(_mycenter.x + _width+10  + _width/2, 0)];
    [path addLineToPoint:CGPointMake(_mycenter.x + _width+10 + _width/2, size.height)];
    
    shapeLayer.path = [path CGPath];
    shapeLayer.strokeColor = [[UIColor brownColor] CGColor];
    shapeLayer.lineWidth = 1.0f;
    return shapeLayer;
}


-(void)myButtonX{
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(2, 450, 100, 50);
    mybut.frame = frame;
    [mybut addTarget:self action:@selector(clickRotX:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Rotate X" forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    mybut.backgroundColor = [UIColor brownColor];
    [self.view addSubview:mybut];
}

-(void)myButtonY{
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(110, 450, 100, 50);
    mybut.frame = frame;
    [mybut addTarget:self action:@selector(clickRotY:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Rotate Y" forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    mybut.backgroundColor = [UIColor brownColor];
    [self.view addSubview:mybut];
}

-(void)myButtonZ{
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(230, 450, 100, 50);
    mybut.frame = frame;
    [mybut addTarget:self action:@selector(clickRotZ:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Rotate Z" forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    mybut.backgroundColor = [UIColor brownColor];
    [self.view addSubview:mybut];
}

-(void)myButtonRot{
    UIButton* mybut = [UIButton buttonWithType:UIButtonTypeSystem];
    CGRect frame = CGRectMake(2, 500+10, 100, 50);
    mybut.frame = frame;
    [mybut addTarget:self action:@selector(clickNonCenter:) forControlEvents:UIControlEventTouchUpInside];
    [mybut setTitle:@"Rot nonCenter" forState:(UIControlState) UIControlStateNormal];
    [mybut setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [mybut.titleLabel setFont:[UIFont boldSystemFontOfSize:14]];
    mybut.backgroundColor = [UIColor brownColor];
    [self.view addSubview:mybut];
}


-(void)clickRotX:(id)sender{
    _axisX = true;
    _axisY = false;
    _axisZ = false;
}

-(void)clickRotY:(id)sender{
    _axisX = false;
    _axisY = true;
    _axisZ = false;
}

-(void)clickRotZ:(id)sender{
    _axisX = false;
    _axisY = false;
    _axisZ = true;
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
    NSLog(@"frame_origin   =[%@]", [NSValue valueWithCGPoint:layerFrame.origin]);
    NSLog(@"layer_bounds   =[%@]", [NSValue valueWithCGRect:layerBounds]);
}

-(void)printCATransform3D:(CATransform3D)transform{
    NSLog(@"-------------------------------------------------------------------------------");
    NSLog(@"[%f] [%f] [%f] [%f]", transform.m11, transform.m12, transform.m13, transform.m14);
    NSLog(@"[%f] [%f] [%f] [%f]", transform.m21, transform.m22, transform.m23, transform.m24);
    NSLog(@"[%f] [%f] [%f] [%f]", transform.m31, transform.m32, transform.m33, transform.m34);
    NSLog(@"[%f] [%f] [%f] [%f]", transform.m41, transform.m42, transform.m43, transform.m44);
    NSLog(@"-------------------------------------------------------------------------------");
}

-(void)clickNonCenter:(id)sender{
    _isRotated = _isRotated? NO : YES;
    if(_isRotated){
        CGSize size          = [UIScreen mainScreen].bounds.size;
        if(_nonCenter < 100)
            _nonCenter++;
        else
            _nonCenter = 1;
        
        _nonCenterTransform = CATransform3DIdentity;
        
        CGFloat radians = 2*M_PI/100.0f;
        CGFloat rotValue = _nonCenter*radians;
        
        CGPoint anchorPoint = CGPointMake(_curveCenter.x/size.width, _curveCenter.y/size.height);
//      [self printLayerInfo:_nonCenterView.view.layer];
//        
//      _nonCenterView.view.layer.anchorPoint = anchorPoint;
//        
//        _nonCenterView.view.layer.position = _curveCenter;
        _nonCenterTransform = CATransform3DRotate(_nonCenterTransform, rotValue, 0.0, 0.0, 1.0);
        
//      [self printLayerInfo:_nonCenterView.view.layer];
        [self printCATransform3D:_nonCenterTransform];
//      [_nonCenterView.view.layer setTransform:_nonCenterTransform];
//        
//        [self printLayerInfo:_nonCenterView.view.layer];
    }
}

-(void)startClick1:(id)sender{
    _nonCenter++;
    _transform = CATransform3DIdentity;
    _transform.m34 = -1.0/600.0f;
    CGFloat radians = 1*(2*M_PI/100.0f);
    
    if(_axisX){
        if(_rotX < 100)
            _rotX++;
        else
            _rotX = 1;
        
    }
    CGFloat rotValue = _rotX*radians;
    
    _transform = CATransform3DRotate(_transform, rotValue, 1.0, 0.0, 0.0);
    
    if(_axisY){
        if(_rotY < 100)
            _rotY++;
        else
            _rotY = 1;
        
    }
    rotValue = _rotY*radians;
    _transform = CATransform3DRotate(_transform, rotValue, 0.0, 1.0, 0.0);
    
    if(_axisZ){
        if(_rotZ < 100)
            _rotZ++;
        else
            _rotZ = 1;
        
    }
    rotValue = _rotZ*radians;
    _transform = CATransform3DRotate(_transform, rotValue, 0.0, 0.0, 1.0);
    
    [_myView.view.layer setTransform:_transform];
    
    CGPoint anchorPoint = self.view.layer.anchorPoint;
    CGPoint position = self.view.layer.position;
    NSLog(@"anchor_x=[%f] anchor_y=[%f]  position_x=[%f], position_y=[%f]", anchorPoint.x, anchorPoint.y, position.x, position.y);
    
    NSLog(@"numClick=[%ld]", _numClick);
    NSLog(@"radians =[%f]", radians);
    
    [self printCATransform3D:_transform];
}

-(void)startFinishGameTimer{
    if (_tickFinish!= nil)
        [_tickFinish invalidate];
    _tickFinish = [NSTimer scheduledTimerWithTimeInterval:0.05f
                                                   target:self
                                                 selector:@selector(startClick1:)
                                                 userInfo:nil
                                                  repeats:YES];
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
