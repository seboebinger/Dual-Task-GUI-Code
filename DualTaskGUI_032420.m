function varargout = DualTaskGUI_032420(varargin)
% DUALTASKGUI_032420 MATLAB code for DualTaskGUI_032420.fig
%      DUALTASKGUI_032420, by itself, creates a new DUALTASKGUI_032420 or raises the existing
%      singleton*.
%
%      H = DUALTASKGUI_032420 returns the handle to a new DUALTASKGUI_032420 or the handle to
%      the existing singleton*.
%
%      DUALTASKGUI_032420('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DUALTASKGUI_032420.M with the given input arguments.
%
%      DUALTASKGUI_032420('Property','Value',...) creates a new DUALTASKGUI_032420 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DualTaskGUI_032420_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DualTaskGUI_032420_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DualTaskGUI_032420

% Last Modified by GUIDE v2.5 24-Mar-2020 10:03:18

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @DualTaskGUI_032420_OpeningFcn, ...
                   'gui_OutputFcn',  @DualTaskGUI_032420_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before DualTaskGUI_032420 is made visible.
function DualTaskGUI_032420_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DualTaskGUI_032420 (see VARARGIN)

% Choose default command line output for DualTaskGUI_032420
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DualTaskGUI_032420 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DualTaskGUI_032420_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in Load Set 1.
function LoadOpSet1(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    handles.UserData = load('Case 1 Operation Set 24-Mar-2020.mat');
    handles.n   =   handles.UserData.n_Case1;
    handles.num = handles.UserData.num_Case1;
    handles.ops = handles.UserData.ops_Case1;
    
    guidata(hObject, handles)
    


% --- Executes on button press in Load Set 2.
function LoadOpSet2(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    load('Case 2 Operation Set 24-Mar-2020.mat')
    n =     n_Case2;
    num = num_Case2;
    ops = ops_Case2;


% --- Executes on button press in Load Set 3.
function LoadOpSet3(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    load('Case 3 Operation Set 24-Mar-2020.mat')
    n =     n_Case3;
    num = num_Case3;
    ops = ops_Case3;


% --- Executes on button press in pushbutton4.
function StartButton(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

%% Operation Set Display
% Displays plots of the operation for participants to see during experiment
% This code will be adapted to be used in the GUI when the GUI is generated

%What should be able to be varied by users in the GUI
patID = handles.patID
pausetime = handles.displaytime; %length of time between each math calculation
trialnum = handles.trialnum; %number of trials to be performed
opnum = handles.opnum;
clc

%Load operation set
    n =     handles.n;
    num = handles.num;
    ops = handles.ops;


i = 0; %iteration counter
instructions = {'Memorize the result of the previous'; 'calculation and carry it over to the next'}; %initial instructions for participant

fig1 = figure(1);
ax1 = plot([0 1],[0 1],'k');
title('','Color','k')
set(gcf,'WindowState','fullscreen','MenuBar','none','ToolBar','none','Color','k')
set(gca,'Color','k','XColor','k','YColor','k','FontSize',48)%,'visible','off','xlim',[0 2],'ylim',[0 2],'Position',[0 0 1 1])
instruct_txt = text(-0.1,0.5,instructions,'Color','w','FontSize',48);

txt1 = text(0.05,0.8,'','Color','w','FontSize',80);
txt2 = text(0.42,0.5,'','Color','w','FontSize',150);
txt3 = text(0.42,0.5,'','Color','w','FontSize',150); %What participant will see
        

disp({'Paused'; 'Relay instructions to participant';'Then click any button to continue'})
pause
clc

for iter = 1:trialnum
    
    while i <= opnum
        
        i = i+1;
        
        %Display instructions and the starting value
        if i==1
            delete(instruct_txt)
%             txt1 = text(0.05,0.8,'Starting Number is ','Color','w','FontSize',80);
            set(txt1,'String','Starting Number is ','Color','w','FontSize',80)
%             txt2 = text(0.42,0.5,num2str(n(iter,i)),'Color','w','FontSize',150);
            set(txt2,'String',num2str(n(iter,i)),'Color','w','FontSize',150)
            
            disp(['Trial ' num2str(iter)])
            disp(['Starting Number is ' num2str(n(iter,i))])
            pause(pausetime)
            set(txt1,'String','','Color','w','FontSize',150)
            set(txt2,'String','','Color','w','FontSize',150)
        end
        
        %Break if 10 operations are generated
        if i > opnum
            break
        end
        
        %Display the operation
        disp(['Operation ' num2str(i) ': ' num2str(n(iter,i)) ' ' ops(iter,i) ' ' num2str(num(iter,i)) ' = ' num2str(n(iter,i+1))]) %Full Operation
%         txt3 = text(0.42,0.5,[ops(iter,i) num2str(num(iter,i))],'Color','w','FontSize',150); %What participant will see
        set(txt3,'String',[ops(iter,i) num2str(num(iter,i))],'Color','w','FontSize',150)
        pause(pausetime)
%         delete(txt3)
        pause(0.2) %Pause between operations
        
    end
    i = 0; %reset iteration counter for while loop
    if iter < trialnum
        disp('Press any button to continue to next trial')
        pause
        clc
    else
        disp('End of trials')
        end_txt = text(0.35,0.5,'You did it!','Color','w','FontSize',48);
        break
    end
end


function patID_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double

handles.patID = get(hObject,'String');
guidata(hObject, handles)





% --- Executes during object creation, after setting all properties.
function patID_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

handles.patID = get(hObject,'String');
guidata(hObject, handles)



function opnum_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function opnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% handles.opnum = string2num(get(hObject,'String'));
handles.opnum = 3;
guidata(hObject, handles)


function trialnum_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double


% --- Executes during object creation, after setting all properties.
function trialnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% handles.opnum = string2num(get(hObject,'String'));
handles.trialnum = 3;
guidata(hObject, handles)


% --- Executes on slider movement.
function displaytime_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.displaytime = get(hObject,'Value');
guidata(hObject, handles)

% --- Executes during object creation, after setting all properties.
function displaytime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

% handles.opnum = string2num(get(hObject,'String'));
handles.displaytime = 3;
guidata(hObject, handles)


% --- Executes on button press in checkbox1.
function checkbox1_Callback(hObject, eventdata, handles)
% hObject    handle to checkbox1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of checkbox1
