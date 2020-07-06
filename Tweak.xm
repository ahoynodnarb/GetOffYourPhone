static BOOL timeIsUp = NO;
NSDictionary *bundleDefaults = [[NSUserDefaults standardUserDefaults]persistentDomainForName:@"com.popsicletreehouse.getoffyourphoneprefs"];
BOOL isEnabled = [[bundleDefaults objectForKey:@"isEnabled"]boolValue];
NSInteger amtOfMinutes = [([bundleDefaults objectForKey:@"amtOfMinutes"] ?: @(5)) integerValue] * 60;

@interface UIApplicationDelegate
-(void)timerCalled;
@end

%hook UIApplicationDelegate
%new
-(void)timerCalled {
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Get off your ass" message:nil preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {UIApplication *myapp = [UIApplication sharedApplication];
[myapp performSelector:@selector(suspend)]; timeIsUp = YES;}];
	[alertController addAction:confirmAction];
	[[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alertController animated:YES completion:^{}];
}
-(void)applicationDidBecomeActive:(id)arg1 {
	%orig;
	if([[NSBundle mainBundle].bundleIdentifier isEqualToString:@"com.Reddit.reddit"] && isEnabled) {
		NSTimer *timer; 
		timer = [NSTimer scheduledTimerWithTimeInterval:amtOfMinutes target:self selector:@selector(timerCalled) userInfo:nil repeats:NO];
	}
}
-(void)applicationDidEnterBackground:(id)arg1 {
	%orig;
	if(timeIsUp && isEnabled) {
	UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Get off your ass" message:nil preferredStyle:UIAlertControllerStyleAlert];
	UIAlertAction *confirmAction = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {UIApplication *myapp = [UIApplication sharedApplication];
	[myapp performSelector:@selector(suspend)]; timeIsUp = YES;}];
	[alertController addAction:confirmAction];
	[[[UIApplication sharedApplication] keyWindow].rootViewController presentViewController:alertController animated:YES completion:^{}];
	}
}
%end