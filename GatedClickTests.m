classdef GatedClickTests < matlab.unittest.TestCase
    properties (Access = private)
        sampleRateHz
        clickDurationSeconds
        gapDurationSeconds
        level_dB_SPL
        fullScaleLevel_dB_SPL
    end
    
    methods (Test)
        function tbd(self)
            self.sampleRateHz = 3;
            self.clickDurationSeconds = 1;
            self.gapDurationSeconds = 2;
            self.level_dB_SPL = 75;
            self.fullScaleLevel_dB_SPL = 119;
            expectedUnattenuated = [1; 1; 1; 0; 0; 0; 0; 0; 0; 1; 1; 1];
            clickAmplitude = 10^((75-119)/20) / rms(expectedUnattenuated);
            self.assertEqual(...
                self.gatedClick,...
                clickAmplitude * expectedUnattenuated...
            );
        end
        
        function tbd2(self)
            self.sampleRateHz = 5;
            self.clickDurationSeconds = 0.2;
            self.gapDurationSeconds = 1;
            self.level_dB_SPL = 45;
            self.fullScaleLevel_dB_SPL = 103;
            expectedUnattenuated = [1; 0; 0; 0; 0; 0; 1];
            clickAmplitude = 10^((45-103)/20) / rms(expectedUnattenuated);
            self.assertEqual(...
                self.gatedClick,...
                clickAmplitude * expectedUnattenuated...
            );
        end
    end
    
    methods (Access = private)
        function y = gatedClick(self)
            y = gatedClick(...
                self.sampleRateHz,...
                self.clickDurationSeconds,...
                self.gapDurationSeconds,...
                self.level_dB_SPL,...
                self.fullScaleLevel_dB_SPL...
            );
        end
    end
end

