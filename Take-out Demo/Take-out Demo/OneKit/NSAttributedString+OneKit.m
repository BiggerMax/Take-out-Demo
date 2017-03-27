//
//  NSAttributedString+OneKit.m
//  Onekit_Designer
//
//  Created by zhangjin on 16/12/13.
//  Copyright © 2016年 onekit.cn. All rights reserved.
//
#import "OneKit.h"
#import "NSAttributedString+OneKit.h"

@implementation NSAttributedString(OneKit)
+ (NSAttributedString*)fromJSON:(NSArray*)jsons
{
    if(!jsons){
        return nil;
    }
    //NSLog(@"%@",jsons);
    NSMutableAttributedString* RESULT = [NSMutableAttributedString new];
    for (NSDictionary* json in jsons) {
        //NSString* alignment = json[@"alignment"];
        NSArray* jsns = json[@"jsons"];
        for (NSDictionary* jsn in jsns) {
            NSString* string = jsn[@"text"];
            NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:string];
            NSRange range = NSMakeRange(0, string.length);
            NSDictionary* fontJSON = jsn[@"font"];
            if(notNull(fontJSON)){
                UIFont* font = [UIFont systemFontOfSize:[fontJSON[@"size"] longValue]];
                [attributedString addAttribute:NSFontAttributeName value:font range:range];
            }
            if(notNull(jsn[@"color"])){
                [attributedString addAttribute:NSForegroundColorAttributeName value:[UIColor parse:jsn[@"color"]] range:range];
            }
            if(notNull(jsn[@"backgroundColor"])){
                [attributedString addAttribute:NSBackgroundColorAttributeName value:[UIColor parse:jsn[@"backgroundColor"]] range:range];
            }
            [RESULT insertAttributedString:attributedString atIndex:RESULT.length];
        }
    }
    return RESULT;
}
+ (NSArray*)toJSON:(NSAttributedString*)attributedString
{
    if(!attributedString){
        return nil;
    }
    NSMutableArray* RESULT = [NSMutableArray new];

    return RESULT;
}
@end
