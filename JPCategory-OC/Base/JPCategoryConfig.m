//
//  JPCategoryConfig.m
//  JPCategoryOCDemo
//
//  Created by baiyidjp on 2021/1/20.
//

#import "JPCategoryConfig.h"

@implementation JPCategoryConfig

+ (void)jp_removeNavigationBarCategory {

    [[NSUserDefaults standardUserDefaults] removeObjectForKey:JPCategory_UINavigationBar_Config];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:JPCategory_UINavigationBar_ScreenWidth];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:JPCategory_UINavigationBar_Margin];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:JPCategory_UINavigationBar_BigMargin];
}

+ (void)jp_configNavigationBarCategory {

    [self jp_configNavigationBarCategoryWithMargin:16 bigMargin:20];
}

+ (void)jp_configNavigationBarCategoryWithMargin:(CGFloat)margin {

    [self jp_configNavigationBarCategoryWithDefaultScreenWidth:375.0 margin:margin bigMargin:margin];
}

+ (void)jp_configNavigationBarCategoryWithMargin:(CGFloat)margin bigMargin:(CGFloat)bigMargin {

    [self jp_configNavigationBarCategoryWithDefaultScreenWidth:375.0 margin:margin bigMargin:bigMargin];
}

+ (void)jp_configNavigationBarCategoryWithDefaultScreenWidth:(CGFloat)screenWidth margin:(CGFloat)margin bigMargin:(CGFloat)bigMargin {
    
    [[NSUserDefaults standardUserDefaults] setBool:YES forKey:JPCategory_UINavigationBar_Config];
    [[NSUserDefaults standardUserDefaults] setFloat:(float) screenWidth forKey:JPCategory_UINavigationBar_ScreenWidth];
    [[NSUserDefaults standardUserDefaults] setFloat:(float) margin forKey:JPCategory_UINavigationBar_Margin];
    [[NSUserDefaults standardUserDefaults] setFloat:(float) bigMargin forKey:JPCategory_UINavigationBar_BigMargin];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)jp_removeCustomFontName {

    [[NSUserDefaults standardUserDefaults] removeObjectForKey:JPCategory_UILabel_FontName_Regular];
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:JPCategory_UILabel_FontName_Bold];
}

+ (void)jp_configCustomFontNameWithRegular:(NSString *)regularName bold:(NSString *)boldName {

    [[NSUserDefaults standardUserDefaults] setObject:regularName forKey:JPCategory_UILabel_FontName_Regular];
    [[NSUserDefaults standardUserDefaults] setObject:boldName forKey:JPCategory_UILabel_FontName_Bold];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)jp_configNavigationBarCategoryAndCustomFontNameWithRegular:(NSString *)regularName bold:(NSString *)boldName {

    [JPCategoryConfig jp_configNavigationBarCategory];
    [JPCategoryConfig jp_configCustomFontNameWithRegular:regularName bold:boldName];
}

@end
