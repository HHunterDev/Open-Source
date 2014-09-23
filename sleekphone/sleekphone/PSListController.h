@interface PSListController : UIViewController {
	NSArray *_specifiers;
}
-(id)specifiers;
-(void)viewDidLoad;
-(id)loadSpecifiersFromPlistName:(id)arg1 target:(id)arg2;
-(void)pushController:(id)arg1 animate:(BOOL)arg2;
-(void)viewWillAppear:(BOOL)arg1;
-(void)loadView;
-(void)viewDidUnload;
-(void)dismissPopoverAnimated:(BOOL)arg1;
-(void)viewDidAppear:(BOOL)arg1;
-(void)viewWillDisappear:(BOOL)arg1;
@end