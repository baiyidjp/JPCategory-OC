//
//  UIButton+JPImagePosition.m
//  JPButtonCategoryDemo
//
//  Created by SteyDong on 2020/12/18.
//

#import "UIButton+JPImagePosition.h"

@implementation UIButton (JPImagePosition)

- (void)jp_imagePosition {

    [self jp_imagePosition:JPButtonImagePosition_Left margin:8 autoMargin:YES];
}

- (void)jp_imagePosition:(JPButtonImagePosition)position {

    [self jp_imagePosition:position margin:8 autoMargin:YES];
}

- (void)jp_imagePositionWithMargin:(CGFloat)margin {

    [self jp_imagePosition:JPButtonImagePosition_Left margin:margin autoMargin:YES];
}

- (void)jp_imagePositionWithAutoMargin:(BOOL)autoMargin {

    [self jp_imagePosition:JPButtonImagePosition_Left margin:8 autoMargin:autoMargin];
}

- (void)jp_imagePosition:(JPButtonImagePosition)position margin:(CGFloat)margin {

    [self jp_imagePosition:position margin:margin autoMargin:YES];
}

- (void)jp_imagePosition:(JPButtonImagePosition)position autoMargin:(BOOL)autoMargin {

    [self jp_imagePosition:position margin:8 autoMargin:autoMargin];
}

- (void)jp_imagePositionWithMargin:(CGFloat)margin autoMargin:(BOOL)autoMargin {

    [self jp_imagePosition:JPButtonImagePosition_Left margin:margin autoMargin:autoMargin];
}

