#import "myButton.h"

@implementation myButton
- (instancetype)initSetButton:(int)x :(int)y
{
    
    //
    if (self = [super init])
    {
        // 设置位置及大小
        CGRect myframe = CGRectMake(x, y, 50, 50);
        self.frame = myframe;
    }
    return self;
}
@end
