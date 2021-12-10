function [ledger] = create_legend(n)
    ledger = cell(n,1);
    
    for i = 1:n
        ledger{i} = sprintf('Robot %i',i);
    end 
    
end