- (void)jp_imagePosition:(JPButtonImagePosition)position margin:(CGFloat)margin autoMargin:(BOOL)autoMargin {
    
    if (!self.currentImage) {
        NSLog(@"JPImagePosition: 图片不存在");
        return;
    }
    
    if (!self.titleLabel.text) {
        NSLog(@"JPImagePosition: 文本不存在");
        return;;
    }
    
    if (!(self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentLeft || self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentCenter || self.contentHorizontalAlignment == UIControlContentHorizontalAlignmentRight)) {
        NSLog(@"JPImagePosition水平对齐只支持: Left & Center & Right");
        return;
    }
    
    if (!(self.contentVerticalAlignment == UIControlContentVerticalAlignmentTop || self.contentVerticalAlignment == UIControlContentVerticalAlignmentCenter || self.contentVerticalAlignment == UIControlContentVerticalAlignmentBottom)) {
        NSLog(@"JPImagePosition垂直对齐只支持: Top & Center & Bottom");
        return;
    }
    
    
    CGFloat buttonWidth = self.frame.size.width;
    CGFloat buttonHeight = self.frame.size.height;
    
    CGFloat imageContentWidth = self.imageView.intrinsicContentSize.width;
    CGFloat imageContentHeight = self.imageView.intrinsicContentSize.height;
    CGFloat imageFrameWidth = self.imageView.frame.size.width;
    CGFloat imageFrameHeight = self.imageView.frame.size.height;
    
    CGFloat imageWidth = MAX(imageContentWidth, imageFrameWidth);
    CGFloat imageHeight = MAX(imageContentHeight, imageFrameHeight);
    
    CGFloat titleContentWidth = self.titleLabel.intrinsicContentSize.width;
    CGFloat titleContentHeight = self.titleLabel.intrinsicContentSize.height;
    CGFloat titleFrameWidth = self.titleLabel.frame.size.width;
    CGFloat titleFrameHeight = self.titleLabel.frame.size.height;
    
    CGFloat titleWidth = MAX(titleFrameWidth, titleContentWidth);
    CGFloat titleHeight = MAX(titleFrameHeight, titleContentHeight);
    
    UIEdgeInsets imageEdgeInsets = self.imageEdgeInsets;
    UIEdgeInsets titleEdgeInsets = self.titleEdgeInsets;
    
    UIControlContentHorizontalAlignment horizontalAlignment = self.contentHorizontalAlignment;
    UIControlContentVerticalAlignment verticalAlignment = self.contentVerticalAlignment;
    
    // 水平实际的间距
    CGFloat horizontalMargin = margin;
    // 是否需要扩充
    BOOL isWidthNeedExtendEdge = NO;
    BOOL isHeightNeedExtendEdge = NO;
    // 如果加上间距后总宽度大于按钮的宽度,重新给间距赋值
    if (imageWidth + titleWidth + margin > buttonWidth && autoMargin) {
        horizontalMargin = buttonWidth - (imageWidth + titleWidth);
    }
    if (imageWidth + titleWidth > buttonWidth && autoMargin) {
        horizontalMargin = 0;
        isWidthNeedExtendEdge = YES;
    }

    // 垂直实际的间距
    CGFloat verticalMargin = margin;
    // 如果加上间距后总高度大于按钮的高度,重新给间距赋值
    if (imageHeight + titleHeight + margin > buttonHeight && autoMargin) {
        verticalMargin = buttonHeight - (imageHeight + titleHeight);
    }
    // 如果加上间距后总高度大于按钮的高度,重新给间距赋值
    if (imageHeight + titleHeight > buttonHeight && autoMargin) {
        verticalMargin = 0;
        isHeightNeedExtendEdge = YES;
    }
    
    // 水平居中
    if (horizontalAlignment == UIControlContentHorizontalAlignmentCenter) {
        
        // 图片居左
        if (position == JPButtonImagePosition_Left && horizontalMargin >= 0) {
            imageEdgeInsets = UIEdgeInsetsMake(0, -horizontalMargin*0.5, 0, horizontalMargin*0.5);
            titleEdgeInsets = UIEdgeInsetsMake(0, horizontalMargin*0.5, 0, -horizontalMargin*0.5);
            if (isWidthNeedExtendEdge) {
                CGRect frame = self.frame;
                frame.size.width = imageWidth+titleWidth;
                self.frame = frame;
            }
        }
        // 图片居右
        if (position == JPButtonImagePosition_Right && horizontalMargin >= 0) {
            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth+horizontalMargin*0.5, 0, -(titleWidth+horizontalMargin*0.5));
            titleEdgeInsets = UIEdgeInsetsMake(0, -(imageWidth+horizontalMargin*0.5), 0, imageWidth+horizontalMargin*0.5);
            if (isWidthNeedExtendEdge) {
                CGRect frame = self.frame;
                frame.size.width = imageWidth+titleWidth;
                self.frame = frame;
            }
        }
        
        // 垂直居中
        if (verticalAlignment == UIControlContentVerticalAlignmentCenter) {
            
            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                CGFloat verticalCenter = (imageHeight + titleHeight + verticalMargin)*0.5;
                imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, titleWidth*0.5, verticalCenter-imageHeight*0.5, -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(verticalCenter-titleHeight*0.5, -imageWidth*0.5, titleHeight*0.5-verticalCenter, imageWidth*0.5);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(verticalCenter-titleHeight*0.5, -imageWidth, titleHeight*0.5-verticalCenter, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, buttonWidth*0.5-imageWidth*0.5, verticalCenter-imageHeight*0.5, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, titleWidth*0.5-imageWidth*0.5, verticalCenter-imageHeight*0.5, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(imageHeight*0.5-verticalCenter, 0, verticalCenter-imageHeight*0.5, 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight;
                    self.frame = frame;
                }
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                CGFloat verticalCenter = (imageHeight + titleHeight + verticalMargin)*0.5;
                imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, titleWidth*0.5, imageHeight*0.5-verticalCenter, -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(titleHeight*0.5-verticalCenter, -imageWidth*0.5, verticalCenter-titleHeight*0.5, imageWidth*0.5);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(titleHeight*0.5-verticalCenter, -imageWidth, verticalCenter-titleHeight*0.5, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, buttonWidth*0.5-imageWidth*0.5, imageHeight*0.5-verticalCenter, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, titleWidth*0.5-imageWidth*0.5, imageHeight*0.5-verticalCenter, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(verticalCenter-imageHeight*0.5, 0, imageHeight*0.5-verticalCenter, 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight;
                    self.frame = frame;
                }
            }
        }
        
        // 垂直居上
        if (verticalAlignment == UIControlContentVerticalAlignmentTop) {

            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5, 0, -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(imageHeight+verticalMargin, -imageWidth*0.5, -(imageHeight+verticalMargin), imageWidth*0.5);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(imageHeight+verticalMargin, -imageWidth, -(imageHeight+verticalMargin), 0);
                    imageEdgeInsets = UIEdgeInsetsMake(0, buttonWidth*0.5-imageWidth*0.5, 0, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5-imageWidth*0.5, 0, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight;
                    self.frame = frame;
                }
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, titleWidth*0.5, -(titleHeight+verticalMargin), -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth*0.5, 0, imageWidth*0.5);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, buttonWidth*0.5-imageWidth*0.5, -(titleHeight+verticalMargin), -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, titleWidth*0.5-imageWidth*0.5, -(titleHeight+verticalMargin), -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(titleHeight+verticalMargin, 0, -(titleHeight+verticalMargin), 0);
                        }
                    }
                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight;
                    self.frame = frame;
                }
            }
        }
        
        // 垂直居下
        if (verticalAlignment == UIControlContentVerticalAlignmentBottom) {

            // 图片居上
            if (position == JPButtonImagePosition_Top && verticalMargin >= 0) {
                imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), titleWidth*0.5, titleHeight+verticalMargin, -titleWidth*0.5);
                titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth*0.5, 0, imageWidth*0.5);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    titleEdgeInsets = UIEdgeInsetsMake(0, -imageWidth, 0, 0);
                    imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), buttonWidth*0.5-imageWidth*0.5, titleHeight+verticalMargin, -(buttonWidth*0.5-imageWidth*0.5));
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), titleWidth*0.5-imageWidth*0.5, titleHeight+verticalMargin, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(-(titleHeight+verticalMargin), 0, titleHeight+verticalMargin, 0);
                        }
                    }

                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight;
                    self.frame = frame;
                }
            }
            
            // 图片居下
            if (position == JPButtonImagePosition_Bottom && verticalMargin >= 0) {
                titleEdgeInsets = UIEdgeInsetsMake(-(imageHeight+verticalMargin), -imageWidth*0.5, imageHeight+verticalMargin, imageWidth*0.5);
                imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5, 0, -titleWidth*0.5);
                if (isWidthNeedExtendEdge) {
                    CGFloat maxWidth = MAX(imageWidth, titleWidth);
                    CGRect frame = self.frame;
                    frame.size.width = MAX(buttonWidth, maxWidth);
                    self.frame = frame;
                    imageEdgeInsets = UIEdgeInsetsMake(0, buttonWidth*0.5-imageWidth*0.5, 0, -(buttonWidth*0.5-imageWidth*0.5));
                    titleEdgeInsets = UIEdgeInsetsMake(-(imageHeight+verticalMargin), -imageWidth, imageHeight+verticalMargin, 0);
                    if (buttonWidth <= maxWidth) {
                        if (titleWidth >= imageWidth) {
                            imageEdgeInsets = UIEdgeInsetsMake(0, titleWidth*0.5-imageWidth*0.5, 0, -(titleWidth*0.5-imageWidth*0.5));
                        } else {
                            imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
                        }
                    }

                }
                if (isHeightNeedExtendEdge) {
                    CGRect frame = self.frame;
                    frame.size.height = imageHeight+titleHeight;
                    self.frame = frame;
                }

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
