//
//  FBLanguageTool.h
//  cartoon
//
//  Created by funnybean on 2016/10/18.
//  Copyright © 2016年 funnybean. All rights reserved.
//

#import <Foundation/Foundation.h>

static NSString *languageDidChange = @"languageDidChange";

@interface FBLanguageTool : NSObject

+(instancetype)sharedTool;

@property (strong,nonatomic) NSArray *fontsArray;

-(void)setUserLanguage:(NSString *)language;

-(NSString *)userLanguage;

-(NSString *)languageWithLocalTitle:(NSString *)localTitle;

@end
