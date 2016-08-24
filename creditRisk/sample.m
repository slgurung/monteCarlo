function v = sample(p)

    sampleArray = zeros(1, 1000);
    p = int32(p * 1000);
    
    sampleArray(1, 1:p) = 1;
    suffle = randperm(1000);
    sampleArray = sampleArray(suffle);

    v = randsample(sampleArray, 1);