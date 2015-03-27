//
//  puzzleImageModel.m
//  MagicPuzzle
//
//  Created by broy denty on 14-4-24.
//  Copyright (c) 2014年 denty. All rights reserved.
//

#import "puzzleImageModel.h"
#import "UIImage+additions.h"
@implementation puzzleImageModel
+ (NSArray*)pathsForImages
{
    NSArray *dirContents = [[NSBundle mainBundle] pathsForResourcesOfType:nil inDirectory:nil];
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:dirContents.count];
    for (NSString *string in dirContents)
    {
        if ([string hasSuffix:@"_puzzle.jpg"]  ||
            [string hasSuffix:@"_puzzle.jpeg"] ||
            [string hasSuffix:@"_puzzle.png"]  ||
            [string hasSuffix:@"_puzzle.JPG"]  ||
            [string hasSuffix:@"_puzzle.JPEG"] ||
            [string hasSuffix:@"_puzzle.PNG"]
            ) {
            [tempArray addObject:string];
        }
    }
    NSLog(@"Found %d images", tempArray.count);
    return [NSArray arrayWithArray:tempArray];
}

+ (NSArray*)imagesThumbForPuzzle
{
    NSArray *dirContents = [[NSBundle mainBundle] pathsForResourcesOfType:nil inDirectory:nil];
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:dirContents.count];
    for (NSString *string in dirContents)
    {
        if ([string hasSuffix:@"_puzzle_thumb.jpg"]  ||
            [string hasSuffix:@"_puzzle_thumb.jpeg"] ||
            [string hasSuffix:@"_puzzle_thumb.png"]  ||
            [string hasSuffix:@"_puzzle_thumb.JPG"]  ||
            [string hasSuffix:@"_puzzle_thumb.JPEG"] ||
            [string hasSuffix:@"_puzzle_thumb.PNG"]
            ) {
            
            [tempArray addObject:[UIImage imageWithContentsOfFile:string]];
        }
    }
    NSLog(@"Found %d thumbs", tempArray.count);
    return [NSArray arrayWithArray:tempArray];
}
//EasyImages
+ (NSArray*)pathsForEasyImages
{
    NSArray *dirContents = [[NSBundle mainBundle] pathsForResourcesOfType:nil inDirectory:nil];
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:dirContents.count];
    for (NSString *string in dirContents)
    {
        if ([string hasSuffix:@"_Easy_puzzle.jpg"]  ||
            [string hasSuffix:@"_Easy_puzzle.jpeg"] ||
            [string hasSuffix:@"_Easy_puzzle.png"]  ||
            [string hasSuffix:@"_Easy_puzzle.JPG"]  ||
            [string hasSuffix:@"_Easy_puzzle.JPEG"] ||
            [string hasSuffix:@"_Easy_puzzle.PNG"]
            ) {
            [tempArray addObject:string];
        }
    }
    NSLog(@"Found %d images", tempArray.count);
    return [NSArray arrayWithArray:tempArray];
}

+ (NSArray*)imagesThumbForEasyPuzzle
{
    NSArray *dirContents = [[NSBundle mainBundle] pathsForResourcesOfType:nil inDirectory:nil];
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:dirContents.count];
    for (NSString *string in dirContents)
    {
        if ([string hasSuffix:@"_Easy_puzzle_thumb.jpg"]  ||
            [string hasSuffix:@"_Easy_puzzle_thumb.jpeg"] ||
            [string hasSuffix:@"_Easy_puzzle_thumb.png"]  ||
            [string hasSuffix:@"_Easy_puzzle_thumb.JPG"]  ||
            [string hasSuffix:@"_Easy_puzzle_thumb.JPEG"] ||
            [string hasSuffix:@"_Easy_puzzle_thumb.PNG"]
            ) {
            
            [tempArray addObject:[UIImage imageWithContentsOfFile:string]];
        }
    }
    NSLog(@"Found %d thumbs", tempArray.count);
    return [NSArray arrayWithArray:tempArray];
}
//HardImages
+ (NSArray*)pathsForHardImages
{
    NSArray *dirContents = [[NSBundle mainBundle] pathsForResourcesOfType:nil inDirectory:nil];
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:dirContents.count];
    for (NSString *string in dirContents)
    {
        if ([string hasSuffix:@"_Hard_puzzle.jpg"]  ||
            [string hasSuffix:@"_Hard_puzzle.jpeg"] ||
            [string hasSuffix:@"_Hard_puzzle.png"]  ||
            [string hasSuffix:@"_Hard_puzzle.JPG"]  ||
            [string hasSuffix:@"_Hard_puzzle.JPEG"] ||
            [string hasSuffix:@"_Hard_puzzle.PNG"]
            ) {
            [tempArray addObject:string];
        }
    }
    NSLog(@"Found %d images", tempArray.count);
    return [NSArray arrayWithArray:tempArray];
}

+ (NSArray*)imagesThumbForHardPuzzle
{
    NSArray *dirContents = [[NSBundle mainBundle] pathsForResourcesOfType:nil inDirectory:nil];
    NSMutableArray *tempArray = [[NSMutableArray alloc] initWithCapacity:dirContents.count];
    for (NSString *string in dirContents)
    {
        if ([string hasSuffix:@"_Hard_puzzle_thumb.jpg"]  ||
            [string hasSuffix:@"_Hard_puzzle_thumb.jpeg"] ||
            [string hasSuffix:@"_Hard_puzzle_thumb.png"]  ||
            [string hasSuffix:@"_Hard_puzzle_thumb.JPG"]  ||
            [string hasSuffix:@"_Hard_puzzle_thumb.JPEG"] ||
            [string hasSuffix:@"_Hard_puzzle_thumb.PNG"]
            ) {
            
            [tempArray addObject:[UIImage imageWithContentsOfFile:string]];
        }
    }
    NSLog(@"Found %d thumbs", tempArray.count);
    return [NSArray arrayWithArray:tempArray];
}

//scale
+ (UIImage *)scaleImageForThumb:(UIImage *)image
{
    CGFloat ratio = image.size.width/image.size.height;
    image = [image scaleToSize:CGSizeMake(350*ratio, 350)];
    UIGraphicsBeginImageContext(CGSizeMake(image.size.width , image.size.height ));
    [image drawInRect:CGRectMake(0, 0, image.size.width , image.size.height )];
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return scaledImage;
}
@end
