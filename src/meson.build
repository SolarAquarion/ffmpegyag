sources = [
  'app.cpp',               
  'EncodingMediaStreams.cpp',  
  'resource.cpp',
  'AudioFrame.cpp',          
  'EncodingSettings.cpp',      
  'StreamBuffer.cpp',
  'AVConvGUIMain.cpp',       
  'EncodingTask.cpp',        
  'VideoFrame.cpp',
  'AVConvSettings.cpp',    
  'Libav.cpp',                 
  'VideoFrameGOP.cpp',
  'EncodingFileLoader.cpp',  
  'MediaStreamThread.cpp',
  'EncodingFileSaver.cpp',   
  'MKVremuxGUI.cpp',
  'devices/audio/AlsaDevice.cpp',   
  'devices/audio/WinMMDevice.cpp',
  'devices/audio/AudioDevice.cpp',
  'devices/video/GLDevice.cpp',     
  'devices/video/WGLDevice.cpp',
  'devices/video/GLXDevice.cpp',    
  'devices/video/WXGLDevice.cpp',
  'devices/video/VideoDevice.cpp',
  ]

  thread_dep = dependency('threads')

cflags = [
  '-I/usr/lib/wx/include/gtk2-unicode-3.0', 
  '-I/usr/include/wx-3.0 -D_FILE_OFFSET_BITS=64', 
  '-DWXUSINGDLL', 
  '-D__WXGTK__'
  ]
avcodec = dependency('libavcodec')
avformat = dependency('libavformat')
avfilter = dependency('libavfilter')
avresample = dependency('libavresample')
swscale = dependency('libswscale')
avdevice = dependency('libavdevice')  
avutil = dependency('libavutil')   
x11 = dependency('x11')
alsa = dependency('alsa')
wx = dependency('wxwidgets')
gl = dependency('gl')
executable('ffmpegyag', sources,
  dependencies : [gl, alsa, wx, avcodec, avformat, avresample, swscale, avdevice, avutil, x11],
  c_args: cflags,
  install: true
)

