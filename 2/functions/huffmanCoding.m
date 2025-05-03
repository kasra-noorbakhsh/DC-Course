function encoded_string = huffmanCoding(input_string)
    load('data\freq.mat');
    
    alphabet = 'abcdefghijklmnopqrstuvwxyz';
    
    % Convert the alphabet to a cell array of strings
    alphabet_cells = cellstr(alphabet');
    
    % Build the Huffman tree and dictionary
    [dict, ~] = huffmandict(alphabet_cells, freq);
    
    encoded_bits = ''; 
    
    for i = 1:length(input_string)
        letter = input_string(i);
        idx = find(alphabet == letter);
        % Get the Huffman code for the letter
        huffman_code = dict{idx, 2};
        encoded_bits = [encoded_bits, huffman_code];
    end
    
    encoded_string = encoded_bits;
end
