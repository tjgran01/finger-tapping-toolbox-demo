% Making demographics. NOTE: This is the simpliest way - but is reliaint on
% what was put in Aurora. There are ways to add to this table if you have
% demographics from addition aources. I.e. surveys. I opt for doing this in
% python - as I find it to be less obtuse that MATLAB.

demographics = nirs.createDemographicsTable(raw);

% Okay, now we start getting into the meat of how the toolbox generally
% operates.


% First - let's yoink out all files that DONT have stim info - as they are
% useless to us.

j = nirs.modules.RemoveStimless( );

% mmmkay - let's also rename our stims so they aren't, like, super obtuse.

j = nirs.modules.RenameStims( j );

j.listOfChanges = {'stim_channel2' 'Rest_Start';
                   'stim_channel3' 'Rest_End';
                   'stim_channel4' 'Finger_tapping_right_120';
                   'stim_channel5' 'Finger_tapping_right_80';
                   'stim_channel6' 'Finger_tapping_left_120';
                   'stim_channel7' 'Finger_tapping_left_80';
                   'stim_channel8' 'Finger_tapping_both_120';
                   'stim_channel9' 'Finger_tapping_both_80';
                   'stim_channel10' 'Task_End'};

stimsChanged = j.run(raw);

% Quick clever thing that can be done here. Our conditions can be broken
% down in more interesting ways. Say we didn't care about tempo (i.e. 120 v
% 80) and only care about hand condition (or vise versa).

% defaultConditions = {'stim_channel2', 'Rest_Start';
%                      'stim_channel3', 'Rest_End';
%                      'stim_channel4', 'right_120';
%                      'stim_channel5', 'right_80';
%                      'stim_channel6', 'left_120';
%                      'stim_channel7', 'left_80';
%                      'stim_channel8', 'both_120';
%                      'stim_channel9', 'both_80';
%                      'stim_channel10', 'Task_End';
%                    }

% handStimChanges = {'stim_channel2', 'Rest_Start';
%                    'stim_channel3', 'Rest_End';
%                    'stim_channel4', '_right';
%                    'stim_channel5', '_right';
%                    'stim_channel6', '_left';
%                    'stim_channel7', '_left';
%                    'stim_channel8', '_both';
%                    'stim_channel9', '_both';
%                    'stim_channel10', 'Task_End';
%                    }
%
% tempoStimChanges = {'stim_channel2', 'Rest_Start';
%                    'stim_channel3', 'Rest_End';
%                    'stim_channel4', '_120';
%                    'stim_channel5', '_80';
%                    'stim_channel6', '_120';
%                    'stim_channel7', '_80';
%                    'stim_channel8', '_120';
%                    'stim_channel9', '_80';
%                    'stim_channel10', 'Task_End';
%                    }

stim=nirs.createStimulusTable(stimsChanged);

% change duration of stims --- uncomplicated.
stimsChanged=nirs.design.change_stimulus_duration(stimsChanged, 'Rest_Start', 0);
stimsChanged=nirs.design.change_stimulus_duration(stimsChanged, 'Rest_End', 0);
stimsChanged=nirs.design.change_stimulus_duration(stimsChanged, 'right_120', 45);
stimsChanged=nirs.design.change_stimulus_duration(stimsChanged, 'right_80', 45);
stimsChanged=nirs.design.change_stimulus_duration(stimsChanged, 'left_120', 45);
stimsChanged=nirs.design.change_stimulus_duration(stimsChanged, 'left_80', 45);
stimsChanged=nirs.design.change_stimulus_duration(stimsChanged, 'both_120', 45);
stimsChanged=nirs.design.change_stimulus_duration(stimsChanged, 'both_80', 45);
stimsChanged=nirs.design.change_stimulus_duration(stimsChanged, 'Task_End', 0);

% change duration of stims --- complicated.
