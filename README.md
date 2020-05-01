# QrGenerator

[![Version](https://img.shields.io/cocoapods/v/QrGenerator.svg?style=flat)](https://cocoapods.org/pods/QrGenerator)
[![License](https://img.shields.io/cocoapods/l/QrGenerator.svg?style=flat)](https://cocoapods.org/pods/QrGenerator)
[![Platform](https://img.shields.io/cocoapods/p/QrGenerator.svg?style=flat)](https://cocoapods.org/pods/QrGenerator)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

```objc
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
    UIImage *logo = [UIImage imageNamed: @"Lite-Icon-icon.png"];
    colorLogoQr.color = [UIColor colorWithRed:0.60 green:0.80 blue:0.80 alpha:1.00];
    colorLogoQr.logo = logo;
    colorLogoQr.errorCorrectionLevel = CIQRCodeErrorCorrectionLevelH; // Very important if adding a big logo
    colorLogoQr.size = CGSizeMake(300.0f, 300.0f);
    UIImage *colorLogoQrCode = [colorLogoQr generate];
    [_colorLogoQrImg setImage:colorLogoQrCode];
    _colorLogoQrImg.frame = CGRectMake(_colorLogoQrImg.frame.origin.x, _colorLogoQrImg.frame.origin.y, colorLogoQrCode.size.width, colorLogoQrCode.size.height);
```

## API
    
| Property | Default | Type | Description |
| --- | --- | --- | --- |
| customString | - | NSString | Value to generate Qr code |
| color | black | UIColor | The Qr's color |
| size | 200x200 | CGSize | The image's width and height |
| logo | - | UIImage | A logo to be set in the center of the Qr |
| gradient | - | Gradient | Color the Qr using a linear gradient |
| errorCorrectionLevel | CIQRCodeErrorCorrectionLevelL | CIQRCodeErrorCorrectionLevel | Qr image error correction |

## Installation

QrGenerator is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'QrGenerator'
```

## Author

erodriguezh

## License

QrGenerator is available under the MIT license. See the LICENSE file for more info.
