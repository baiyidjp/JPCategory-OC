//
//  UIColor+JPCategory.m
//  JPCategoryOCDemo
//
//  Created by SteyDong on 2021/1/14.
//

#import "UIColor+JPCategory.h"

@implementation UIColor (JPCategory)

+ (UIColor *)jp_colorWithHexString:(NSString *)hexString {

    return [self jp_colorWithHexString:hexString alpha:1.0];
}

+ (UIColor *)jp_colorWithHexString:(NSString *)hexString alpha:(CGFloat)alpha {

    NSString *colorString = [[hexString stringByReplacingOccurrencesOfString:@"#" withString:@""] uppercaseString];
    CGFloat red, blue, green;
    switch ([colorString length]) {
        case 3: // #RGB
            red = [self p_ColorComponentFrom:colorString start:0 length:1 Case:1];
            green = [self p_ColorComponentFrom:colorString start:1 length:1 Case:2];
            blue = [self p_ColorComponentFrom:colorString start:2 length:1 Case:3];
            break;
        case 4: // #ARGB
            alpha = [self p_ColorComponentFrom:colorString start:0 length:1 Case:0];
            red = [self p_ColorComponentFrom:colorString start:1 length:1 Case:1];
            green = [self p_ColorComponentFrom:colorString start:2 length:1 Case:2];
            blue = [self p_ColorComponentFrom:colorString start:3 length:1 Case:3];
            break;
        case 6: // #RRGGBB
            red = [self p_ColorComponentFrom:colorString start:0 length:2 Case:1];
            green = [self p_ColorComponentFrom:colorString start:2 length:2 Case:2];
            blue = [self p_ColorComponentFrom:colorString start:4 length:2 Case:3];
            break;
        case 8: // #AARRGGBB
            alpha = [self p_ColorComponentFrom:colorString start:0 length:2 Case:0];
            red = [self p_ColorComponentFrom:colorString start:2 length:2 Case:1];
            green = [self p_ColorComponentFrom:colorString start:4 length:2 Case:2];
            blue = [self p_ColorComponentFrom:colorString start:6 length:2 Case:3];
            break;
        default:
            return nil;
            break;
    }
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+ (CGFloat)p_ColorComponentFrom:(NSString *)string start:(NSUInteger)start length:(NSUInteger)length Case:(int)ARGB {

    NSString *substring = [string substringWithRange:NSMakeRange(start, length)];
    NSString *fullHex = length == 2 ? substring : [NSString stringWithFormat:@"%@%@", substring, substring];
    unsigned hexComponent;
    [[NSScanner scannerWithString:fullHex] scanHexInt:&hexComponent];
    switch (ARGB) {
        case 0://alpha
            return hexComponent / 255.0;
            break;
        case 1://red
            return (hexComponent) / 255.0;
            break;
        case 2://green
            return (hexComponent) / 255.0;
            break;
        case 3://blue
            return (hexComponent) / 255.0;
            break;
        default:
            break;
    }
    return 0;
}

@end
