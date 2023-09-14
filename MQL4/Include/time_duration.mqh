class TimeDuration{
public:
    TimeDuration(const string fn_name = "") : _fn_name(fn_name){
        _start = GetMicrosecondCount();
    }
    ~TimeDuration(){
        _end = GetMicrosecondCount();
        ShowResult();
    }
private:
    void ShowResult() const{
        Print(_fn_name+" Timer: " + DoubleToString((_end - _start)/1000000, 2) + " sec.");
    }

private:
    ulong _start, _end;
    string _fn_name;
};

#define TIMER TimeDuration timer##__LINE__(__FUNCTION__);
#define TIMER_HINT(hint) TimeDuration timer##__LINE__(hint);