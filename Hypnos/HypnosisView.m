//
//  HypnosisView.m
//  Hypnos
//
//  Created by Zaur Giyasov on 18/04/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "HypnosisView.h"

@interface HypnosisView ()

@property (strong, nonatomic) UIColor *circleColor;


@end

@implementation HypnosisView


- (void)drawRect:(CGRect)rect {
    // Drawing code
    CGRect bounds = self.bounds;
    
    // Figure out the center of the bounds rectangle
    CGPoint center = CGPointMake((bounds.origin.x + bounds.size.width / 2), (bounds.origin.y + bounds.size.height / 2));
    
    
    // Radius for figure
    /* // Drawing concentric circles
    CGFloat radius = (MIN(bounds.size.width, bounds.size.height) / 2.0);
     */
    // The largest
    CGFloat maxRadius = hypot(bounds.size.width, bounds.size.height) / 2.0;
    
    
    // UIBezier - rect
    UIBezierPath *path = [[UIBezierPath alloc]init];
    
    /* // Drawing concentric circles
    // Add an arc
    // from 0 to 2*Pi
    [path addArcWithCenter:center radius:radius startAngle:0.0 endAngle:M_PI * 2.0 clockwise:YES];
     */
    for (CGFloat currentRadius = maxRadius; currentRadius > 0; currentRadius -= 20) {
        [path moveToPoint:CGPointMake(center.x + currentRadius, center.y)];
        [path addArcWithCenter:center
                        radius:currentRadius
                    startAngle:0.0
                      endAngle:M_PI * 2.0
                     clockwise:YES];
    }
    
    path.lineWidth = 10;
    
    // [[UIColor lightGrayColor] setStroke];
    [self.circleColor setStroke];
    
    // draw line with path
    [path stroke];
    
    //////////////////////////////////////
    // Bronze Challenge: Draw an Image
    /*
    
    UIImage *logoImage = [UIImage imageNamed:@"logo.png"];
    // Image bounds - is 1/4 origin bounds
    CGRect logoImageRect;
    logoImageRect.origin.x = bounds.origin.x + bounds.size.width / 4;
    logoImageRect.origin.y = bounds.origin.y + bounds.size.height / 4;
    
    // Image size = 1/2 origin bounds
    logoImageRect.size.width = bounds.size.width / 2;
    logoImageRect.size.height = bounds.size.height / 2;
    
    [logoImage drawInRect:logoImageRect];
     */
    //////////////////////////////////////
    
    //////////////////////////////////////
    // Gold Challenge: Shadows and Gradients
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // all override
        self.backgroundColor = [UIColor clearColor];
        self.circleColor = [UIColor lightGrayColor];
    }
    
    return self;
}

// When a finger touches the screen
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
//    NSLog(@"touched");
    
    // Get 3 random numders for RGB color
    CGFloat red = (arc4random() % 100) / 100.0;
    CGFloat green = (arc4random() % 100) / 100.0;
    CGFloat blue = (arc4random() % 100) / 100.0;
    
    UIColor *randColor = [UIColor colorWithRed:red green:green blue:blue alpha:1.0];
    
    self.circleColor = randColor;
}

- (void)setCircleColor:(UIColor *)circleColor {
    _circleColor = circleColor;
    [self setNeedsDisplay];
}


@end
