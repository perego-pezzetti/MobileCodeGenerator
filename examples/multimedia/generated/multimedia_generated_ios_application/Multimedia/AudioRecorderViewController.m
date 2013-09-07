#import "AudioRecorderViewController.h"

@interface AudioRecorderViewController ()
@property (strong, nonatomic) IBOutlet UIButton *recordButton;
@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) NSURL *recordedAudioUrl;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;

@end

@implementation AudioRecorderViewController



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

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



#pragma mark - AudioPlayer Management

- (IBAction)play:(UIButton *)sender
{
    if(self.audioRecorder.recording){
        [self.audioRecorder stop];
        [self.recordButton setTitle:@"Rec" forState:UIControlStateNormal];
		NSError *error = nil;
		self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.recordedAudioUrl error:&error];
		if(error){
		    //TODO handle the audio player initialization error
		}
    }
    [self.audioPlayer play];
}
- (IBAction)pause:(UIButton *)sender
{
    [self.audioPlayer pause];
}
- (IBAction)stop:(UIButton *)sender
{
    [self.audioPlayer pause];
    [self.audioPlayer setCurrentTime:0];
}
- (IBAction)record:(UIButton *)sender
{
    if (!self.audioRecorder.recording){ //start recording
    	[self.audioPlayer pause];
        [self.audioPlayer setCurrentTime:0];
        
    	NSString* audiosPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/audios"];
        [[NSFileManager defaultManager] createDirectoryAtPath:audiosPath withIntermediateDirectories:YES attributes:nil error:nil];
        NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
        [formatter setDateFormat:@"yyyy-MM-dd_HH-mm-ss"] ;
        NSString* filename = [[formatter stringFromDate:[NSDate date]] stringByAppendingString:@".caf"];
        self.recordedAudioUrl = [NSURL fileURLWithPath:[audiosPath stringByAppendingPathComponent:filename]];
    	
        AVAudioSession *audioSession = [AVAudioSession sharedInstance];
        [audioSession setCategory :AVAudioSessionCategoryPlayAndRecord error:nil];
        [audioSession setActive:YES error:nil];
        NSDictionary *recordSettings = [NSDictionary dictionaryWithObjectsAndKeys:
                                        [NSNumber numberWithInt:AVAudioQualityMin],AVEncoderAudioQualityKey,
                                        [NSNumber numberWithInt:16],AVEncoderBitRateKey,
                                        [NSNumber numberWithInt: 2],AVNumberOfChannelsKey,
                                        [NSNumber numberWithFloat:44100.0],AVSampleRateKey,nil];
        NSError *error = nil;
        self.audioRecorder = [[AVAudioRecorder alloc] initWithURL:self.recordedAudioUrl settings:recordSettings error:&error];
        [self.audioRecorder prepareToRecord];
        [self.audioRecorder record];
        [self.recordButton setTitle:@"Stop" forState:UIControlStateNormal];
    }
    else{  //stop recording
        [self.audioRecorder stop];
        [self.recordButton setTitle:@"Rec" forState:UIControlStateNormal];
		NSError *error = nil;
		self.audioPlayer = [[AVAudioPlayer alloc] initWithContentsOfURL:self.recordedAudioUrl error:&error];
		if(error){
		    //TODO handle the audio player initialization error
		}
    }
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
	if(self.audioRecorder!=nil && self.audioRecorder.isRecording){
	    [self.audioRecorder stop];
	    [self.recordButton setTitle:@"Rec" forState:UIControlStateNormal];
	}
	if(self.audioPlayer!=nil && self.audioPlayer.isPlaying){
	    [self.audioPlayer pause];
	    [self.audioPlayer setCurrentTime:0];
	}
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{}

@end
