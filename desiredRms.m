function r = desiredRms(level_dB_SPL, fullScaleLevel_dB_SPL)
r = 10^((level_dB_SPL - fullScaleLevel_dB_SPL)/20);
end