# Makefile generated by makebreed
# http://makebreed.googlecode.com

# Creation Time: 'Tue Apr  9 22:39:37 WEDT 2013'

PKGNAME = ffmpegyag
PKGVERSION = 0.6.0
PKGSECTION = video
PKGAUTHOR = Ronny Wegener <wegener.ronny@gmail.com>
PKGHOMEAGE = http://ffmpegyag.googlecode.com
PKGDEPENDS = ffmpeg
PKGDESCRIPTION = A GTK based GUI for ffmpeg\n\
 FFmpegYAG is a GUI for the popular FFmpeg audio/video encoding tool\n\
 .

SRCPATTERN = *.cpp
SRCDIR = src
RCPATTERN = app.rc
RCDIR = res
OBJDIR = obj
DISTROOT = dist/msw
BINFILE = dist/msw/bin/ffmpegyag.exe

CC = mingw32-g++.exe
CFLAGS = -c -Wall -O2 -D__GNUWIN32__ -D__WXMSW__ -DwxUSE_UNICODE -Iinclude/msw -Ilib/msw/wx/mswu -Iinclude/msw/ffmpeg
RC = windres.exe
RCFLAGS = -J rc -O coff -F pe-i386 -Iinclude/msw
LD = mingw32-g++.exe
LDFLAGS = -s -static-libgcc -static-libstdc++ -mwindows
LDLIBS = -Llib/msw/wx -lwxmsw28u -lwxmsw28u_gl -lwxexpat -lwxregexu -lwxpng -lwxjpeg -lwxtiff -lwxzlib -Llib/msw/ffmpeg -lavformat.dll -lavcodec.dll -lswscale.dll -lavutil.dll -L/mingw/lib -lwinspool -lole32 -loleaut32 -luuid -lcomctl32 -lopengl32

SRCFILES := $(shell find $(SRCDIR) -type f -name '' $(addprefix -or -name , $(SRCPATTERN)))

RCFILES := $(shell find $(RCDIR) -type f -name '' $(addprefix -or -name , $(RCPATTERN)))

OBJFILES := $(patsubst $(SRCDIR)/%, $(OBJDIR)/%.o, $(SRCFILES)) $(patsubst $(RCDIR)/%, $(OBJDIR)/%.x, $(RCFILES))

DISTFILES := $(patsubst $(DISTROOT)/%, %, $(shell find $(DISTROOT) -type f))
DISTDIRECTORIES := $(patsubst $(DISTROOT)/%, %, $(shell find $(DISTROOT) -type d -empty))

all: $(BINFILE)
		
$(BINFILE): $(OBJFILES)
		@echo 
		@$(shell mkdir -p $(dir $@))
		$(LD) $(LDFLAGS) -o $@ $^ $(LDLIBS)

$(CURDIR)/$(OBJDIR)/%.o $(CURDIR)/$(SRCDIR)/%.o $(SRCDIR)/%.o: $(OBJDIR)/%.o
$(CURDIR)/$(OBJDIR)/%.x $(CURDIR)/$(RCDIR)/%.x $(RCDIR)/%.x: $(OBJDIR)/%.x
		
$(OBJDIR)/%.x: $(RCDIR)/%
		@echo 
		@$(shell mkdir -p $(dir $@))
		$(RC) $(RCFLAGS) -o $@ -i $<
		@$(CC) $(CFLAGS) -M $< > $(OBJDIR)/$*.depend 2> /dev/null
		
$(OBJDIR)/%.o: $(SRCDIR)/%
		@echo 
		@$(shell mkdir -p $(dir $@))
		$(CC) $(CFLAGS) -o $@ $<
		@$(CC) $(CFLAGS) -M $< > $(OBJDIR)/$*.depend

-include $($(OBJFILES:.o=.depend):.x=.depend)

clean:
		@rm -f $(OBJFILES) $(OBJFILES:.o=.depend) $(OBJFILES:.x=.depend) $(BINFILE)

install:
		@cp -v -r $(DISTROOT)/* /usr/local
		-@update-menus

uninstall:
		@rm -v -f $(addprefix /usr/local/, $(DISTFILES)) 2> /dev/null
		@rmdir -p --ignore-fail-on-non-empty $(addprefix /usr/local/, $(DISTDIRECTORIES)) 2> /dev/null
		@rmdir -p --ignore-fail-on-non-empty $(dir $(addprefix /usr/local/, $(DISTFILES))) 2> /dev/null
		-@update-menus

TGZPKG := $(PKGNAME)_$(PKGVERSION).tar.gz

tgz:
		@tar -v -c -z --exclude='$(TGZPKG)' --exclude='make*' --exclude='Make*' --exclude='*.deb' --exclude='$(BINFILE)' --exclude='$(OBJDIR)/*' -f $(TGZPKG) *

