function varargout = GUI(varargin)

% GUI MATLAB code for GUI.fig
%      GUI, by itself, creates a new GUI or raises the existing
%      singleton*.
%
%      H = GUI returns the handle to a new GUI or the handle to
%      the existing singleton*.
%
%      GUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUI.M with the given input arguments.
%
%      GUI('Property','Value',...) creates a new GUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUI

% Last Modified by GUIDE v2.5 22-Dec-2015 10:26:59

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUI_OpeningFcn, ...
                   'gui_OutputFcn',  @GUI_OutputFcn, ...
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


% --- Executes just before GUI is made visible.
function GUI_OpeningFcn(hObject, eventdata, handles, varargin)

% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to GUI (see VARARGIN)

% Choose default command line output for GUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes GUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[filename,pathname] = imgetfile();
global myimg1;
myimg1=imread(filename);
%img{i} = imread(list(i).name);
 if pathname
     msgbox(sprintf('Error'),'Error','Error');
     return
 end
 
 


I = imread('image.jpg');
grayimage=rgb2gray(I);
%ad=imadjust(grayimage,[0.1,0.9],[0.0,1.0]);
ad=imadjust(grayimage);
%filtered2=fspecial('average',[3 3]);
%filtered=imfilter(grayimage,filtered2);
filtered=imnoise(ad,'salt & pepper',0);
%sharpen= imsharpen(I);
%contrast=imcontrast(filtered);

%pixel_avg=mean(filtered(:));
%perprocessed=pixel_avg-grayimage;

SE=strel('disk',3);
%filtered=imopen(grayimage,SE);

erosion=imerode(filtered,SE);
dilation=imdilate(filtered,SE);
diff=dilation-erosion;
%image_dilate_diff=dilation-grayimage;
%image_erode_diff=erosion-grayimage;
gradient_image=filtered-diff;
SE2=strel('diamond',3);
new_dilation=imdilate(gradient_image,SE2);

axes(handles.axes1);
imshow(I);
c=edge(new_dilation,'sobel');
axes(handles.axes2);
imshow(c);


c2=edge(new_dilation,'prewitt');
axes(handles.axes3);
imshow(c2);


c3=edge(new_dilation,'canny',0.2);
axes(handles.axes4);
imshow(c3);






 
 
