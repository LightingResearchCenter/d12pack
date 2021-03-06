function TF = isFedHoliday(Time)
%ISFEDHOLIDAY Summary of this function goes here
%   Detailed explanation goes here
Holidays = getHolidays;

TimeDateNum = floor(datenum(Time)); % Convert Time to datenum

TF = ismembertol(TimeDateNum,Holidays);

end


function Holidays = getHolidays
% Updated on 2016-Apr-28
% Source: https://www.opm.gov/policy-data-oversight/snow-dismissal-procedures/federal-holidays

%% 2011
h2011 = datenum( { ...
    'December 31, 2010'; ...	% New Year's Day
    'January 17, 2011'; ...     % Birthday of Martin Luther King, Jr.
    'February 21, 2011'; ...	% Washington's Birthday
    'May 30, 2011'; ...         % Memorial Day
    'July 4, 2011'; ...         % Independence Day
    'September 5, 2011'; ...	% Labor Day
    'October 10, 2011'; ...     % Columbus Day
    'November 11, 2011'; ...	% Veterans Day
    'November 24, 2011'; ...	% Thanksgiving Day
    'December 26, 2011' ...     % Christmas Day
    } );

%% 2012
h2012 = datenum( { ...
    'January 2, 2012'; ...      % New Year's Day
    'January 16, 2012'; ...     % Birthday of Martin Luther King, Jr.
    'February 20, 2012'; ...	% Washington's Birthday
    'May 28, 2012'; ...         % Memorial Day
    'July 4, 2012'; ...         % Independence Day
    'September 3, 2012'; ...	% Labor Day
    'October 8, 2012'; ...      % Columbus Day
    'November 12, 2012'; ...	% Veterans Day
    'November 22, 2012'; ...	% Thanksgiving Day
    'December 25, 2012' ...     % Christmas Day
    } );

%% 2013
h2013 = datenum( { ...
    'January 1, 2013'; ...      % New Year's Day
    'January 21, 2013'; ...     % Birthday of Martin Luther King, Jr.
    'February 18, 2013'; ...	% Washington's Birthday
    'May 27, 2013'; ...         % Memorial Day
    'July 4, 2013'; ...         % Independence Day
    'September 2, 2013'; ...	% Labor Day
    'October 14, 2013'; ...     % Columbus Day
    'November 11, 2013'; ...	% Veterans Day
    'November 28, 2013'; ...	% Thanksgiving Day
    'December 25, 2013' ...     % Christmas Day
    } );

%% 2014
h2014 = datenum( {
    'January 1, 2014'; ...      % New Year�s Day
    'January 20, 2014'; ...     % Birthday of Martin Luther King, Jr.
    'February 17, 2014'; ...	% Washington�s Birthday
    'May 26, 2014'; ...         % Memorial Day
    'July 4, 2014'; ...         % Independence Day
    'September 1, 2014'; ...	% Labor Day
    'October 13, 2014'; ...     % Columbus Day
    'November 11, 2014'; ...	% Veterans Day
    'November 27, 2014'; ...	% Thanksgiving Day
    'December 25, 2014'; ...	% Christmas Day
    } );

%% 2015
h2015 = datenum( { ...
    'January 1, 2015'; ...      % New Year�s Day
    'January 19, 2015'; ...     % Birthday of Martin Luther King, Jr.
    'February 16, 2015'; ...	% Washington�s Birthday
    'May 25, 2015'; ...         % Memorial Day
    'July 3, 2015'; ...         % Independence Day
    'September 7, 2015'; ...	% Labor Day
    'October 12, 2015'; ...     % Columbus Day
    'November 11, 2015'; ...	% Veterans Day
    'November 26, 2015'; ...	% Thanksgiving Day
    'December 25, 2015' ...     % Christmas Day
    } );

%% 2016
h2016 = datenum( { ...
    'January 1, 2016'; ...      % New Year�s Day
    'January 18, 2016'; ...     % Birthday of Martin Luther King, Jr.
    'February 15, 2016'; ...	% Washington�s Birthday
    'May 30, 2016'; ...         % Memorial Day
    'July 4, 2016'; ...         % Independence Day
    'September 5, 2016'; ...	% Labor Day
    'October 10, 2016'; ...     % Columbus Day
    'November 11, 2016'; ...	% Veterans Day
    'November 24, 2016'; ...	% Thanksgiving Day
    'December 26, 2016' ...     % Christmas Day
    } );

%% 2017
h2017 = datenum( { ...
    'January 2, 2017'; ...      % New Year�s Day
    'January 16, 2017'; ...     % Birthday of Martin Luther King, Jr.
    'February 20, 2017'; ...	% Washington�s Birthday
    'May 29, 2017'; ...         % Memorial Day
    'July 4, 2017'; ...         % Independence Day
    'September 4, 2017'; ...	% Labor Day
    'October 9, 2017'; ...      % Columbus Day
    'November 10, 2017'; ...	% Veterans Day
    'November 23, 2017'; ...	% Thanksgiving Day
    'December 25, 2017'; ...	% Christmas Day
    } );

%% 2018
h2018 = datenum( { ...
    'January 1, 2018'; ...      % New Year�s Day
    'January 15, 2018'; ...     % Birthday of Martin Luther King, Jr.
    'February 19, 2018'; ...	% Washington�s Birthday
    'May 28, 2018'; ...         % Memorial Day
    'July 4, 2018'; ...         % Independence Day
    'September 3, 2018'; ...	% Labor Day
    'October 8, 2018'; ...      % Columbus Day
    'November 12, 2018'; ...	% Veterans Day
    'November 22, 2018'; ...	% Thanksgiving Day
    'December 25, 2018' ...     % Christmas Day
    } );

%% 2019
h2019 = datenum( { ...
    'January 1, 2019'; ...      % New Year�s Day
    'January 21, 2019'; ...     % Birthday of Martin Luther King, Jr.
    'February 18, 2019'; ...	% Washington�s Birthday
    'May 27, 2019'; ...         % Memorial Day
    'July 4, 2019'; ...         % Independence Day
    'September 2, 2019'; ...	% Labor Day
    'October 14, 2019'; ...     % Columbus Day
    'November 11, 2019'; ...	% Veterans Day
    'November 28, 2019'; ...	% Thanksgiving Day
    'December 25, 2019' ...     % Christmas Day
    } );

%% 2020
h2020 = datenum( { ...
    'January 1, 2020'; ...      % New Year�s Day
    'January 20, 2020'; ...     % Birthday of Martin Luther King, Jr.
    'February 17, 2020'; ...    % Washington�s Birthday
    'May 25, 2020'; ...         % Memorial Day
    'July 3, 2020'; ...         % Independence Day
    'September 7, 2020'; ...	% Labor Day
    'October 12, 2020'; ...     % Columbus Day
    'November 11, 2020'; ...	% Veterans Day
    'November 26, 2020'; ...	% Thanksgiving Day
    'December 25, 2020' ...     % Christmas Day
    } );

%% Combine years
Holidays = vertcat(h2011,h2012,h2013,h2014,h2015,h2016,h2017,h2018,h2019,h2020);
end