# makefile for ffjpeg project
# written by rockcarry

# ����������
CC      = i586-mingw32msvc-gcc
CCFLAGS = -Wall

# ���е�Ŀ���ļ�
OBJS = \
    color.o \
    dct.o   \
    quant.o \
    zigzag.o\
    rle.o   \
    huffman.o

# ���еĿ�ִ��Ŀ��
EXES = \
    ffjpeg.exe \

# ����Ŀ��ļ�
DLL = ffjpeg.dll

# �������
all : $(DLL) $(EXES)

$(DLL) : $(OBJS)
	$(CC) $(CCFLAGS) -o $@ $(OBJS) --share

%.o : %.c %.h stdefine.h
	$(CC) $(CCFLAGS) -o $@ $< -c

%.o : %.cpp %.h stdefine.h
	$(CC) $(CCFLAGS) -o $@ $< -c

%.o : %.c stdefine.h
	$(CC) $(CCFLAGS) -o $@ $< -c

%.o : %.cpp stdefine.h
	$(CC) $(CCFLAGS) -o $@ $< -c

%.exe : %.c %.h $(DLL)
	$(CC) $(CCFLAGS) -o $@ $< $(DLL)

%.exe : %.cpp %.h $(DLL)
	$(CC) $(CCFLAGS) -o $@ $< $(DLL)

%.exe : %.c $(DLL)
	$(CC) $(CCFLAGS) -o $@ $< $(DLL)

%.exe : %.cpp $(DLL)
	$(CC) $(CCFLAGS) -o $@ $< $(DLL)

clean :
	-rm -f *.o
	-rm -f *.dll
	-rm -f *.exe

# rockcarry
# 2016.1.5
# THE END


