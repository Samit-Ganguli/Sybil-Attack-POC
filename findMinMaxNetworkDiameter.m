function [maxNetworkDiameter] = findMinMaxNetworkDiameter(networkData, numberOfNodes)
networkData = networkData.';
networkData(networkData == 0) = 1;
maxNetworkDiameter = 0;
currentRouteLength = 0;
for i = 1:numberOfNodes
    for j = 1:9
        currentRouteLength = 0;
        touchedNode = (i); 
        currentGenesisNode = networkData(i,:);
        currentNode = currentGenesisNode(j);
        currentRouteLength = currentRouteLength + 1;
        touchedNode = [touchedNode; currentNode];
        loop = false;
        while(~loop)
            nextRoutePath = networkData(currentNode,:);
            nextNode = nextRoutePath(j);
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
            
        