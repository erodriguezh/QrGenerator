//
//  Qrgenerator.m
//  qr-generator
//
//  Created by Eduardo Rodríguez Higueras on 23.04.20.
//

#import <Foundation/Foundation.h>
#import <CoreImage/CoreImage.h>
#import <QrGenerator.h>
#import <Coloring.h>
#import <Branding.h>

@implementation QrGenerator

- (instancetype)init:(NSString *)customString {
    self = [self initWithString: @""];
    return self;
}

- (instancetype)initWithString:(NSString *)customString {
    self = [super init];
    if (self) {
        _customString = customString;
        _size = CGSizeMake(200.0f, 200.0f);
    }
    return self;
}

- (UIImage *)generate {
    if (!self.customString || self.customString == nil) { return nil; }
    if (self.color == nil && self.gradient == nil) {
        _color = [UIColor colorWithRed:0.00 green:0.00 blue:0.00 alpha:1.00];
    }
    CIImage *qrImage = [self getQrImage];
    
    // Set the image size
    CGRect imageSize = CGRectIntegral(qrImage.extent);
    qrImage = [qrImage imageByApplyingTransform:CGAffineTransformMakeScale(self.size.width/CGRectGetWidth(imageSize), self.size.height/CGRectGetHeight(imageSize))];
    
    if (self.color != nil) {
        qrImage = [[Coloring alloc] addColor:self.color toImage:qrImage];
    } else if(self.gradient != nil) {
        qrImage = [[Coloring alloc] addGradient:self.gradient toImage:qrImage];
    }
    
    if (self.logo != nil) {
        qrImage = [[Branding alloc] addLogo:[[CIImage alloc] initWithImage:self.logo] toImage:qrImage];
    }
    
    return [UIImage imageWithCIImage: qrImage];
}

- (CIImage *)getQrImage {
    CIImage *fallback = nil;
    NSData *data = [self.customString dataUsingEncoding:NSASCIIStringEncoding];
    CIFilter *qrFilter = [CIFilter filterWithName:@"CIQRCodeGenerator"];
    if (qrFilter == nil) { return nil; }
    [qrFilter setDefaults];
    [qrFilter setValue:data forKey:@"inputMessage"];
    
//    Set Qr error correction level
    [qrFilter setValue:[self getCorrectionErrorLevel:self.errorCorrectionLevel] forKey:@"inputCorrectionLevel"];
    
    CGAffineTransform qrTransformation = CGAffineTransformIdentity;
    qrTransformation = CGAffineTransformScale(qrTransformation, 12, 12);
    if (qrFilter.outputImage != nil) {
        return [qrFilter.outputImage imageByApplyingTransform:qrTransformation];
    }
    return fallback;
}

- (NSString*) getCorrectionErrorLevel:(CIQRCodeErrorCorrectionLevel) errorCorrectionLevel {
    NSString *result = nil;

    switch(errorCorrectionLevel) {
        case CIQRCodeErrorCorrectionLevelL:
            result = @"L";
            break;
        case CIQRCodeErrorCorrectionLevelM:
            result = @"M";
            break;
        case CIQRCodeErrorCorrectionLevelQ:
            result = @"Q";
            break;
        case CIQRCodeErrorCorrectionLevelH:
            result = @"H";
            break;
    }

    return result;
}

@end

