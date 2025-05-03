function decoded_string = huffmanDecoding(encoded_string)
    load('data\freq.mat'); 
    
    alphabet = 'abcdefghijklmnopqrstuvwxyz';
    
    alphabet_cells = cellstr(alphabet');
    
    [dict, ~] = huffmandict(alphabet_cells, freq);
    
    % Create a map of Huffman codes to letters for easy lookup
    huffman_map = containers.Map();
    
    % Ensure dict{:, 2} is treated as strings for map keys
    for i = 1:length(dict)
        huffman_code = dict{i, 2};
        if ischar(huffman_code)  % If it's already a string, we keep it
            huffman_map(huffman_code) = dict{i, 1};  % Map code to letter
        else  % In case it's not a string, convert it
            huffman_map(char(huffman_code)) = dict{i, 1};  % Map code to letter
        end
    end
    
    decoded_string = '';
    current_bits = '';

    for i = 1:length(encoded_string)
        current_bits = [current_bits, encoded_string(i)];
        
        % If current_bits matches a Huffman code, decode it
        if isKey(huffman_map, current_bits)
            decoded_string = [decoded_string, huffman_map(current_bits)];  % Add corresponding letter
            current_bits = '';  % Reset current_bits for next code
        end
    end
end
