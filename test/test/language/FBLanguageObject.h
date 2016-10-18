//
//  FBLanguageObject.h
//  cartoon
//
//  Created by funnybean on 2016/10/18.
//  Copyright © 2016年 funnybean. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FBLanguageObject : NSObject

//用于显示的title
@property (strong , nonatomic) NSString *title;

//用于匹配languageTool的设置
@property (strong , nonatomic) NSString *language;

-(instancetype)initWithTitle:(NSString *)title language:(NSString *)language;

@end
