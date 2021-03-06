# nirx_finger_tapping_data

MATLAB scripts as well as a sample dataset to get people up to speed on NIRS toolbox.

### Dataset Description.
Data was collected using a NIRx NirsSport2 device with a sampling rate of 10.2Hz. The montage was a standard 16x16 motor montage that comes default with aurora. The montage is pictured below. All other information about the configuration can be found in the `.json` files in each directory. Any other questions email: trgr2496@colorado.edu.

![](imgs/motor_16.png)

All Data was taken from one participant over the period of one day. The tasks are defined and described in the table below:

| **Condition**  | **Trigger Value**  | **Description**  | **Duration** |
|---|---|---|:-:|
| Finger_tapping_right_120  | 4 | Participant taps *right* hand index finger at *120 bpm* | 45 seconds |
| Finger_tapping_left_120  | 6 | Participant taps *left* hand index finger at *120 bpm* | 45 seconds |
| Finger_tapping_both_120  | 8 | Participant taps *both* hand index finger at *120 bpm* | 45 seconds |
| Finger_tapping_right_80  | 5 | Participant taps *right* hand index finger at *80 bpm* | 45 seconds |
| Finger_tapping_left_80  | 7 | Participant taps *left* hand index finger at *80 bpm* | 45 seconds |
| Finger_tapping_both_80  | 9 | Participant taps *both* hand index finger at *80 bpm* | 45 seconds |
| Rest_Start  | 2 | Participant views fixation cross displayed in the center of the screen | 10 seconds |

*Other triggers found in the .tri file indicate: 3 = rest end. 10 = task end. Taken together this means that to extract a block of data for rest periods you will extract the data from a rest start trigger (2) to a rest end trigger (3). To extract a block of data for on task periods you would extract the data from a task start period (i.e. {4 ,6, 8, 5, 7, 9}) to the **next** task end trigger (10).*


### Script descirption.

I tried to break everything up as best I could while also showing there are alternative ways to do things. The scripts will SAVE out. Every step of the process. I have a decent amount of RAM. You may not. If you do not, perhaps saving things to the same variable will save you some headache.

Also worth noting. The GLM will take a decent amount of time. You can improve this by:
1. Not loading the whole dataset.
2. Changing the resample arg to resample to 1 Hz.