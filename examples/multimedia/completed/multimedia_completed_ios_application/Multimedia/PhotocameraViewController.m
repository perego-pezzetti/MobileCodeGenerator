#import "PhotocameraViewController.h"

@interface PhotocameraViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageView;

@end

@implementation PhotocameraViewController



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
    
    if([mediaType isEqualToString:@"public.image"]){
        UIImage *photo = [info objectForKey:UIImagePickerControllerOriginalImage];
        NSString *localImageFileUri = [self copyImageInImagesFolder: photo];
        //TODO use the photo
        self.imageView.image = photo;
    }
    
    [self dismissViewControllerAnimated:YES completion:^{}];
}

- (void)imagePickerControllerDidCancel: (UIImagePickerController *) picker
{
    [self dismissViewControllerAnimated:YES completion:^{}];
    //User cancelled the media capture
    //TODO implement the action
}

- (IBAction)showFotocameraUI:(UIButton *)sender
{
    [self startCameraControllerFromViewController: self usingDelegate: self withMediaType:(NSString *)kUTTypeImage];
}

- (NSString *)copyImageInImagesFolder:(UIImage *)photo
{
    NSData *imageData = UIImagePNGRepresentation(photo);
    NSString *imagesPath = [[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0] stringByAppendingString:@"/images"];
    [[NSFileManager defaultManager] createDirectoryAtPath:imagesPath withIntermediateDirectories:YES attributes:nil error:nil];
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd_HH-mm-ss"] ;
    NSString *filename = [[formatter stringFromDate:[NSDate date]] stringByAppendingString:@".png"];
    NSString *localImagePath= [[NSString alloc] initWithString:[NSString stringWithFormat:@"%@/%@",imagesPath,filename]];
    [imageData writeToFile:localImagePath atomically:YES];
    return localImagePath;
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
