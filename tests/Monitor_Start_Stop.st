PROGRAM Monitor_Start_Stop
    VAR_EXTERNAL
        Temperature : WORD;
        LightBulb : BOOL;
        Reset : BOOL;
    END_VAR

    if Reset then
        LightBulb := false;
    end_if;

    if Temperature > 1000 then
        LightBulb := true;
    end_if;
END_PROGRAM

CONFIGURATION DefaultCfg
    VAR_GLOBAL
        Temperature AT %IW0 : WORD;
        LightBulb AT %Q0.0 : BOOL;
        Reset AT %I0.0 : BOOL;
    END_VAR

    TASK Tick(INTERVAL := t#20ms, PRIORITY := 3);

    PROGRAM Main WITH Tick : Monitor_Start_Stop;
END_CONFIGURATION

