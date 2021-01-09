function [M] = processFolder(filePattern)
    theFiles = dir(filePattern);

    cols = descriptorsExtranction(zeros(1,1,3));
    cols = length(fieldnames(cols)) * size(cols, 2) + 1;
    
    M = zeros(length(theFiles), cols);

    parfor k = 1 : length(theFiles)
        baseFileName = theFiles(k).name;
        fullFileName = fullfile(theFiles(k).folder, baseFileName);

        disp(fullFileName)

        I = imread(fullFileName);

        desc = descriptorsExtranction(I);
        desc = reshape(cell2mat(struct2cell(desc)), 1, []);
        
        splited = split(fullFileName, ["/", "."]);
        desc(end+1) = str2double(cell2mat(splited(end-3)));

        M(k,:) = desc;
    end
end

