FROM ubuntu:20.04

ENV TZ=America/Sao_Paulo
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt update && apt upgrade -y

RUN apt install nano -y
RUN apt install winbind -y

RUN dpkg --add-architecture i386
RUN apt update

RUN apt install wine64 -y 
RUN apt install wine32 -y
RUN apt install winetricks -y

RUN apt clean && apt autoclean && apt autoremove -y

RUN exit
RUN bash

RUN WINEARCH=win32

RUN winetricks -q dotnet48

RUN wine /root/.wine/drive_c/windows/Microsoft.NET/Framework/v4.0.30319/ngen.exe executequeueditems || true

RUN wine /root/.wine/drive_c/windows/Microsoft.NET/Framework64/v4.0.30319/ngen.exe executequeueditems || true
