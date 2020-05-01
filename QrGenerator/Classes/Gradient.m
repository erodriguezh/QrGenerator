//
//  Gradient.m
//  QrGenerator
//
//  Created by Eduardo Rodríguez Higueras on 26.04.20.
//

#import <Foundation/Foundation.h>
#import "Gradient.h"

@implementation Gradient

- (id) initWithColor0:(UIColor *)color0 andColor1:(UIColor *)color1 {
    self = [super init];
    if (self) {
        _color0 = color0;
        _color1 = color1;
    }
    return self;
}

+ (instancetype) gradientWithColor0:(UIColor *)color0 andColor1:(UIColor *)color1 {
    Gradient *gradient = [[Gradient alloc] initWithColor0:color0 andColor1:color1];
    return gradient;
}

@end
