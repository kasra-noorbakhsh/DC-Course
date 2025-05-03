function encoded_bits = convolutionalCoding(input_bits)
    state = '00';
    encoded_bits = '';

    for i = 1:length(input_bits)
        input_bit = input_bits(i); 

        switch state
            case '00'
                if input_bit == 0
                    encoded_bits = [encoded_bits, '00'];
                    state = '00';
                else
                    encoded_bits = [encoded_bits, '11'];
                    state = '10';
                end
            case '10'
                if input_bit == 0
                    encoded_bits = [encoded_bits, '11'];
                    state = '01';
                else
                    encoded_bits = [encoded_bits, '00'];
                    state = '11';
                end
            case '01'
                if input_bit == 0
                    encoded_bits = [encoded_bits, '10'];
                    state = '00';
                else
                    encoded_bits = [encoded_bits, '01'];
                    state = '10';
                end
            case '11'
                if input_bit == 0
                    encoded_bits = [encoded_bits, '01'];
                    state = '01';
                else
                    encoded_bits = [encoded_bits, '10'];
                    state = '11';
                end
        end
    end
end
