function [M] = processFolder(filePattern)
    theFiles = dir(filePattern);

    M = table();

    Y = [];

    parfor k = 1 : length(theFiles)
        baseFileName = theFiles(k).name;
        fullFileName = fullfile(theFiles(k).folder, baseFileName);

        disp(fullFileName)

        I = imread(fullFileName);

        desc = descriptorsExtranction(I);
        desc = flattenshit(desc);
        desc = struct2table(desc, 'AsArray', true);
        M = [M; desc];

        splited = split(fullFileName, ["/", "."]);
        Y = [Y; str2double(cell2mat(splited(end-3)))];
    end
    M.Sign = Y;
end
