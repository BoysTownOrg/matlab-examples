classdef ClickTrainTests < matlab.unittest.TestCase
    properties (Access = private)
        sampleRateHz
        clickRateHz
        durationSeconds
        level_dB_SPL
        fullScaleLevel_dB_SPL
    end
    
    methods (Test)
        function tbd(self)
            self.sampleRateHz = 9;
            self.clickRateHz = 3;
            self.durationSeconds = 2;
            self.level_dB_SPL = 75;
            self.fullScaleLevel_dB_SPL = 119;
            expectedUnattenuated = [1; 0; 0; 1; 0; 0; 1; 0; 0; 1; 0; 0; 1; 0; 0; 1; 0; 0];
            clickAmplitude = 10^((75-119)/20) / rms(expectedUnattenuated);
            self.assertEqual(...
                self.clickTrain,...
                clickAmplitude * expectedUnattenuated...
            );
        end
        
        function tbd2(self)
            self.sampleRateHz = 10;
            self.clickRateHz = 5;
            self.durationSeconds = 1;
            self.level_dB_SPL = 35;
            self.fullScaleLevel_dB_SPL = 105;
            expectedUnattenuated = [1; 0; 1; 0; 1; 0; 1; 0; 1; 0];
            clickAmplitude = 10^((35-105)/20)/rms(expectedUnattenuated);
            self.assertEqual(...
                self.clickTrain,...
                clickAmplitude * expectedUnattenuated...
            );
        end
    end
    
    methods (Access = private)
        function y = clickTrain(self)
            y = clickTrain(...
                self.sampleRateHz,...
                self.clickRateHz,...
                self.durationSeconds,...
                self.level_dB_SPL,...
                self.fullScaleLevel_dB_SPL...
            );
        end
    end
end

