//
//  GvaView.m
//  GvaView
//
//  Created by Xi Cao on 4/08/12.
//  Copyright (c) 2012 xic. All rights reserved.
//

#import "GvaView.h"

#pragma mark - application component data

#define CALIBRATION                 20

#define STATUS_ALERM_BAR            CGRectMake(144,113-CALIBRATION,740,11)
#define STATUS_INFORMATION_BAR      CGRectMake(144,113-CALIBRATION,740,65)

#define MAIN_DISPLAY_AREA           CGRectMake(144,178-CALIBRATION,740,495)

#define FUNCTION_LABEL_ORIGIN       CGPointMake(159.5,113-CALIBRATION)
#define FUNCTION_LABEL_SIZE         CGSizeMake(65,11)
#define FUNCTION_LABEL_GAP          92

#define RECONFIGURABEL_LABEL        CGRectMake(150,185-CALIBRATION,100,60)
#define RECONFIGURABEL_LABEL_GAP    68

#pragma mark - name of labels

#define F1 @""
#define F2 @""
#define F3 @""
#define F4 @""
#define F5 @""
#define F6 @""
#define F7 @""
#define F8 @""
#define F9 @""
#define F10 @""
#define F11 @""
#define F12 @""
#define F13 @""
#define F14 @""
#define F15 @""
#define F16 @""
#define F17 @""
#define F18 @""
#define F19 @""
#define F20 @""

@implementation GvaView

@synthesize functionAreaLabel = _functionAreaLabel;

- (void)setup {
    self.contentMode = UIViewContentModeRedraw;
}

- (void)awakeFromNib {
    [self setup];
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self setup];
    }
    return self;
}

- (void)drawRect:(CGRect)rect inContext:(CGContextRef)context {
    UIGraphicsPushContext(context);
    
    CGContextBeginPath(context);
    CGContextAddRect(context, rect);
    CGContextDrawPath(context,kCGPathFillStroke);
    
    UIGraphicsPopContext();
}

- (void)drawRectAtPoint:(CGPoint)p withSize:(CGSize)size inContext:(CGContextRef)context  {
    UIGraphicsPushContext(context);
    
    CGContextBeginPath(context);
    CGContextAddRect(context, CGRectMake(p.x, p.y, size.width, size.height));
    CGContextDrawPath(context,kCGPathFillStroke);
    
    UIGraphicsPopContext();
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 1.0);
    
    // draw a white rectangle
    [[UIColor whiteColor] setFill];
    [[UIColor blackColor] setStroke];
    
    [self drawRect:MAIN_DISPLAY_AREA inContext:context];
    
    // draw two gray rectangles
    [[UIColor grayColor] setFill];
    [[UIColor blackColor] setStroke];
    
    [self drawRect:STATUS_INFORMATION_BAR inContext:context];
    [self drawRect:STATUS_ALERM_BAR inContext:context];
    
    // draw labels
    [[UIColor greenColor] setFill];
    [[UIColor blackColor] setStroke];
    
    CGPoint origin = FUNCTION_LABEL_ORIGIN;
    for (int i = 0; i < 8; i++) {
        if (i == self.functionAreaLabel) {
            CGContextSetLineWidth(context, 3.0);
            [[UIColor yellowColor] setStroke];
        } else {
            CGContextSetLineWidth(context, 1.0);
            [[UIColor blackColor] setStroke];
        }
        
        [self drawRectAtPoint:origin withSize:FUNCTION_LABEL_SIZE inContext:context];
        origin.x += FUNCTION_LABEL_GAP;
    }
    
    
    CGRect frame = RECONFIGURABEL_LABEL;
    NSArray *labelText = [NSArray arrayWithObjects:F1,F2,F3,F4,F5,F6,F7,F8,F9,F10,F11,F12,nil];
    for (int i = 0; i < 6; i++) {
        UILabel *label = [[UILabel alloc] initWithFrame:frame];
        
        [label setBackgroundColor:[UIColor greenColor]];
        if ([[labelText objectAtIndex:i] isKindOfClass:[NSString class]]) {
            [label setFont:[UIFont fontWithName:@"Courier" size: 20.0]];
            [label setTextAlignment:UITextAlignmentCenter];
            [label setText:(NSString *)[labelText objectAtIndex:i]];
        }
        
        [self addSubview:label];
        frame.origin.y += RECONFIGURABEL_LABEL_GAP;
    }
    
    // draw buttons
    
    // draw a GUI and a compass
}

- (void)functionLabelSelected:(NSString *)label {
    NSArray *title = [NSArray arrayWithObjects:@"SA",@"WPN",@"DEF",@"SYS",@"DRV",@"STR",@"COM",@"BMS",nil];
    
    if ([title indexOfObject:label] == NSNotFound) {
        self.functionAreaLabel = 0;
    } else {
        self.functionAreaLabel = [title indexOfObject:label];
    }
    
    [self setNeedsDisplay];
}

@end
