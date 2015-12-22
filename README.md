# Pre-work - Tip Calculator

Tip Calculator is a tip calculator application for iOS.

Submitted by: Cassie Bub

Time spent: 9 hours spent in total

## User Stories

The following **required** functionality is complete:
* [x] User can enter a bill amount, choose a tip percentage, and see the tip and total values.

The following **optional** features are implemented:
* [x] Settings page to change the default tip percentage.
* [ ] UI animations
* [ ] Remembering the bill amount across app restarts (if <10mins)
* [ ] Using locale-specific currency and currency thousands separators.
* [x] Making sure the keyboard is always visible and the bill amount is always the first responder. This way the user doesn't have to tap anywhere to use this app. Just launch the app and start typing.

The following **additional** features are implemented:

* [x] Implemented a slider for the tip percentage
* [x] Updated settings to include max and min tip percentage
* [x] Updated UI slightly

## Video Walkthrough 

Here's a walkthrough of implemented user stories:

<img src='http://i.imgur.com/W23u2vb.gif' title='Video Walkthrough' width='239.85' height='433.55' alt='Video Walkthrough' />

GIF created with [LiceCap](http://www.cockos.com/licecap/).

## Notes

The intial implementation described in the video was pretty clear, however I had trouble getting changed fields in the settings view to update the segmented control in the first view. I solved this in a rather hacky fashion by moving data with the prepareForSegue function and creating a new push segue. Even though I had worked out the NSUserDefaults to keep data across restarts it was not saving data simpy from switching views. I did not fully understand the app's lifecycle, however I now use the ViewWillAppear function as I learned more. 
A known bugs is that user can put any number they want in the tip percent settings without regard for the others.


## License

    Copyright 2015 Cassie Bub

    Licensed under the Apache License, Version 2.0 (the "License");
    you may not use this file except in compliance with the License.
    You may obtain a copy of the License at

        http://www.apache.org/licenses/LICENSE-2.0

    Unless required by applicable law or agreed to in writing, software
    distributed under the License is distributed on an "AS IS" BASIS,
    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
    See the License for the specific language governing permissions and
    limitations under the License.
