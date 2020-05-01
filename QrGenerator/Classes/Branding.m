//
//  Branding.m
//  QrGenerator
//
//  Created by Eduardo Rodríguez Higueras on 24.04.20.
//

#import "Branding.h"

@implementation Branding

- (CIImage *)addLogo:(CIImage *)logo toImage:(CIImage *)qrImage {
    CIFilter *compositingFilter = [CIFilter filterWithName:@"CISourceOverCompositing"];
    if (compositingFilter == nil) { return nil; }
    
// To find the center of the Qr image, convert it to a rectangle and then get the X and Y mid coordinates
    CGRect imageRect = CGRectIntegral(qrImage.extent);
    CGFloat tx = CGRectGetMidX(imageRect) - (logo.extent.size.width / 2);
    CGFloat ty = CGRectGetMidY(imageRect) - (logo.extent.size.height / 2);
    
    CGAffineTransform centerTransformation = CGAffineTransformIdentity;
    centerTransformation = CGAffineTransformMakeTranslation(tx, ty);
    [compositingFilter setValue:[logo imageByApplyingTransform:centerTransformation] forKey:@"inputImage"];
    [compositingFilter setValue:qrImage forKey:@"inputBackgroundImage"];
    
    if (compositingFilter.outputImage != nil) {
        return compositingFilter.outputImage;
    }
    
    return qrImage;
}

@end
