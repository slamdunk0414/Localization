//
//  FBLanguageButton.m
//  cartoon
//
//  Created by funnybean on 2016/10/18.
//  Copyright © 2016年 funnybean. All rights reserved.
//

#import "FBLanguageButton.h"
#import "FBLanguageTool.h"

@implementation FBLanguageButton

-(instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(changeTitle) name:languageDidChange object:nil];
    }
    
    return self;
}

-(void)changeTitle{

    [self setTitle:[[FBLanguageTool sharedTool] languageWithLocalTitle:_localTitle] forState:UIControlStateNormal];
}

-(void)setLocalTitle:(NSString *)localTitle{
    _localTitle = localTitle;
    
    [self changeTitle];
}

-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}


@end
