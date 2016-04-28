function varargout = interface(varargin)
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @interface_OpeningFcn, ...
                   'gui_OutputFcn',  @interface_OutputFcn, ...
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




function interface_OpeningFcn(hObject, eventdata, handles, varargin)
handles.output = hObject;
guidata(hObject, handles);

function varargout = interface_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;



function pushbutton1_Callback(hObject, eventdata, handles)
imageToEncode = uigetfile('*','Select the image');
addImageToDB(imageToEncode,imageToEncode);


function pushbutton2_Callback(hObject, eventdata, handles)
objectToRecognize = uigetfile('*','Select the image');
recognizeObject(objectToRecognize);
