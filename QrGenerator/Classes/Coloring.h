//
//  Coloring.h
//  QrGenerator
//
//  Created by Eduardo Rodríguez Higueras on 24.04.20.
//

#import <Foundation/Foundation.h>
#import "Gradient.h"

@interface Coloring : NSObject

- (CIImage *)addColor:(UIColor *)color toImage:(CIImage *)qrImage;
- (CIImage *)addGradient:(Gradient *)gradient toImage:(CIImage *)qrImage;

@end
