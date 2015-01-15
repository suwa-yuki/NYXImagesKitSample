//
//  ImageViewController.m
//  NYXImagesKitSample
//
//  Created by suwa.yuki on 2015/01/15.
//  Copyright (c) 2015年 classmethod, Inc. All rights reserved.
//

#import "ImageViewController.h"
#import <NYXImagesKit/NYXImagesKit.h>

@interface ImageViewController ()

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation ImageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title = self.editName;
    if (self.editType == ImageViewEditTypeResizing) {
        self.imageView.contentMode = UIViewContentModeCenter;
    }
    self.imageView.image = [self editedImage:self.editType];
}

- (UIImage*)editedImage:(ImageViewEditType)type
{
    UIImage *image = [UIImage imageNamed:@"sample.png"];
    switch (type) {
        case ImageViewEditTypeBrighten:
            // 明度調整
            // -255 ~ 255
            return [image brightenWithValue:0.5 * 255];
        case ImageViewEditTypeContrastAdjustment:
            // コントラスト調整
            // -255 ~ 255
            return [image contrastAdjustmentWithValue:0.5 * 255];
        case ImageViewEditTypeEdgeDetection:
            // エッジ抽出
            return [image edgeDetectionWithBias:5];
        case ImageViewEditTypeEmboss:
            // エンボス
            return [image embossWithBias:5];
        case ImageViewEditTypeGammaCorrection:
            // ガンマ
            // 0.01 ~ 8
            return [image gammaCorrectionWithValue:8];
        case ImageViewEditTypeGrayscale:
            // グレースケール
            return [image grayscale];
        case ImageViewEditTypeInvert:
            // 色相反転
            return [image invert];
        case ImageViewEditTypeOpacity:
            // 透明度
            // 0.0 ~ 1.0
            return [image opacity:0.5f];
        case ImageViewEditTypeSepia:
            // セピア
            return [image sepia];
        case ImageViewEditTypeSharpen:
            // シャープ
            return [image sharpenWithBias:5];
        case ImageViewEditTypeUnsharpen:
            // アンシャープ
            return [image unsharpenWithBias:5];
        case ImageViewEditTypeBlurring:
            // ブラー
            return [image gaussianBlurWithBias:5];
        case ImageViewEditTypeMasking:
            // マスク
            return [image maskWithImage:[UIImage imageNamed:@"mask.png"]];
        case ImageViewEditTypeResizing:
            // リサイズ
            return [image scaleToFitSize:CGSizeMake(120, 80)];
        case ImageViewEditTypeRotating:
            // 回転
            return [image rotateInDegrees:180];
        case ImageViewEditTypeReflection:
            // 反転
            return [image reflectedImageWithHeight:image.size.height fromAlpha:0.0f toAlpha:0.5f];
        case ImageViewEditTypeEnhancing:
            // 自動補正 & 赤目軽減
            return [[image autoEnhance] redEyeCorrection];
    }
    return image;
}

@end
