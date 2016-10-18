//
//  FBLanguageObject.m
//  cartoon
//
//  Created by funnybean on 2016/10/18.
//  Copyright © 2016年 funnybean. All rights reserved.
//

#import "FBLanguageObject.h"

@implementation FBLanguageObject

-(instancetype)initWithTitle:(NSString *)title language:(NSString *)language{
    
    self = [super init];
    
    if (self) {
        self.title = title;
        self.language = language;
    }

    return self;
}



@end
