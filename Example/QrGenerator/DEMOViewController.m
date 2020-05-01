//
//  DEMOViewController.m
//  QrGenerator
//
//  Created by erodriguezh on 04/28/2020.
//  Copyright (c) 2020 erodriguezh. All rights reserved.
//

#import "DEMOViewController.h"
#import "../../QrGenerator/Classes/QrGenerator.h"
#import "../../QrGenerator/Classes/Gradient.h"

@interface DEMOViewController ()

@end

@implementation DEMOViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
// Base Qr
    QrGenerator *baseQr = [[QrGenerator alloc] initWithString:@"base-qr"];
    UIImage *baseQrCode = [baseQr generate];
    [_baseQrImg setImage:baseQrCode];
    _baseQrImg.frame = CGRectMake(_baseQrImg.frame.origin.x, _baseQrImg.frame.origin.y, baseQrCode.size.width, baseQrCode.size.height);

// Color Qr
    QrGenerator *colorQr = [[QrGenerator alloc] initWithString:@"color-qr"];
    colorQr.color = [UIColor colorWithRed:0.80 green:0.20 blue:0.60 alpha:1.00];
    UIImage *colorQrCode = [colorQr generate];
    [_colorQrImg setImage:colorQrCode];
    _colorQrImg.frame = CGRectMake(_colorQrImg.frame.origin.x, _colorQrImg.frame.origin.y, colorQrCode.size.width, colorQrCode.size.height);
  
// Gradient Qr
    QrGenerator *gradientQr = [[QrGenerator alloc] initWithString:@"gradient-qr"];
    Gradient *gradient = [Gradient gradientWithColor0:[UIColor colorWithRed:0.60 green:0.80 blue:0.80 alpha:1.00] andColor1:[UIColor colorWithRed:0.80 green:0.20 blue:0.60 alpha:1.00]];
    gradientQr.gradient = gradient;
    UIImage *gradientQrCode = [gradientQr generate];
    [_gradientQrImg setImage:gradientQrCode];
    _gradientQrImg.frame = CGRectMake(_gradientQrImg.frame.origin.x, _gradientQrImg.frame.origin.y, gradientQrCode.size.width, gradientQrCode.size.height);
  
// Color + logo Qr
    QrGenerator *colorLogoQr = [[QrGenerator alloc] initWithString:@"color-logo-qr"];
    UIImage *logo = [UIImage imageNamed: @"wrench.png"];
    colorLogoQr.color = [UIColor colorWithRed:0.60 green:0.80 blue:0.80 alpha:1.00];
    colorLogoQr.logo = logo;
    colorLogoQr.errorCorrectionLevel = CIQRCodeErrorCorrectionLevelH; // Very important if adding a big logo
    colorLogoQr.size = CGSizeMake(300.0f, 300.0f);
    UIImage *colorLogoQrCode = [colorLogoQr generate];
    [_colorLogoQrImg setImage:colorLogoQrCode];
    _colorLogoQrImg.frame = CGRectMake(_colorLogoQrImg.frame.origin.x, _colorLogoQrImg.frame.origin.y, colorLogoQrCode.size.width, colorLogoQrCode.size.height);
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
