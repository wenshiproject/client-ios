//
//  Macros.h
//  KaoLaPlatform
//
//  Created by Doyang on 14-4-8.
//  Copyright (c) 2014年 Onyx International Inc. All rights reserved.
//

#ifndef _MACROS_H_
#define _MACROS_H_

#define IS_IOS_7  ([[[[UIDevice currentDevice] systemVersion] substringToIndex:1] intValue]>=7)

#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)

#define _text(key) \
    [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]

#define _img(name) \
    [UIImage imageNamed:(name)]

#define _img2(name_3_5_inch, name_4_0_inch) \
    (SCREEN_HEIGHT > 960 ? [UIImage imageNamed:(name_4_0_inch)] : [UIImage imageNamed:(name_3_5_inch)])

#define _color(value) \
    (value / 255.0f)


#define _font(size) \
    ([UIFont systemFontOfSize:(size)])
#define _fontHelveticaB(fontsize) \
    ([UIFont fontWithName:@"Helvetica-Bold" size:(fontsize)])

#endif
