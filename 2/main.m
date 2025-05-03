addpath('functions');

% num_trials = 100;
% num_matches = 0;
input_string = 'kasra';

encoded_string = huffmanCoding(input_string);
encoded_numeric = double(encoded_string);  % Convert the characters to their ASCII numeric values
disp('Huffman Encoded String:');
disp(encoded_numeric);
    
conv_encoded = convolutionalCoding(encoded_numeric);
disp('Convolutional Encoded String:');
disp(conv_encoded);

noisy_encoded = noise(conv_encoded);
disp('Noisy String:');
disp(noisy_encoded);

decoded_bits = convolutionalDecoding(noisy_encoded);
disp('Convolutional Decoded string:');
disp(decoded_bits);

decoded_string = huffmanDecoding(decoded_bits);
disp('Huffman Decoded String:');
disp(decoded_string);

disp('Input String:');
disp(input_string);

for i = 1:num_trials
    encoded_string = huffmanCoding(input_string);
    encoded_numeric = double(encoded_string); 
    conv_encoded = convolutionalCoding(encoded_numeric);
    noisy_encoded = noise(conv_encoded);
    decoded_bits = convolutionalDecoding(noisy_encoded);
    decoded_string = huffmanDecoding(decoded_bits);
    if strcmp(input_string, decoded_string)
        num_matches = num_matches + 1;
    end
end

% success_rate = (num_matches / num_trials) * 100;
% disp(['Total Trials: ', num2str(num_trials)]);
% disp(['Successful Decodes: ', num2str(num_matches)]);
% disp(['Success Rate (%): ', num2str(success_rate)]);
