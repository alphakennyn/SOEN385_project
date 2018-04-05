classdef Coordinates < matlab.mixin.SetGet
    properties
        x = 0;
        y = 0;
        z = 0;
    end
    
    methods
        function obj = Coordinates(xNew,yNew,zNew)
            obj.x = xNew;
            obj.y = yNew;
            obj.z = zNew;
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