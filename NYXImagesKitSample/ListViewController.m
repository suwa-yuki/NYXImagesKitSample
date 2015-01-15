//
//  ViewController.m
//  NYXImagesKitSample
//
//  Created by suwa.yuki on 2015/01/15.
//  Copyright (c) 2015年 classmethod, Inc. All rights reserved.
//

#import "ListViewController.h"
#import "ImageViewController.h"

@interface ListViewController ()

@property (strong, nonatomic) NSArray *items;

@end

@implementation ListViewController

#pragma mark - UIViewController methods

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = @[
                   @{@"name":@"Brighten"          , @"type":@(ImageViewEditTypeBrighten)},
                   @{@"name":@"ContrastAdjustment", @"type":@(ImageViewEditTypeContrastAdjustment)},
                   @{@"name":@"EdgeDetection"     , @"type":@(ImageViewEditTypeEdgeDetection)},
                   @{@"name":@"Emboss"            , @"type":@(ImageViewEditTypeEmboss)},
                   @{@"name":@"GammaCorrection"   , @"type":@(ImageViewEditTypeGammaCorrection)},
                   @{@"name":@"Grayscale"         , @"type":@(ImageViewEditTypeGrayscale)},
                   @{@"name":@"Invert"            , @"type":@(ImageViewEditTypeInvert)},
                   @{@"name":@"Opacity"           , @"type":@(ImageViewEditTypeOpacity)},
                   @{@"name":@"Sepia"             , @"type":@(ImageViewEditTypeSepia)},
                   @{@"name":@"Sharpen"           , @"type":@(ImageViewEditTypeSharpen)},
                   @{@"name":@"Unsharpen"         , @"type":@(ImageViewEditTypeUnsharpen)},
                   @{@"name":@"Blurring"          , @"type":@(ImageViewEditTypeBlurring)},
                   @{@"name":@"Masking"           , @"type":@(ImageViewEditTypeMasking)},
                   @{@"name":@"Resizing"          , @"type":@(ImageViewEditTypeResizing)},
                   @{@"name":@"Rotating"          , @"type":@(ImageViewEditTypeRotating)},
                   @{@"name":@"Reflection"        , @"type":@(ImageViewEditTypeReflection)},
                   @{@"name":@"Enhancing"         , @"type":@(ImageViewEditTypeEnhancing)},
                   ];
    [self.tableView reloadData];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"Image"]) {
        NSDictionary *item = self.items[self.tableView.indexPathForSelectedRow.row];
        ImageViewController *controller = segue.destinationViewController;
        controller.editName = item[@"name"];
        controller.editType = [item[@"type"] integerValue];
    }
}

#pragma mark - UITableViewDataSource methods

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    cell.textLabel.text = self.items[indexPath.row][@"name"];
    return cell;
}

@end
