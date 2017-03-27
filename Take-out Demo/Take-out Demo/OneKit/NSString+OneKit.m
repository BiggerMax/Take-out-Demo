//
//  NSString+OneKit.m
//  OneKit
//
//  Created by www.onekit.cn on 15/3/4.
//  Copyright (c) 2015年 www.onekit.cn. All rights reserved.
//

#import "NSString+OneKit.h"
#import "Macro.h"

@implementation NSString(OneKit)
+ (void)init
{
    //[OneKit init];
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
- (NSString*)fill:(NSInteger)length
{
    NSString* RESULT = [NSString stringWithString:self];
    while (RESULT.length<length) {
        RESULT = [NSString stringWithFormat:@"0%@",RESULT];
    }
    return RESULT;
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
- (NSString*)subString:(NSInteger)from
{
    return [self substringFromIndex:from];
}
- (NSString*)subString:(NSInteger)from to:(NSInteger)to
{
    return [self substringWithRange:NSMakeRange(from, to-from)];
}
- (NSString*)subString:(NSInteger)from length:(NSInteger)length
{
      return [self substringWithRange:NSMakeRange(from, length)];
}
- (NSInteger)indexOf:(NSString *)string
{
    NSRange range = [self rangeOfString:string];
    if(range.length>0){
        return range.location;
    }else{
        return -1;
    }
}
- (NSInteger)lastIndexOf:(NSString *)string
{
    NSString* STRING = self;
    NSInteger p = [STRING indexOf:string];
    if(p<0){
        return p;
    }
    NSInteger index = p;
    while(TRUE){
        STRING = [STRING substringFromIndex:p+1];
        p = [STRING indexOf:string];
        if(p<0){
            return index;
        }
        index += p+1;
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
    return [self stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
  // NSString *result = (NSString *)CFBridgingRelease(CFURLCreateStringByAddingPercentEscapes(kCFAllocatorDefault,    (CFStringRef)self,NULL,CFSTR("!*'();:@&=+$,/?%#[]"),kCFStringEncodingUTF8));
   // return result;
}

- (CGSize)sizeWithSize:(CGSize)size font:(UIFont*)font
{
    return [self boundingRectWithSize:size
                              options:NSStringDrawingTruncatesLastVisibleLine | NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                           attributes:@{NSFontAttributeName:font}
                              context:nil].size;
}
- (NSString*)unescape
{
    return [self stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
}
-(NSString *)escape
{
    NSArray *hex = [NSArray arrayWithObjects:
                    @"00",@"01",@"02",@"03",@"04",@"05",@"06",@"07",@"08",@"09",@"0A",@"0B",@"0C",@"0D",@"0E",@"0F",
                    @"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19",@"1A",@"1B",@"1C",@"1D",@"1E",@"1F",
                    @"20",@"21",@"22",@"23",@"24",@"25",@"26",@"27",@"28",@"29",@"2A",@"2B",@"2C",@"2D",@"2E",@"2F",
                    @"30",@"31",@"32",@"33",@"34",@"35",@"36",@"37",@"38",@"39",@"3A",@"3B",@"3C",@"3D",@"3E",@"3F",
                    @"40",@"41",@"42",@"43",@"44",@"45",@"46",@"47",@"48",@"49",@"4A",@"4B",@"4C",@"4D",@"4E",@"4F",
                    @"50",@"51",@"52",@"53",@"54",@"55",@"56",@"57",@"58",@"59",@"5A",@"5B",@"5C",@"5D",@"5E",@"5F",
                    @"60",@"61",@"62",@"63",@"64",@"65",@"66",@"67",@"68",@"69",@"6A",@"6B",@"6C",@"6D",@"6E",@"6F",
                    @"70",@"71",@"72",@"73",@"74",@"75",@"76",@"77",@"78",@"79",@"7A",@"7B",@"7C",@"7D",@"7E",@"7F",
                    @"80",@"81",@"82",@"83",@"84",@"85",@"86",@"87",@"88",@"89",@"8A",@"8B",@"8C",@"8D",@"8E",@"8F",
                    @"90",@"91",@"92",@"93",@"94",@"95",@"96",@"97",@"98",@"99",@"9A",@"9B",@"9C",@"9D",@"9E",@"9F",
                    @"A0",@"A1",@"A2",@"A3",@"A4",@"A5",@"A6",@"A7",@"A8",@"A9",@"AA",@"AB",@"AC",@"AD",@"AE",@"AF",
                    @"B0",@"B1",@"B2",@"B3",@"B4",@"B5",@"B6",@"B7",@"B8",@"B9",@"BA",@"BB",@"BC",@"BD",@"BE",@"BF",
                    @"C0",@"C1",@"C2",@"C3",@"C4",@"C5",@"C6",@"C7",@"C8",@"C9",@"CA",@"CB",@"CC",@"CD",@"CE",@"CF",
                    @"D0",@"D1",@"D2",@"D3",@"D4",@"D5",@"D6",@"D7",@"D8",@"D9",@"DA",@"DB",@"DC",@"DD",@"DE",@"DF",
                    @"E0",@"E1",@"E2",@"E3",@"E4",@"E5",@"E6",@"E7",@"E8",@"E9",@"EA",@"EB",@"EC",@"ED",@"EE",@"EF",
                    @"F0",@"F1",@"F2",@"F3",@"F4",@"F5",@"F6",@"F7",@"F8",@"F9",@"FA",@"FB",@"FC",@"FD",@"FE",@"FF", nil];
    
    NSMutableString *result = [NSMutableString stringWithString:@""];
    NSInteger strLength = self.length;
    for (int i=0; i<strLength; i++) {
        int ch = [self characterAtIndex:i];
        if (ch == ' ')
        {
            [result appendFormat:@"%c",'+'];
        }
        else if ('A' <= ch && ch <= 'Z')
        {
            [result appendFormat:@"%c",(char)ch];
            
        }
        else if ('a' <= ch && ch <= 'z')
        {
            [result appendFormat:@"%c",(char)ch];
        }
        else if ('0' <= ch && ch<='9')
        {
            [result appendFormat:@"%c",(char)ch];
        }
        else if (ch == '-' || ch == '_'
                 || ch == '.' || ch == '!'
                 || ch == '~' || ch == '*'
                 || ch == '\'' || ch == '('
                 || ch == ')')
        {
            [result appendFormat:@"%c",(char)ch];
        }
        else if (ch <= 0x007F)
        {
            [result appendFormat:@"%c",'%'];
            [result appendString:[hex objectAtIndex:ch]];
        }
        else
        {
            [result appendFormat:@"%c",'%'];
            [result appendFormat:@"%c",'u'];
            [result appendString:[hex objectAtIndex:ch>>8]];
            [result appendString:[hex objectAtIndex:0x00FF & ch]];
        }
    }
    return result;
}

- (NSString*)ext
{
    NSInteger p = [self lastIndexOf:@"."];
    if(p>=0){
        return [self substringFromIndex:(p+1)];
    }else{
        return nil;
    }
}
- (NSString*)firstUpper
{
    return [[[self substringToIndex:1] uppercaseString] stringByAppendingString:[self substringFromIndex:1]];
}
@end
