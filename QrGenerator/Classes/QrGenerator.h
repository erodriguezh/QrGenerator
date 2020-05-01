//
//  QrGenerator.h
//  QrGenerator
//
//  Created by Eduardo Rodríguez Higueras on 23.04.20.
//

#import "Gradient.h"

@interface QrGenerator : NSObject

@property (strong, nonatomic, readonly) NSString *customString;
@property (strong, nonatomic) UIColor *color; // Defaults to black
@property (assign, nonatomic) CGSize size;
@property (assign, nonatomic) UIImage *logo;
@property (assign, nonatomic) Gradient *gradient;
@property (assign, nonatomic) CIQRCodeErrorCorrectionLevel errorCorrectionLevel;

- (instancetype)initWithString:(NSString *)customString;
- (UIImage *)generate;

@end
