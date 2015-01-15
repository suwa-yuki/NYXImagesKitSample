//
//  ImageViewController.h
//  NYXImagesKitSample
//
//  Created by suwa.yuki on 2015/01/15.
//  Copyright (c) 2015年 classmethod, Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    ImageViewEditTypeBrighten,
    ImageViewEditTypeContrastAdjustment,
    ImageViewEditTypeEdgeDetection,
    ImageViewEditTypeEmboss,
    ImageViewEditTypeGammaCorrection,
    ImageViewEditTypeGrayscale,
    ImageViewEditTypeInvert,
    ImageViewEditTypeOpacity,
    ImageViewEditTypeSepia,
    ImageViewEditTypeSharpen,
    ImageViewEditTypeUnsharpen,
    ImageViewEditTypeBlurring,
    ImageViewEditTypeMasking,
    ImageViewEditTypeResizing,
    ImageViewEditTypeRotating,
    ImageViewEditTypeReflection,
    ImageViewEditTypeEnhancing
} ImageViewEditType;

@interface ImageViewController : UIViewController

@property (strong, nonatomic) NSString *editName;
@property (assign, nonatomic) ImageViewEditType editType;

@end
