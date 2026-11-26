
clear;
clc;
close all;

% Image filenames
imageFiles = {'studded_tire.jpeg', 'summer_tire.jpg'};

% Process both tire images
for i = 1:numel(imageFiles)

    %% 1. Read and resize image
    I = imread(imageFiles{i});
    I = imresize(I, 0.5);

    %% 2. Convert to grayscale
    if size(I, 3) == 3
        Igray = rgb2gray(I);
    else
        Igray = I;
    end

    % Convert grayscale image to double (range 0-1)
    Igray = im2double(Igray);

    %% 3. Create tire mask
    % Tire is darker than the background
    level = graythresh(Igray);

    tireMask = Igray < level;

    % Clean the tire mask
    tireMask = imclose(tireMask, strel('disk', 5));
    tireMask = imfill(tireMask, 'holes');
    tireMask = bwareaopen(tireMask, 500);

    % Keep only the largest connected object
    CCmask = bwconncomp(tireMask);

    if CCmask.NumObjects > 0
        numPixels = cellfun(@numel, CCmask.PixelIdxList);
        [~, largestIdx] = max(numPixels);

        newMask = false(size(tireMask));
        newMask(CCmask.PixelIdxList{largestIdx}) = true;

        tireMask = newMask;
    end

    %% 4. Detect bright candidate studs
    % Bright spots inside the tire may be metal studs
    brightThreshold = 0.68;

    % Erode mask slightly to avoid detecting tire edges
    innerMask = imerode(tireMask, strel('disk', 3));

    cand = (Igray > brightThreshold) & innerMask;

    %% 5. Clean candidate image
    cand = imopen(cand, strel('disk', 1));
    cand = imclose(cand, strel('disk', 1));

    % Remove very small noise
    cand = bwareaopen(cand, 3);

    %% 6. Find connected components
    CC = bwconncomp(cand);

    stats = regionprops(CC, ...
        'Area', 'Perimeter', 'Eccentricity');

    % Create final stud mask
    studMask = false(size(cand));
    studCount = 0;

    % Limits for possible studs
    minA = 4;
    maxA = 120;
    minCirc = 0.6;
    maxEcc = 0.85;

    % Check each connected component
    for k = 1:numel(stats)

        area = stats(k).Area;
        perimeter = stats(k).Perimeter;
        eccentricity = stats(k).Eccentricity;

        % Calculate circularity
        if perimeter > 0
            circularity = 4 * pi * area / (perimeter^2);
        else
            circularity = 0;
        end

        % Filter small, round components
        if area >= minA && area <= maxA && ...
                circularity >= minCirc && ...
                eccentricity <= maxEcc

            studMask(CC.PixelIdxList{k}) = true;
            studCount = studCount + 1;

        end
    end

    %% 7. Classify the tire
    % More than 10 detected studs means studded tire
    isStudded = (studCount > 10);

    %% 8. Display results
    figure('Name', imageFiles{i});

    % Original image
    subplot(1, 3, 1);
    imshow(I);
    title(sprintf('Original: %s', imageFiles{i}), ...
        'Interpreter', 'none');

    % Candidate mask
    subplot(1, 3, 2);
    imshow(cand);
    title('Candidate studs');

    % Final detection result
    subplot(1, 3, 3);
    imshow(I);
    hold on;

    visboundaries(studMask, 'Color', 'r', ...
        'LineWidth', 0.7);

    if isStudded
        title(sprintf('STUDDED TIRE (studs: %d)', ...
            studCount));
    else
        title(sprintf('NON-STUDDED TIRE (studs: %d)', ...
            studCount));
    end

    hold off;

    %% 9. Print results in Command Window
    fprintf('\nImage: %s\n', imageFiles{i});
    fprintf('Detected studs: %d\n', studCount);

    if isStudded
        fprintf('Classification: STUDDED TIRE\n');
    else
        fprintf('Classification: NON-STUDDED TIRE\n');
    end

end
