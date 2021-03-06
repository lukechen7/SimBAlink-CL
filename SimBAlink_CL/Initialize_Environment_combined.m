%% Initialization for selected CDTS Profiles (velocity and distance)
    % (add new entries in nested conditonal below)
        if CDTS_Profile == 0 
            %set to zero when time-dependant velocity input selected
            %Skip loading CDTS profile so DRIV_Cycle is not overwritten
        else 
            
%%% -----------ADD NEW ENTRIES HERE--------------------------------
%%% ---------------------------------------------------------------            
            if CDTS_Profile == 1
               load CDTS_Profiles/PPIHC_CDTS_1g;

            elseif CDTS_Profile == 2
                 load CDTS_Profiles/CRP_CDTS_1g;

            else
            end
%%% ---------------------------------------------------------------
%%% --------------------------------------------------------------- 
       
        %Add fake t_cyc vector so simulation does not error on load
        t_cyc = d_cyc;
        end
       

%% Initialization for selected driving cycles (velocity and time)
    % (add new entries in nested conditonal below)

        if DRIV_Cycle == 0 
            %set to zero when distance-dependant velocity input selected
            %Skip loading DRIV_Cycle so CDTS_Profile is not overwritten
        
        else            
%%% -----------ADD NEW ENTRIES HERE--------------------------------
%%% ---------------------------------------------------------------
            if DRIV_Cycle == 1
               load Velocity_Profiles/PPIHC_2017_RW3x2;

            elseif DRIV_Cycle == 2
                 load Velocity_Profiles/FUDS;

            elseif DRIV_Cycle == 3
                load Velocity_Profiles/FUDS_fast;

            elseif DRIV_Cycle == 4
                load Velocity_Profiles/WLTP;

            elseif DRIV_Cycle == 5
                load Velocity_Profiles/US06;

            elseif DRIV_Cycle == 6
                load Velocity_Profiles/US06_City_Cycle;

            elseif DRIV_Cycle == 7
                load Velocity_Profiles/US06_Highway_Cycle;

            elseif DRIV_Cycle == 8
               load Velocity_Profiles/Artemis_urban;

            elseif DRIV_Cycle == 9
               load Velocity_Profiles/Artemis_extra_urban;

            elseif DRIV_Cycle == 10
               load Velocity_Profiles/Artemis_highway;

            elseif DRIV_Cycle == 11
               load Velocity_Profiles/NEDC;

            elseif DRIV_Cycle == 12
               load Velocity_Profiles/FHDS;

            else
            end
%%% ---------------------------------------------------------------
%%% ---------------------------------------------------------------
        
        %Add fake d_cyc vector so simulation does not error on load
        d_cyc = t_cyc;
        end

%% Specify simulation temination points
%       Stoptime = length(v_cyc);
        timeStep = t_cyc(2) - t_cyc(1);
        if DRIV_acc_flag ==0
           Stoptime = length(v_cyc)*iteration*timeStep;
        else
           Stoptime = 60;
        end
        
        %set simulation stop distance
        Stopdistance = d_cyc(length(d_cyc)-1);
        
%% Initialization for Selecting Road Grade Conditions (Alpha)
%grade angle in degrees (positive angle correponds to ascend)
 
    Road_Grade = Grade_Value;
    
%% Initialization for Setting Ambient Temperature
%grade angle in degrees (positive angle correponds to ascend)
 
    ambTemp_K = ambTemp_C + 273.5;

