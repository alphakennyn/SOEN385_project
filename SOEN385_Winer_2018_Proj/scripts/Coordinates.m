classdef Coordinates < matlab.mixin.SetGet
    properties
        x = 0;
        y = 0;
        z = 0;
    end
    
    methods
        function obj = Coordinates(x,y,z)
            obj.x = x;
            obj.y = y;
            obj.z = z;
            %obj = obj.setCoordinates(x,y,z);
        end
        %{
        function obj = setCoordinates(newX,newY,newZ)
            obj.x = newX;
            obj.y = newY;
            obj.z = newZ;
        end
        %}
    end
end