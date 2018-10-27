#import "myLabel.h"

@implementation myLabel
- (instancetype)initSetLabel:(int)x :(int)y;
{
    if(self = [super init]){
        // 设置位置及大小
        CGRect myframe = CGRectMake(x, y, 200, 60);
        self.frame = myframe;
        // 设置背景颜色
        self.backgroundColor = [UIColor colorWithRed:0.995 green:0.982 blue:0.550 alpha:1.000];
        // 设置字体居中
        self.textAlignment = UITextAlignmentCenter;
        //边框颜色
        self.layer.borderColor = [UIColor redColor].CGColor;
        //边框宽度
        self.layer.borderWidth = 0.5;
        // 设置Label圆角
       // self.layer.cornerRadius = self.frame.size.width/2;
        //设置文字类型与大小
        self.font = [UIFont fontWithName:@"Arial" size:33];
    }
    return self;
}

@end
