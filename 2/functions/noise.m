function [output] = noise(input)
    output = input; 
    for i = 1:length(input)
        r = rand();
        if r < 0.01
            if input(i) == '0'
                output(i) = '1';
            else
                output(i) = '0';
            end
        end
    end
    output = strrep(output, ' ', ''); 
end
