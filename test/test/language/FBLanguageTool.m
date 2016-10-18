//
//  FBLanguageTool.m
//  cartoon
//
//  Created by funnybean on 2016/10/18.
//  Copyright © 2016年 funnybean. All rights reserved.
//

#import "FBLanguageTool.h"
#import "FBLanguageObject.h"

static NSString *userLanguage = @"userLanguage";

@interface FBLanguageTool ()

@property (strong , nonatomic) NSBundle *bundle;

@property (strong , nonatomic) NSString *current;

@end

@implementation FBLanguageTool

static FBLanguageTool *sharedTool = nil;

+(instancetype)sharedTool{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        sharedTool = [[FBLanguageTool alloc]init];
        
        NSArray *array = [self getFontsArray];
        
        sharedTool.fontsArray = array;
        
        NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
        
        NSString *string = [def valueForKey:userLanguage];
        
        if(string.length == 0){
            
            //获取系统当前语言版本(中文zh-Hans,英文en)
            NSArray* languages = [def objectForKey:@"AppleLanguages"];
            
            NSString *current = [languages objectAtIndex:0];
            
            sharedTool.current = current;
            
            //确定是否能在预置的语言中找到本机的语言 如未找到则用默认语言
            if (![self canChangeCurrent:current]) {
                
                //设置默认语言是英语
                sharedTool.current = @"en";
            }
            
            string = sharedTool.current;
            
            [def setValue:current forKey:userLanguage];
            
            [def synchronize];
        }
        
        //获取文件路径
        NSString *path = [[NSBundle mainBundle] pathForResource:string ofType:@"lproj"];
        
        sharedTool.bundle = [NSBundle bundleWithPath:path];//生成bundle
    });
    
    return sharedTool;
}

+(BOOL)canChangeCurrent:(NSString *)current{
    for (FBLanguageObject *object in sharedTool.fontsArray) {
        if ([current hasPrefix:object.language]) {
            sharedTool.current = object.language;
            return YES;
        }
    }
    return NO;
}

+(NSArray *)getFontsArray{
    
    FBLanguageObject *zhhans = [[FBLanguageObject alloc]initWithTitle:@"简体中文" language:@"zh-Hans"];
    
    FBLanguageObject *en = [[FBLanguageObject alloc]initWithTitle:@"english" language:@"en"];
    
    FBLanguageObject *ko = [[FBLanguageObject alloc]initWithTitle:@"한국어" language:@"ko"];
    
    FBLanguageObject *idl = [[FBLanguageObject alloc]initWithTitle:@"Indonesia" language:@"la"];
    
    FBLanguageObject *jan = [[FBLanguageObject alloc]initWithTitle:@"日本語" language:@"ja"];
    
    FBLanguageObject *th = [[FBLanguageObject alloc]initWithTitle:@"ภาษาไทย" language:@"th"];
    
    FBLanguageObject *ru = [[FBLanguageObject alloc]initWithTitle:@"русский" language:@"ru"];
    
    NSArray *array = [NSArray arrayWithObjects:zhhans,en,jan,idl,ko,th,ru, nil];
    
    return array;
}

-(void)setUserLanguage:(NSString *)language{
    
    NSUserDefaults *def = [NSUserDefaults standardUserDefaults];
    
    //1.第一步改变bundle的值
    NSString *path = [[NSBundle mainBundle] pathForResource:language ofType:@"lproj"];
    
    self.bundle = [NSBundle bundleWithPath:path];
    
    //2.持久化
    [def setValue:language forKey:userLanguage];
    
    //3.同步
    [def synchronize];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:languageDidChange object:nil];
}

-(NSString *)userLanguage{
    return self.current;
}

-(NSString *)languageWithLocalTitle:(NSString *)localTitle{
    return [self.bundle localizedStringForKey:localTitle value:nil table:@"hello"];
}

@end
