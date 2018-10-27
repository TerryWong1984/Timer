
#import <UIKit/UIKit.h>

@protocol TimerDetailViewControllerProtocal <NSObject>
@optional
-(void)setcurrentTime:(NSString *)time ;

@end


@interface TimerDetailViewController : UIViewController
@property (nonatomic,weak)id<TimerDetailViewControllerProtocal> delegate ;

@end

