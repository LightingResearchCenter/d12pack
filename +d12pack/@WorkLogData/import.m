function obj = import(obj,FilePath,varargin)
%IMPORT Summary of this function goes here
%   Detailed explanation goes here

[~,~,ext] = fileparts(FilePath);

switch ext
    case {'.xls','.xlsx','.xlsm','.xltx','.xltm'}
        s = warning('off','MATLAB:table:ModifiedVarnames');
        t = readtable(FilePath,...
            'FileType','spreadsheet',...
            'ReadVariableNames',true,...
            'Basic',true);
        warning(s);
    otherwise
        error('Work log file must be a spreadsheet.');
end

% Select just the second, third, and fourth columns
t = t(:,2:4);
% Rename the columns to ensure consistency
varNames = {'Workstation','StartTime','EndTime'};
t.Properties.VariableNames = varNames;
% If errant text was imported convert to double (unconvertable text becomes
% NaN
if iscell(t.StartTime)
    t.StartTime = str2double(t.StartTime);
end
if iscell(t.EndTime)
    t.EndTime = str2double(t.EndTime);
end

if nargin > 2
    TimeZone = varargin{1};
else
    TimeZone = 'local';
end

% Remove empty rows
if isnumeric(t.StartTime)
    idxS = isnan(t.StartTime);
elseif isdatetime(t.StartTime)
    idxS = isnat(t.StartTime);
end
if isnumeric(t.EndTime)
    idxE = isnan(t.EndTime);
elseif isdatetime(t.EndTime)
    idxE = isnat(t.EndTime);
end
idx = idxS & idxE;
t(idx,:) = [];

if ~isempty(t)
    if isnumeric(t.StartTime)
        % Convert Excel serial dates to datetime
        t.StartTime = datetime(t.StartTime,'ConvertFrom','excel','TimeZone',TimeZone);
    elseif isdatetime(t.StartTime)
        % Set time zone
        t.StartTime.TimeZone = TimeZone;
    end
    
    if isnumeric(t.EndTime)
        % Convert Excel serial dates to datetime
        t.EndTime = datetime(t.EndTime,'ConvertFrom','excel','TimeZone',TimeZone);
    elseif isdatetime(t.EndTime)
        % Set time zone
        t.EndTime.TimeZone = TimeZone;
    end
    
    if isnumeric(t.Workstation)
        t.Workstation = num2cell(t.Workstation);
    end
    
    obj = d12pack.WorkLogData(t.StartTime(:),t.EndTime(:),false,t.Workstation(:));
else
    warning(['Work log was empty or could not be imported.',char(10),FilePath]);
end


end

