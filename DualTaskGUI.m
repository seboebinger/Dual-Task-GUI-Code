%%
function varargout = DualTaskGUI(varargin)
% DUALTASKGUI MATLAB code for DualTaskGUI.fig
%      DUALTASKGUI, by itself, creates a new DUALTASKGUI or raises the existing
%      singleton*.
%
%      H = DUALTASKGUI returns the handle to a new DUALTASKGUI or the handle to
%      the existing singleton*.
%
%      DUALTASKGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in DUALTASKGUI.M with the given input arguments.
%
%      DUALTASKGUI('Property','Value',...) creates a new DUALTASKGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before DualTaskGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to DualTaskGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help DualTaskGUI

% Last Modified by GUIDE v2.5 24-Mar-2020 15:14:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
    'gui_Singleton',  gui_Singleton, ...
    'gui_OpeningFcn', @DualTaskGUI_OpeningFcn, ...
    'gui_OutputFcn',  @DualTaskGUI_OutputFcn, ...
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


% --- Executes just before DualTaskGUI is made visible.
function DualTaskGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to DualTaskGUI (see VARARGIN)

% Choose default command line output for DualTaskGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes DualTaskGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = DualTaskGUI_OutputFcn(hObject, eventdata, handles)
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
handles.UserData = load('Case 2 Operation Set 24-Mar-2020.mat');
handles.n   =   handles.UserData.n_Case2;
handles.num = handles.UserData.num_Case2;
handles.ops = handles.UserData.ops_Case2;

guidata(hObject, handles)


% --- Executes on button press in Load Set 3.
function LoadOpSet3(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
handles.UserData = load('Case 3 Operation Set 24-Mar-2020.mat');
handles.n   =   handles.UserData.n_Case3;
handles.num = handles.UserData.num_Case3;
handles.ops = handles.UserData.ops_Case3;

guidata(hObject, handles)


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

for iter = 1:trialnum
    
    %Display instructions for the first trial
    if iter == 1
            instructions = {'Memorize the result of the previous'; 'calculation and carry it over to the next'}; %initial instructions for participant
            
            fig1 = figure(1);
            ax1 = plot([0 1],[0 1],'k');
            title('','Color','k')
            set(gcf,'WindowState','fullscreen','MenuBar','none','ToolBar','none','Color','k')
            set(gca,'Color','k','XColor','k','YColor','k','FontSize',48)%,'visible','off','xlim',[0 2],'ylim',[0 2],'Position',[0 0 1 1])
            instruct_txt = text(-0.1,0.5,instructions,'Color','w','FontSize',48);
            
            txt1 = text(0.05,0.8,'','Color','w','FontSize',80); %starting number text
            txt2 = text(0.42,0.5,'','Color','w','FontSize',150); %starting number value
            txt3 = text(0.42,0.5,'','Color','w','FontSize',150); %operations (what the participant will see)
            
            
            disp({'Paused'; 'Relay instructions to participant';'Then click any button to continue'})
            pause
            clc
    end
    
    while i <= opnum
        
        i = i+1;
        
        %Display the starting value
        if i==1     
            set(instruct_txt,'String','')
            set(txt1,'String','Starting Number is ','Color','w','FontSize',80)
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
        set(txt3,'String',[ops(iter,i) num2str(num(iter,i))],'Color','w','FontSize',150)
        pause(pausetime)
        pause(0.2) %Pause between operations
        
    end
    i = 0; %reset iteration counter for while loop
    if iter < trialnum
        set(txt3,'String','','Color','w','FontSize',150)
        disp('Press any button to continue to next trial')
        pause
        clc
    else
        disp('End of trials')
        set(txt3,'String','You did it!','Color','w','FontSize',48);
        break
    end
end

% !!! Need to create a save function that saves the operations that the
% participant performed.

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

handles.opnum = str2double(get(hObject,'String'));
guidata(hObject, handles)


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

function trialnum_Callback(hObject, eventdata, handles)
% hObject    handle to edit3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit3 as text
%        str2double(get(hObject,'String')) returns contents of edit3 as a double

handles.trialnum = str2double(get(hObject,'String'));
guidata(hObject, handles)


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


% --- Executes on slider movement.
function displaytime_Callback(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider
handles.displaytime = get(hObject,'Value');
guidata(hObject, handles)

% !!! Need to include something to display the currect value of the slider
% in a textbox

% --- Executes during object creation, after setting all properties.
function displaytime_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

handles.displaytime = get(hObject,'Value');
guidata(hObject, handles)


function finalnum_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double
handles.finalnum = str2double(get(hObject,'String'));
guidata(hObject, handles)

% !!! Need to Include a log of which trials where correct and which were
% incorrect. (example below)
% if handles.finalnum == correct value
%     log(trial number) = 1;
% else
%     log(trial number = 0;
% end
% --- Executes during object creation, after setting all properties.
function finalnum_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
