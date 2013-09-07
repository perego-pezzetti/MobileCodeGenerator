#import <Foundation/Foundation.h>

@interface ImageDownloadingTask : NSObject
-(void) downloadImageFromUrl:(NSString *)url forImageView: (UIImageView *)imageView;
@end
