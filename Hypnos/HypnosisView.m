//
//  HypnosisView.m
//  Hypnos
//
//  Created by Zaur Giyasov on 18/04/2018.
//  Copyright © 2018 Zaur Giyasov. All rights reserved.
//

#import "HypnosisView.h"

@implementation HypnosisView


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
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
    [[UIColor lightGrayColor] setStroke];
    
    // draw line with path
    [path stroke];
    
    
}

-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        // all override
        self.backgroundColor = [UIColor clearColor];
    }
    
    return self;
}




@end
