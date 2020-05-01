//
//  Coloring.m
//  QrGenerator
//
//  Created by Eduardo Rodríguez Higueras on 24.04.20.
//

#import <Foundation/Foundation.h>
#import <CoreImage/CoreImage.h>
#import "Coloring.h"
#import "Gradient.h"

@implementation Coloring

- (CIImage *)transparent:(CIImage *)qrImage {
    CIImage *inverted = [self inverted:qrImage];
    if (inverted == nil) { return nil; }
    return [self blackTransparent:inverted];
}

- (CIImage *)inverted:(CIImage *)qrImage {
    CIFilter *invertedColorFilter = [CIFilter filterWithName:@"CIColorInvert"];
    if (invertedColorFilter == nil) { return nil; }
    [invertedColorFilter setDefaults];
    [invertedColorFilter setValue:qrImage forKey:@"inputImage"];
    return invertedColorFilter.outputImage;
}

- (CIImage *)blackTransparent:(CIImage *)image {
    CIFilter *blackTransparentFilter = [CIFilter filterWithName:@"CIMaskToAlpha"];
    if (blackTransparentFilter == nil) { return nil; }
    [blackTransparentFilter setDefaults];
    [blackTransparentFilter setValue:image forKey:@"inputImage"];
    return blackTransparentFilter.outputImage;
}

// Add a color to a base image.
- (CIImage *)addColor:(UIColor *)color toImage:(CIImage *)qrImage {
    id transparentQRImage = [self transparent:qrImage];
    CIFilter *colorFilter = [CIFilter filterWithName:@"CIConstantColorGenerator"];
    if (colorFilter == nil) { return nil; }
    
    CIColor *ciColor = [[CIColor alloc] initWithColor:color];
    [colorFilter setValue:ciColor forKey: kCIInputColorKey];
    id colorImage = colorFilter.outputImage;
    
    CIImage *colorComposition = [self createCompositionWithImage:colorImage andBackgroundImage:transparentQRImage];
    
    if (colorComposition != nil) {
        return colorComposition;
    }
    
    return qrImage;
}

// Add a linear gradient with 2 colors and a base image.
- (CIImage *)addGradient:(Gradient *)gradient toImage:(CIImage *)qrImage {
    id transparentQRImage = [self transparent:qrImage];
    CIFilter *gradientFilter = [CIFilter filterWithName:@"CILinearGradient"];
    if (gradientFilter == nil) { return nil; }
    
    CIColor *ciGradientColor0 = [[CIColor alloc] initWithColor:gradient.color0];
    CIColor *ciGradientColor1 = [[CIColor alloc] initWithColor:gradient.color1];
    [gradientFilter setValuesForKeysWithDictionary:@{
        @"inputPoint0": [CIVector vectorWithX:qrImage.extent.size.width Y:qrImage.extent.size.height],
        @"inputPoint1": [CIVector vectorWithX:qrImage.extent.size.width Y:0.0],
        @"inputColor0": ciGradientColor0,
        @"inputColor1": ciGradientColor1,
    }];
    id gradientImage = gradientFilter.outputImage;
    
    CIImage *gradientComposition = [self createCompositionWithImage:gradientImage andBackgroundImage:transparentQRImage];
    
    if (gradientComposition != nil) {
        return gradientComposition;
    }
    
    return qrImage;
}


// Create compositions with a front and back image.
- (CIImage *)createCompositionWithImage:(CIImage *)image andBackgroundImage:(CIImage *)backgroundImage {
    CIImage *fallback = nil;
    CIFilter *filter = [CIFilter filterWithName:@"CIMultiplyCompositing"];
    [filter setValuesForKeysWithDictionary:@{
        @"inputImage": image,
        @"inputBackgroundImage": backgroundImage,
    }];
    
    if (filter.outputImage != nil) {
        return filter.outputImage;
    }
    
    return fallback;
}

@end
