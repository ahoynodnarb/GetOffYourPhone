@interface UIApplicationDelegate
-(void)timerCalled;
@end

%hook UIApplicationDelegate
%new
-(void)timerCalled {
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Get off your ass" message:nil preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {UIApplication *myapp = [UIApplication sharedApplication];
[myapp performSelector:@selector(suspend)];}];
	[alertController addAction:confirmAction];
	[[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alertController animated:YES completion:^{}];
}
-(void)applicationDidBecomeActive:(id)arg1 {
	%orig;
	if([[NSBundle mainBundle].bundleIdentifier isEqualToString:@"com.Reddit.reddit"]) {
		NSTimer *timer; 
		timer = [NSTimer scheduledTimerWithTimeInterval:20 target:self selector:@selector(timerCalled) userInfo:nil repeats:NO];
	}
	
}
-(void)applicationDidEnterBackground:(id)arg1 {
	%orig;
}
%end