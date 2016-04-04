//
//  AppDelegate.m
//  World Clock
//
//  Created by Sam Xu Hudl on 29/03/2016.
//  Copyright © 2016 Hudl. All rights reserved.
//

#import "AppDelegate.h"

@interface AppDelegate () <NSDatePickerCellDelegate>

@property (weak) IBOutlet NSWindow *window;

@property (weak) IBOutlet NSDatePicker *sydneyDatePicker;
@property (weak) IBOutlet NSDatePicker *lincolnDatePicker;
@property (weak) IBOutlet NSDatePicker *LondonDatePicker;
@property (weak) IBOutlet NSDatePicker *parisDatePicker;

@property (weak) IBOutlet NSSegmentedControl *lincolnTimeZoneAbbreviation;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    
    NSLog(@"%@", [NSTimeZone knownTimeZoneNames]);
    
    [self configTimezones];
    [self setDateValues:[NSDate date]];
}

- (IBAction)nowButtonClicked:(NSButton *)sender {
    [self setDateValues:[NSDate date]];
}

- (IBAction)dateTimeChanged:(NSDatePicker *)sender {
    [self setDateValues:sender.dateValue];
}
- (IBAction)lincolnTimeZoneChanged:(NSSegmentedControl *)sender {
    
    NSString *lincoln = [self.lincolnTimeZoneAbbreviation labelForSegment:self.lincolnTimeZoneAbbreviation.selectedSegment];
    self.lincolnDatePicker.timeZone = [NSTimeZone timeZoneWithAbbreviation:lincoln];

    [self setDateValues:self.sydneyDatePicker.dateValue];
}

-(void)setDateValues:(NSDate *)date
{
    self.sydneyDatePicker.dateValue = self.lincolnDatePicker.dateValue = self.LondonDatePicker.dateValue = self.parisDatePicker.dateValue = date;

}

-(void)configTimezones
{
    NSString *lincoln = [self.lincolnTimeZoneAbbreviation labelForSegment:self.lincolnTimeZoneAbbreviation.selectedSegment];
    
    self.lincolnDatePicker.timeZone = [NSTimeZone timeZoneWithAbbreviation:lincoln];
    self.LondonDatePicker.timeZone = [NSTimeZone timeZoneWithAbbreviation:@"BST"];
    self.parisDatePicker.timeZone = [NSTimeZone timeZoneWithName:@"Europe/Paris"];
}
@end
