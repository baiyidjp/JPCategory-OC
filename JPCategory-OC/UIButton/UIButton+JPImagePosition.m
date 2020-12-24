//
//  UIButton+JPImagePosition.m
//  JPButtonCategoryDemo
//
//  Created by SteyDong on 2020/12/18.
//

#import "UIButton+JPImagePosition.h"

@implementation UIButton (JPImagePosition)

- (void)setImagePosition {
    
    [self setImagePosition:JPButtonImagePosition_Left margin:8];
}

- (void)setImagePositionAutoMargin:(BOOL)autoMargin {
    
    [self setImagePosition:JPButtonImagePosition_Left margin:8 autoMargin:autoMargin];
}

- (void)setImagePosition:(JPButtonImagePosition)position margin:(CGFloat)margin {
    
    [self setImagePosition:position margin:margin autoMargin:YES];
}

- (void)setImagePosition:(JPButtonImagePosition)position margin:(CGFloat)margin autoMargin:(BOOL)autoMargin {
    
    if (!self.currentImage) {
        NSLog(@"图片不存在");
        return;
    }
    
    if (!self.titleLabel.text) {
        NSLog(@"文本不存在");
        return;;
    }
    
    if (!(self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft || self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentCenter || self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight)) {
        NSLog(@"水平对齐只支持: Left & Center & Right");
        return;
    }
    
    if (!(self.contentVerticalAlignment == UIControlContentVerticalAlignmentTop || self.contentVerticalAlignment == UIControlContentVerticalAlignmentCenter || self.contentVerticalAlignment == UIControlContentVerticalAlignmentBottom)) {
        NSLog(@"垂直对齐只支持: Top & Center & Bottom");
        return;
    }
    
    
    CGFloat buttonWidth = self.frame.size.width;
    CGFloat buttonHeight = self.frame.size.height;
    
    CGFloat imageWidth = self.imageView.frame.size.width;
    CGFloat imageHeight = self.imageView.frame.size.height;
    
    CGFloat titleWidth = self.titleLabel.intrinsicContentSize.width;
    CGFloat titleHeight = self.titleLabel.intrinsicContentSize.height;
    
    UIEdgeInsets imageEdgeInsets = self.imageEdgeInsets;
    UIEdgeInsets titleEdgeInsets = self.titleEdgeInsets;
    
    UIControlContentHorizontalAlignment horizontalAlignment = self.contentHorizontalAlignment;
    UIControlContentVerticalAlignment verticalAlignment = self.contentVerticalAlignment;
    
    // 水平实际的间距
    CGFloat horizontalMargin = margin;
    // 如果加上间距后总宽度大于按钮的宽度,重新给间距赋值
    if (imageWidth + titleWidth + margin > buttonWidth && autoMargin) {
        horizontalMargin = buttonWidth - (imageWidth + titleWidth);
    }
    
    // 垂直实际的间距
    CGFloat verticalMargin = margin;
    // 如果加上间距后总高度大于按钮的高度,重新给间距赋值
    if (imageHeight + titleHeight + margin > buttonHeight && autoMargin) {
        verticalMargin = buttonHeight - (imageHeight + titleHeight);
    }
    
    // 水平居中
    if (horizontalAlignment == UIControlContentHorizontalAlignmentCenter) {
        
        // 图片居左
        if (position == JPButtonImagePosition_Left && horizontalMargin >= 0) {
            imageEdgeInsets = UIEdgeInsetsMake(0, -horizontalMargin*0.5, 0, horizontalMargin*0.5);
            titleEdgeInsets = UIEdgeInsetsMake(0, horizontalMargin*0.5, 0, -horizontalMargin*0.5);
        }
        // 图片居右
        if (position == JPButtonImagePosition_Right && horizontalMargin >= 0) {
            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth+horizontalMargin*0.5, 0, -(titleWidth+horizontalMargin*0.5));
            titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth+horizontalMargin*0.5), 0, imageWidth+horizontalMargin*0.5);
        }
        
        // 垂直居中
        if (verticalAlignment == UIControlContentVerticalAlignmentCenter) {
            
            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                CGFloat verticalCenter = (imageHeight + titleHeight + verticalMargin)*0.5;
                imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, titleWidth*0.5, verticalCenter-imageHeight*0.5, -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(verticalCenter-titleHeight*0.5, -imageWidth*0.5, titleHeight*0.5-verticalCenter, imageWidth*0.5);
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                CGFloat verticalCenter = (imageHeight + titleHeight + verticalMargin)*0.5;
                imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, titleWidth*0.5, imageHeight*0.5-verticalCenter, -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(titleHeight*0.5-verticalCenter, -imageWidth*0.5, verticalCenter-titleHeight*0.5, imageWidth*0.5);
            }
        }
        
        // 垂直居上
        if (verticalAlignment == UIControlContentVerticalAlignmentTop) {

            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5, 0, -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(imageHeight+verticalMargin, -imageWidth*0.5, -(imageHeight+verticalMargin), imageWidth*0.5);
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, titleWidth*0.5, -(titleHeight+verticalMargin), -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth*0.5, 0, imageWidth*0.5);
            }
        }
        
        // 垂直居下
        if (verticalAlignment == UIControlContentVerticalAlignmentBottom) {

            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), titleWidth*0.5, titleHeight+verticalMargin, -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth*0.5, 0, imageWidth*0.5);
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5, 0, -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(-(imageHeight+verticalMargin), -imageWidth*0.5, imageHeight+verticalMargin, imageWidth*0.5);
            }
        }
    }
    
    // 水平居左
    if (horizontalAlignment == UIControlContentHorizontalAlignmentLeft) {
        // 图片居左
        if (position == JPButtonImagePosition_Left && horizontalMargin >= 0) {
            titleEdgeInsets = UIEdgeInsetsMake(0, horizontalMargin, 0, -horizontalMargin);
        }
        // 图片居右
        if (position == JPButtonImagePosition_Right && horizontalMargin >= 0) {
            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth+horizontalMargin, 0, -(titleWidth+horizontalMargin));
            titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);
        }
        
        if (verticalAlignment == UIControlContentVerticalAlignmentCenter) {
            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                CGFloat verticalCenter = (imageHeight + titleHeight + verticalMargin)*0.5;
                imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, titleWidth*0.5-imageWidth*0.5, verticalCenter-imageHeight*0.5, -(titleWidth*0.5-imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(verticalCenter-titleHeight*0.5, -imageWidth, titleHeight*0.5-verticalCenter, imageWidth);
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                CGFloat verticalCenter = (imageHeight + titleHeight + verticalMargin)*0.5;
                imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, titleWidth*0.5-imageWidth*0.5, imageHeight*0.5-verticalCenter, -(titleWidth*0.5-imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(titleHeight*0.5-verticalCenter, -imageWidth, verticalCenter-titleHeight*0.5, imageWidth);
            }
        }
        
        if (verticalAlignment == UIControlContentVerticalAlignmentTop) {
            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5-imageWidth*0.5, 0, -(titleWidth*0.5-imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(imageHeight+verticalMargin, -imageWidth, -(imageHeight+verticalMargin), imageWidth);
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, titleWidth*0.5-imageWidth*0.5, -(titleHeight+verticalMargin), -(titleWidth*0.5-imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);
            }
        }
        
        if (verticalAlignment == UIControlContentVerticalAlignmentBottom) {
            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), titleWidth*0.5-imageWidth*0.5, titleHeight+verticalMargin, -(titleWidth*0.5-imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, imageWidth);
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5-imageWidth*0.5, 0, -(titleWidth*0.5-imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(-(imageHeight+verticalMargin), -imageWidth, imageHeight+verticalMargin, imageWidth);
            }
        }
    }
    
    // 水平居右
    if (horizontalAlignment == UIControlContentHorizontalAlignmentRight) {
        // 图片居左
        if (position == JPButtonImagePosition_Left && horizontalMargin >= 0) {
            imageEdgeInsets = UIEdgeInsetsMake(0, -horizontalMargin, 0, horizontalMargin);
        }
        // 图片居右
        if (position == JPButtonImagePosition_Right && horizontalMargin >= 0) {
            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth, 0, -titleWidth);
            titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth+horizontalMargin), 0, imageWidth+horizontalMargin);
        }
        
        if (verticalAlignment == UIControlContentVerticalAlignmentCenter) {
            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                CGFloat verticalCenter = (imageHeight + titleHeight + verticalMargin)*0.5;
                imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, titleWidth*0.5+imageWidth*0.5, verticalCenter-imageHeight*0.5, -(titleWidth*0.5+imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(verticalCenter-titleHeight*0.5, 0, titleHeight*0.5-verticalCenter, 0);
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                CGFloat verticalCenter = (imageHeight + titleHeight + verticalMargin)*0.5;
                imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, titleWidth*0.5+imageWidth*0.5, imageHeight*0.5-verticalCenter, -(titleWidth*0.5+imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(titleHeight*0.5-verticalCenter, 0, verticalCenter-titleHeight*0.5, 0);
            }
        }
        
        if (verticalAlignment == UIControlContentVerticalAlignmentTop) {
            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5+imageWidth*0.5, 0, -(titleWidth*0.5+imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(imageHeight+verticalMargin, 0, -(imageHeight+verticalMargin), 0);
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, titleWidth*0.5+imageWidth*0.5, -(titleHeight+verticalMargin), -(titleWidth*0.5+imageWidth*0.5));
            }
        }
        
        if (verticalAlignment == UIControlContentVerticalAlignmentBottom) {
            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), titleWidth*0.5, titleHeight+verticalMargin, -titleWidth*0.5);
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5+imageWidth*0.5, 0, -(titleWidth*0.5+imageWidth*0.5));
                titleEdgeInsets = UIEdgeInsetsMake(-(imageHeight+verticalMargin), 0, imageHeight+verticalMargin, 0);
            }
        }

    }
    
    self.imageEdgeInsets = imageEdgeInsets;
    self.titleEdgeInsets = titleEdgeInsets;
}


@end
