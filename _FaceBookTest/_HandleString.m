//
//  _HandleString.m
//  _FaceBookTest
//
//  Created by 任浩 on 15/1/7.
//  Copyright (c) 2015年 任浩. All rights reserved.
//

#import "_HandleString.h"

@implementation _HandleString

+(NSAttributedString *)handleStringMethod:(NSString *)str Font:(int)fontSize{
    UIFont *font = [UIFont fontWithName:@"HelveticaNeue" size:fontSize];
    
    NSAttributedString * attr=[[NSAttributedString alloc] initWithString:str attributes:@{ NSFontAttributeName: font}];
    
    return attr;
}



@end
