function decoded_bits = convolutionalDecoding(encoded_bits)
    trellis = [0 2; 0 2; 1 3; 1 3];  %transitaions: for example for 00 state, 00 10 their binary 0 2
    output = ['00'; '11'; '10'; '01'; '11'; '00'; '01'; '10']; %outputs: for example for 11 state, 01 10 
    num_states = 4;  

    path_metrics = inf(num_states, length(encoded_bits)/2 + 1);
    path_metrics(1, 1) = 0;
    paths = repmat({''}, num_states, length(encoded_bits)/2 + 1);

    for i = 1:2:length(encoded_bits)
        for state = 1:num_states
            for input_bit = 0:1
                next_state = trellis(state, input_bit + 1) + 1;
                encoded_pair = encoded_bits(i:i+1);
                output_pair = output(state*2-(1-input_bit), :);  % Correctly map state and input_bit to output pair
                metric = sum(encoded_pair ~= output_pair);  % Hamming distance
                new_metric = path_metrics(state, (i+1)/2) + metric;
                if new_metric < path_metrics(next_state, (i+3)/2)
                    path_metrics(next_state, (i+3)/2) = new_metric;
                    paths{next_state, (i+3)/2} = [paths{state, (i+1)/2}, num2str(input_bit)];
                end
            end
        end
    end

    % Trace back the best path
    [~, best_state] = min(path_metrics(:, end));
    decoded_bits = paths{best_state, end};

    % Convert from string of bits to numeric array
    decoded_bits = str2num(decoded_bits(:))';
end
