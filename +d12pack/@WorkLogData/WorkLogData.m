classdef WorkLogData
    %WORKLOGDATA Summary of this class goes here
    %   Detailed explanation goes here
    
    properties % (Access = public)
        Workstation cell = {''}       %
        IsFixed     logical = false %
    end
    
    properties (Dependent)
        StartTime %
        EndTime   %
    end
    
    properties (Access = private)
        PrivateStartTime_datetime datetime = datetime.empty(1,0)
        PrivateEndTime_datetime   datetime = datetime.empty(1,0)
        
        PrivateStartTime_duration duration = duration.empty(1,0)
        PrivateEndTime_duration   duration = duration.empty(1,0)
    end
    
    % Internal methods
    methods % (Access = public)
        % Class constructior
        function obj = WorkLogData(StartTime,EndTime,varargin)
            if nargin >= 1
                switch nargin
                    case 3
                        IsFixed = varargin{1};
                        Workstation = '';
                    case 4
                        IsFixed = varargin{1};
                        Workstation = varargin{2};
                    otherwise
                        IsFixed = false;
                        Workstation = '';
                end
                obj.IsFixed = IsFixed;
                
                nStart = numel(StartTime);
                nEnd   = numel(EndTime);
                if ~iscell(Workstation)
                    Workstation = repmat({Workstation},size(StartTime));
                end
                nWorkstation = numel(Workstation);
                if isequal(nStart,nEnd,nWorkstation)
                    if nStart > 1
                        for iObj = nStart:-1:1
                            obj(iObj,1) = d12pack.WorkLogData(StartTime(iObj), EndTime(iObj), IsFixed, Workstation(iObj));
                        end
                    else
                        obj.StartTime   = StartTime;
                        obj.EndTime     = EndTime;
                        obj.Workstation = Workstation;
                    end
                else
                    error('Input must be of equal size.')
                end
            end
        end % End of class constructor method
        
        % Set StartTime
        function obj = set.StartTime(obj,StartTime)
            if  isduration(StartTime)
                obj.PrivateStartTime_duration = StartTime;
                % Clear unused property
                obj.PrivateStartTime_datetime = datetime.empty(1,0);
                % Change mode to fixed
                obj.IsFixed = true;
            elseif isdatetime(StartTime)
                obj.PrivateStartTime_datetime = StartTime;
                % Clear unused property
                obj.PrivateStartTime_duration = duration.empty(1,0);
                % Change mode to NOT fixed
                obj.IsFixed = false;
            else
                error('StartTime must be a duration or datetime.');
            end
        end % End of set StartTime
        % Get StartTime
        function StartTime = get.StartTime(obj)
            if obj.IsFixed
                StartTime = obj.PrivateStartTime_duration;
            else
                StartTime = obj.PrivateStartTime_datetime;
            end
        end % End of get StartTime
        
        % Set EndTime
        function obj = set.EndTime(obj,EndTime)
            if isduration(EndTime)
                obj.PrivateEndTime_duration = EndTime;
                % Clear unused property
                obj.PrivateEndTime_datetime = datetime.empty(1,0);
                % Change mode to fixed
                obj.IsFixed = true;
            elseif isdatetime(EndTime)
                obj.PrivateEndTime_datetime = EndTime;
                % Clear unused property
                obj.PrivateEndTime_duration = duration.empty(1,0);
                % Change mode to NOT fixed
                obj.IsFixed = false;
            else
                error('EndTime must be a duration or datetime.');
            end
        end % End of set EndTime
        % Get EndTime
        function EndTime = get.EndTime(obj)
            if obj.IsFixed
                EndTime = obj.PrivateEndTime_duration;
            else
                EndTime = obj.PrivateEndTime_datetime;
            end
        end % End of get StartTime
        
    end
    
    % External methods
    methods % (Access = public)
        t = table(obj)
        disp(obj)
        
        obj = import(obj,FilePath,varargin)
        TF = isAtWork(obj,Time)
        TF = isWorkDay(obj,Time)
    end
    
    methods (Static) % (Access = public)
        TF = isFedHoliday(Time)
    end
    
end

