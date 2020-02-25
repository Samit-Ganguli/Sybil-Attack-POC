function [maxNetworkDiameter] = findMinMaxRoundRobinNetworkDiameter(networkData)
maxNetworkDiameter = 0;
currentRouteLength = 0;
for i = 1:9
    for j = 1:10000
        currentRouteLength = 0;
        touchedNode = (j); 
        currentGenesisNode = networkData(j,:);
        currentNode = currentGenesisNode(i);
        currentRouteLength = currentRouteLength + 1;
        touchedNode = [touchedNode; currentNode];
        loop = false;
        while(~loop)
            nextRoutePath = networkData(currentNode,:);
            nextNode = nextRoutePath(i);
            if(ismember(nextNode, touchedNode))
                loop = true;
            else
                touchedNode = [touchedNode; nextNode];
                currentRouteLength = currentRouteLength + 1;
                currentNode = nextNode;
            end
        end
        if(maxNetworkDiameter < currentRouteLength)
            maxNetworkDiameter = currentRouteLength;
            
        end
    end
end