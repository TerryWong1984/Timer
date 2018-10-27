
#import "TimerDetailViewController.h"
#import "myButton.h"
#import "myLabel.h"
@interface TimerDetailViewController ()
{
    // 显示时间
    myLabel* myla01;
    // 记录第一个时间
    myLabel* myla1;
    // 记录第二个时间
    myLabel* myla2;
    // 记录第三个时间
    myLabel* myla3;
    // 记录第四个时间
    myLabel* myla4;
    // 开始计时
    myButton* mybegin;
    // 结束计时
    myButton* mystop;
    // 记录时间
    myButton* mylap;
    // 时间归零
    myButton* myreap;
     // 分、秒、毫秒
    int _min,_miao,_haomiao,_hour;
    // 记录的次数
    int _count;
    int a;
    NSTimer* _t;
}
@end
@implementation TimerDetailViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    // 创建Label显示时间
    myla01 = [[myLabel alloc]initSetLabel:50 :30];
    [self.view addSubview:myla01];
    // 创建Label记录第一个时间
    myla1 = [[myLabel alloc]initSetLabel:50 :205];
    [self.view addSubview:myla1];
    // 创建Label记录第二个时间
    myla2 = [[myLabel alloc]initSetLabel:50 :265];
    [self.view addSubview:myla2];
    // 创建Label记录第三个时间
    myla3 = [[myLabel alloc]initSetLabel:50 :325];
    [self.view addSubview:myla3];
    // 创建Label记录第四个时间
    myla4 = [[myLabel alloc]initSetLabel:50 :385];
    [self.view addSubview:myla4];
    // 创建开始、停止、计时、归零按钮
    mybegin = [[myButton alloc]initSetButton:60 :95];
    UIImage* imbegin = [UIImage imageNamed:@"开始"];
    [mybegin setImage:imbegin forState:UIControlStateNormal];
    mystop = [[myButton alloc]initSetButton:60 :150];
    UIImage* imstop = [UIImage imageNamed:@"停止"];
    [mystop setImage:imstop forState:UIControlStateNormal];
    mylap = [[myButton alloc]initSetButton:190 :95];
    UIImage* imlap = [UIImage imageNamed:@"计时"];
    [mylap setImage:imlap forState:UIControlStateNormal];
    myreap = [[myButton alloc]initSetButton:190 :150];
    UIImage* imreap = [UIImage imageNamed:@"归零"];
    [myreap setImage:imreap forState:UIControlStateNormal];
    [self.view addSubview:mybegin];
    [self.view addSubview:mystop];
    [self.view addSubview:mylap];
    [self.view addSubview:myreap];
    // 初始化时间为0
    myla01.text = [NSString stringWithFormat:@"%02i:%02i:%02i'%02i",_hour,_min,_miao,_haomiao];
    // 监听开始、暂停、计时、归零等按钮
    [mybegin addTarget:self action:@selector(begin) forControlEvents:UIControlEventTouchUpInside];
    [mystop addTarget:self action:@selector(stop) forControlEvents:UIControlEventTouchUpInside];
    [mylap addTarget:self action:@selector(lap) forControlEvents:UIControlEventTouchUpInside];
    [myreap addTarget:self action:@selector(reap) forControlEvents:UIControlEventTouchUpInside];
    
//    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.navigationController.navigationBar.translucent = NO ;
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
// 时间的计算方法
- (void)time
{
    _haomiao++;
    if(100 == _haomiao)
    {
        _miao++;
        _haomiao = 0;
    }if(60 == _miao)
    {
        _min++;
        _miao = 0;
    }if(60 == _min){
        _hour++;
        _min = 0 ;
    }
    myla01.text = [NSString stringWithFormat:@"%02i:%02i:%02i'%02i",_hour,_min,_miao,_haomiao];
}
// 开始计时
- (void)begin{
    if(a == 0){
        _t = [NSTimer scheduledTimerWithTimeInterval:0.01 target:self selector:@selector(time) userInfo:nil repeats:YES];
        // 多线程
       [[NSRunLoop currentRunLoop] addTimer:_t forMode:NSRunLoopCommonModes];
    }
    a++;
}
// 停止计时
- (void)stop{
    a = 0;
    [_t setFireDate:[NSDate distantFuture]];
    if(self.delegate && [self.delegate respondsToSelector:@selector(setcurrentTime:)]){
        [self.delegate setcurrentTime:myla01.text];
    }
}
// 记录时间
- (void)lap{
    _count++;
    switch(_count)
    {
        case 1:{
            myla1.text = [NSString stringWithFormat:@"1     %02i:%02i'%02i",_min,_miao,_haomiao];
            break;
        }case 2:{
            myla2.text = [NSString stringWithFormat:@"2     %02i:%02i'%02i",_min,_miao,_haomiao];
            break;
        }case 3:{
            myla3.text = [NSString stringWithFormat:@"3     %02i:%02i'%02i",_min,_miao,_haomiao];
            break;
        }case 4:{
            myla4.text = [NSString stringWithFormat:@"4     %02i:%02i'%02i",_min,_miao,_haomiao];
            break;

        }
    }
}
// 时间归零
- (void)reap{
    
    a = 0;
    _count = 0;
    _haomiao = 0;
    _miao = 0;
    _min = 0;
    [_t setFireDate:[NSDate distantFuture]];
    myla01.text = [NSString stringWithFormat:@"%02i:%02i:%02i'%02i",_hour,_min,_miao,_haomiao];
    myla1.text = [NSString stringWithFormat:@""];
    myla2.text = [NSString stringWithFormat:@""];
    myla3.text = [NSString stringWithFormat:@""];
    myla4.text = [NSString stringWithFormat:@""];
}
@end
