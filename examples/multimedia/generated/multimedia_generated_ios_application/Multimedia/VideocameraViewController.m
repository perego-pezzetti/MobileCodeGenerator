#import "VideocameraViewController.h"

@interface VideocameraViewController ()
@property (weak, nonatomic) IBOutlet UIView *videoView;
@property (strong, nonatomic) MPMoviePlayerController *moviePlayer;
@property (strong, nonatomic) NSURL *recordedVideoUrl;

@end

@implementation VideocameraViewController



- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
	
	
	
	
	
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
	self.moviePlayer = [[MPMoviePlayerController alloc] initWithContentURL: self.recordedVideoUrl];
	[self.moviePlayer.view setFrame: self.videoView.bounds];
	[self.videoView addSubview:self.moviePlayer.view];
	[self.moviePlayer prepareToPlay];
	[self.moviePlayer play];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}






- (BOOL)startCameraControllerFromViewController:(UIViewController*)controller
                                  usingDelegate:(id <UIImagePickerControllerDelegate,UINavigationControllerDelegate>)delegate
                                  withMediaType:(NSString *)mediaType
{
    if(([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]==NO)||(delegate==nil)||(controller==nil)){
        return NO;
    }
    
    UIImagePickerController *cameraUI = [[UIImagePickerController alloc] init];
    cameraUI.sourceType = UIImagePickerControllerSourceTypeCamera;
    cameraUI.allowsEditing = YES;
    cameraUI.delegate = delegate;
    
    if([[UIImagePickerController availableMediaTypesForSourceType:cameraUI.sourceType] containsObject:mediaType]){
        cameraUI.mediaTypes = [[NSArray alloc] initWithObjects:(NSString *)mediaType,nil];
    }
    
    [controller presentViewController:cameraUI animated:YES completion:^{}];
    return YES;
}

#pragma mark - Image Picker Controller Delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = [info objectForKey:UIImagePickerControllerMediaType];
    
    if([mediaType isEqualToString:@"public.movie"]){
        NSURL *videoFileUri = info[UIImagePickerControllerMediaURL];
        self.recordedVideoUrl = [NSURL fileURLWithPath:[self copyVideoInVideosFolder:videoFileUri]];
        //TODO use the video
    }
    
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)imagePickerControllerDidCancel: (UIImagePickerController *) picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
    //User cancelled the media capture
    //TODO implement the action
}

- (IBAction)showVideocameraUI:(UIButton *)sender
{
    [self startCameraControllerFromViewController: self usingDelegate: self withMediaType:(NSString *)kUTTypeMovie];
}

- (NSString *)copyVideoInVideosFolder:(NSURL *)sourceVideoFileUri
{
    NSData *videoData = [NSData dataWithContentsOfURL:sourceVideoFileUri];
    NSString *videosPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/videos"];
    [[NSFileManager defaultManager] createDirectoryAtPath:videosPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd_HH-mm-ss"] ;
    NSString *filename = [[formatter stringFromDate:[NSDate date]] stringByAppendingString:@".mp4"];
    NSString *localVideoPath= [[NSString alloc] initWithString:[NSString stringWithFormat:@"%@/%@",videosPath,filename]];
    [videoData writeToFile:localVideoPath atomically:YES];
    return localVideoPath;
}



- (void)viewWillAppear:(BOOL)animated
{
	[super viewWillAppear:animated];
	// Auto-generated method stub
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
	// Auto-generated method stub
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
	// Auto-generated method stub
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{}

@end
