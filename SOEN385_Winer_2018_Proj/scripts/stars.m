function stars = stars() 
    %Generates an array of 3 integer representing the coordination of the "stars"
    starArray = zeros(100);
    for index = 1:100
        starArray = [getRandomCoord starArray];
    end

    stars = starArray;
end

function randomCoords = getRandomCoord()
    import pkg.Coordinates.*;
    x = 179*rand(1,1);
    y = 179*rand(1,1);
    z = 179*rand(1,1);

    randomCoords = Coordinates(x,y,z);
end
