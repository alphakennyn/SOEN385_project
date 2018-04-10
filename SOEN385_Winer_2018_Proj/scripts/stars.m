function stars = stars() 
    %Path currently hardcoded. With the workspace saved, we should no
    %longer need this class
    filePath = 'C:\Users\zephi\Documents\385_Project\SOEN385_project\SOEN385_Winer_2018_Proj\Datafile_StarLocationsForTelescopProject.txt';
    fileID = fopen(filePath,'r');
    formatSpec = '%d %d';
    sizeA = [3 Inf];
    starsArr = fscanf(fileID,formatSpec,sizeA);
    fclose(fileID);
    
    starsArrRemovedRow = starsArr( [2:3] , : ); % remove first column/row from array
    starsArr2 = phitheta2azel(starsArrRemovedRow); % turn phi theta angles into azimuth elevation angles
    
    starsArrTrans = starsArr2'; % translated into 100x2 matrix
    
    %Sort array by second column
    [~,idx] = sort(starsArrTrans(:,2)); % sort just the first row
    stars = starsArrTrans(idx,:)'; % sort the whole matrix using the sort indices
    
    
    %Generates an array of 3 integer representing the coordination of the "stars"
    %{
    starArray = [];
    for index = 1:100
        starArray = [getRandomCoord starArray];
    end

    stars = starArray;
    %}
end

%{
function randomCoords = getRandomCoord()
    import pkg.Coordinates.*;
    x = 179*rand(1,1);
    y = 179*rand(1,1);
    z = 179*rand(1,1);

    randomCoords = Coordinates(x,y,z);
end
%}