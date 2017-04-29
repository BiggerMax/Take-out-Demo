//
//  NSString+Onekit.m
//  Onekit
//
//  Created by www.onekit.cn on 15/3/4.
//  Copyright (c) 2015年 www.onekit.cn. All rights reserved.
//

#import "NSString+Onekit.h"
#import "Macro.h"

@implementation NSString(Onekit)
+ (void)init
{
    //[Onekit init];
}
+ (BOOL)isEmpty:(NSString*)str
{
    if (isNull(str)) {
        return TRUE;
    }
    if([format(@"%@",str) isEqualToString:@""]){
        return TRUE;
    }
    return FALSE;
}

+ (NSString *)newGUID{
    CFUUIDRef uuid_ref = CFUUIDCreate(NULL);
    CFStringRef uuid_string_ref= CFUUIDCreateString(NULL, uuid_ref);
    CFRelease(uuid_ref);
    NSString *uuid = [NSString stringWithString:(__bridge NSString*)uuid_string_ref];
    CFRelease(uuid_string_ref);
    return uuid;
}
+ (NSString*)fill:(NSInteger)value length:(NSInteger)length
{
    NSString* RESULT = [NSString stringWithFormat:@"%ld",(long)value];
    while (RESULT.length<length) {
        RESULT = [NSString stringWithFormat:@"0%@",RESULT];
    }
    return RESULT;
}
- (NSString*)trim
{
    return  [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
}

- (NSInteger)indexOf:(NSString *)string
{
    NSRange range = [self rangeOfString:string];
    return range.location;
}

-(NSInteger)lastIndexOf:(NSString *)str
{
    NSString* temp = [NSString stringWithString:self];
    NSInteger index = -1;
    while (TRUE) {
        NSRange range = [temp rangeOfString:str];
        if(range.length>0){
            if(index==-1){
                index = 0;
            }else{
                index+=str.length;
            }
            index += range.location;
            temp = [self substringFromIndex:(index+str.length)];
        }else{
            return index;
        }
    }
}
- (BOOL)contains:(NSString *)string
{
    return !([self indexOf:string]==NSNotFound);
}

- (BOOL)startWith:(NSString *)string
{
    return ([self indexOf:string]==0);
}

- (BOOL)endWith:(NSString *)string
{
    return ([self indexOf:string] == self.length - string.length);
}

- (NSString*)replace:(NSString *)target to:(NSString*)to
{
    return [self stringByReplacingOccurrencesOfString:target withString:to];
}

- (NSArray*)split:(NSString *)split
{
    return [self componentsSeparatedByString:split];
}

- (NSString *)URLEncode
{
    NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,    (CFStringRef)self,NULL,CFSTR("!*'();:@&=+$,/?%#[]"),kCFStringEncodingUTF8));
    return result;
}
-(NSString *)URLDecode
{
    NSString *decodeString = (__bridge_transfer NSString *)CFURLCreateStringByReplacingPercentEscapesUsingEncoding(NULL, (__bridge CFStringRef)self, CFSTR(""), CFStringConvertNSStringEncodingToEncoding(NSUTF8StringEncoding));
    return decodeString;
}
- (CGSize)sizeWithSize:(CGSize)size font:(UIFont*)font
{
    return [self boundingRectWithSize:size
                              options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:@{NSFontAttributeName:font}
                              context:nil].size;
}

@end
