function y = gatedClick(...
    sampleRateHz,...
    clickDurationSeconds,...
    gapDurationSeconds,...
    level_dB_SPL,...
    fullScaleLevel_dB_SPL...
)
y = zeroStimulus(totalSamples(sampleRateHz, clickDurationSeconds, gapDurationSeconds));
clickAmplitude = ...
    desiredRms(level_dB_SPL, fullScaleLevel_dB_SPL) / ...
    unattenuatedRms(sampleRateHz, clickDurationSeconds, gapDurationSeconds);
y(firstClickIndices(sampleRateHz, clickDurationSeconds)) = clickAmplitude;
y(secondClickIndices(sampleRateHz, clickDurationSeconds, gapDurationSeconds)) = clickAmplitude;
end

function N = totalSamples(sampleRateHz, clickDurationSeconds, gapDurationSeconds)
N = ...
    gapSamples(sampleRateHz, gapDurationSeconds) + ...
    bothClickSamples(sampleRateHz, clickDurationSeconds);
end

function N = gapSamples(rateHz, seconds)
N = samples(rateHz, seconds);
end

function N = bothClickSamples(rateHz, seconds)
N = 2*clickSamples(rateHz, seconds);
end

function N = clickSamples(rateHz, seconds)
N = samples(rateHz, seconds);
end

function y = unattenuatedRms(sampleRateHz, clickDurationSeconds, gapDurationSeconds)
y = clickSignalRms(...
    bothClickSamples(sampleRateHz, clickDurationSeconds),...
    totalSamples(sampleRateHz, clickDurationSeconds, gapDurationSeconds)...
);
end

function i = firstClickIndices(sampleRateHz, clickDurationSeconds)
i = 1:clickSamples(sampleRateHz, clickDurationSeconds);
end

function i = secondClickIndices(sampleRateHz, clickDurationSeconds, gapDurationSeconds)
i = ...
    (1-clickSamples(sampleRateHz, clickDurationSeconds):0) + ...
    totalSamples(sampleRateHz, clickDurationSeconds, gapDurationSeconds);
end