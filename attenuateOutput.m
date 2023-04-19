function attenuated_value = attenuateOutput(norm_value, threshold_value, power)
    % This function assumes that value is normalized 0 to 1
    if(norm_value < threshold_value)
        attenuated_value = ((norm_value/threshold_value)^power)*threshold_value;
    else
        attenuated_value = 1-((((1-norm_value)/(1-threshold_value))^power)*(1-threshold_value));
    end
end