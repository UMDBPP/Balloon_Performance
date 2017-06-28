
% Phone = {'btspp://10D542E12D0B'};
% TNC = {'btspp://201510195390'};
% 
% Channel_TNC = Bluetooth(TNC,3);
% fopen(Channel_TNC)
% 
% fprintf(Channel_TNC,data);
% ind = fscanf(Channel_TNC);
% 
% fclose(b);

 % Find available Bluetooth devices
          btInfo = instrhwinfo('Bluetooth')
 
        % Display the information about the first device discovered
          btInfo.RemoteNames(2)
          btInfo.RemoteIDs(2)
 
        % Construct a Bluetooth Channel object to the first Bluetooth device
          b = Bluetooth(btInfo.RemoteIDs(2), 3);
 
        % Connect the Bluetooth Channel object to the specified remote device
          fopen(b)
 
        % Write some data and query the device for an ascii string
          fprintf(b, data);
          idn = fscanf(b);
 
        % Disconnect the object from the Bluetooth device
          fclose(b);