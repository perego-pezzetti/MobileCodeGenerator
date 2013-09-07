#import "NoteDetailViewController.h"

@interface NoteDetailViewController ()
@property (weak, nonatomic) IBOutlet UITextView *noteEditText;
@property (strong, nonatomic) UIAlertView *deleteAlertDialog;
@end

@implementation NoteDetailViewController


-(UIAlertView *)deleteAlertDialog{
    if(!_deleteAlertDialog){
    	_deleteAlertDialog = [[UIAlertView alloc] initWithTitle:@"Eliminazione Nota" message:@"Vuoi eliminare la nota?" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Ok",nil];
    }
    return _deleteAlertDialog;
}

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
	
	
	UIAlertView *noteDetailProgressDialogAlertView = [[UIAlertView alloc] initWithTitle:@"Promemoria" message:@"Aggiornamento in corso…" delegate:self cancelButtonTitle:nil otherButtonTitles:nil];
	UIActivityIndicatorView *noteDetailProgressDialog = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
	[noteDetailProgressDialogAlertView show];
	noteDetailProgressDialog.frame = CGRectMake(noteDetailProgressDialogAlertView.frame.origin.x+noteDetailProgressDialogAlertView.frame.size.width/2-noteDetailProgressDialog.frame.size.width/2, noteDetailProgressDialogAlertView.frame.size.height-noteDetailProgressDialog.frame.size.height-20, 0.0, 0.0);
	[noteDetailProgressDialogAlertView addSubview:noteDetailProgressDialog];
	[noteDetailProgressDialog startAnimating];
	//TODO do something before dismissing it.
	[noteDetailProgressDialogAlertView dismissWithClickedButtonIndex:[noteDetailProgressDialogAlertView cancelButtonIndex] animated:YES];
	[noteDetailProgressDialogAlertView removeFromSuperview];
	
	[self.deleteAlertDialog show];
	
	
	[self performSelectorInBackground:@selector(noteCanceller) withObject:nil];
	[self performSelectorInBackground:@selector(noteSaver) withObject:nil];
}

-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)saveButtonClickAction:(UIButton *)sender {
	//TODO Implement the action
}
-(IBAction)deleteButtonClickAction:(UIButton *)sender {
	//TODO Implement the action
}

-(void) alertView: (UIAlertView *) alertView
    clickedButtonAtIndex: (NSInteger) buttonIndex {
    if (alertView == self.deleteAlertDialog) {
	    if (buttonIndex == 0) { //0 is the index of the cancel button
	    	//TODO implement the negative action
	    }   
	    if (buttonIndex == 1) { //1 is the index of the ok button
	    	//TODO implement the positive action
	    }
    }
}







-(void)noteCanceller{
	//TODO code to be executed in the background task
	//[self performSelectorOnMainThread:@selector(executeOnMainThread) withObject:nil waitUntilDone:NO];
}
-(void)noteSaver{
	//TODO code to be executed in the background task
	//[self performSelectorOnMainThread:@selector(executeOnMainThread) withObject:nil waitUntilDone:NO];
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
