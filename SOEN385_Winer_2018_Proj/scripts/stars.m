function stars = generateStars() 
%Generates an array of 3 integer representing the coordination of the "stars"
starArray = [];
for index = 1:100
    starArray = [getRandomCoord starArray];
end

stars = starArray;
end

function randomCoords = getRandomCoord()
x = 179*rand(1,1);
y = 179*rand(1,1);
z = 179*rand(1,1);

randomCoords = Coordinates(x,y,z);
end

classdef Coordinates < matlab.mixin.SetGet
    properties
        x = 0;
        y = 0;
        z = 0;
    end
    
    methods
        function obj = Coordinates(x,y,z)
            obj = obj.setCoordinates(x,y,z);
        end
        function obj = setCoordinates(newX,newY,newZ)
            obj.x = newX;
            obj.y = newY;
            obj.z = newZ;
        end
    end
end