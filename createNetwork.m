function [] = createNetwork(numberOfNodes)
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

outgoingTable = zeros(numberOfNodes, 8);
incomingTable = zeros(numberOfNodes, 117);
for i = 1:numberOfNodes
    currentRow = outgoingTable(i,:);
    for j = 1:8
        connectingNode = randi([1 numberOfNodes]);
        currentRow(j) = connectingNode;
        outgoingTable(i,:) = currentRow;
        incomingTable = updateIncomingNode(connectingNode, incomingTable, i);
    end
end
disp(incomingTable);
disp(outgoingTable);
end

