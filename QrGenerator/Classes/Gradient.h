//
//  Gradient.h
//  QrGenerator
//
//  Created by Eduardo Rodríguez Higueras on 26.04.20.
//

@interface Gradient : NSObject

@property (strong, nonatomic) UIColor *color0;
@property (strong, nonatomic) UIColor *color1;

- (id) initWithColor0:(UIColor *)color0 andColor1:(UIColor *)color1;

+ (instancetype) gradientWithColor0: (UIColor *)color0 andColor1:(UIColor *)color1;

@end
