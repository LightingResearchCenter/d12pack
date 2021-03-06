function obj = import(obj,FilePath,varargin)
%IMPORT Summary of this function goes here
%   Detailed explanation goes here

[~,~,ext] = fileparts(FilePath);

switch ext
    case {'.xls','.xlsx','.xlsm','.xltx','.xltm'}
        s = warning('off','MATLAB:table:ModifiedVarnames');
        if verLessThan('matlab','R2016b')
            t = readtable(FilePath,...
                'FileType','spreadsheet',...
                'ReadVariableNames',true,...
                'Basic',true);
        else
            t = readtable(FilePath,...
                'FileType','spreadsheet',...
                'ReadVariableNames',true,...
                'Basic',true,...
                'DatetimeType','exceldatenum');
        end
        warning(s);
    otherwise
        error('Bed log file must be a spreadsheet.');
end

% Select just the second and third columns
t = t(:,2:3);
% Rename the columns to ensure consistency
varNames = {'BedTime','RiseTime'};
t.Properties.VariableNames = varNames;
% If errant text was imported convert to double (unconvertable text becomes
% NaN
if iscell(t.BedTime)
    t.BedTime = str2double(t.BedTime);
end
if iscell(t.RiseTime)
    t.RiseTime = str2double(t.RiseTime);
end
% Remove empty rows
try
    idx = isnan(t.BedTime) & isnan(t.RiseTime);
catch err
    display(err.message)
end
t(idx,:) = [];

if ~isempty(t)
    if nargin > 2
        TimeZone = varargin{1};
    else
        TimeZone = 'local';
    end
    % Convert Excel serial dates to datetime
    t.BedTime = datetime(t.BedTime,'ConvertFrom','excel','TimeZone',TimeZone);
    t.RiseTime = datetime(t.RiseTime,'ConvertFrom','excel','TimeZone',TimeZone);
    
    n = numel(t.BedTime);
    for iC = n:-1:1
        obj(iC,1).BedTime = t.BedTime(iC);
        obj(iC,1).RiseTime = t.RiseTime(iC);
    end
else
    warning(['Bed log was empty or could not be imported.',char(10),FilePath]);
end

end

