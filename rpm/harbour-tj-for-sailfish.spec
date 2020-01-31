Name: harbour-tj-for-sailfish
Summary: Tänään jäljellä
Version: 1.2.0
Release: 1
URL: https://github.com/Tomin1/tj-for-sailfish
Source: %{name}-%{version}.tar.gz
License: GPLv3
BuildArch: noarch
BuildRequires: pkgconfig(Qt5Quick)
BuildRequires: pkgconfig(Qt5Qml)
BuildRequires: pkgconfig(Qt5Core)
BuildRequires: pkgconfig(sailfishapp) >= 0.0.11
BuildRequires: librsvg-tools
Requires: sailfishsilica-qt5
Requires: libsailfishapp-launcher

%description
%{summary} on aamukampasovellus Sailfish-käyttöjärjestelmälle.

%prep
%autosetup -n %{name}-%{version}/%{name}

%build
%qmake5

%install
%qmake5_install

for size in 86 108 128 172
do
    mkdir -p %{buildroot}%{_datadir}/icons/hicolor/${size}x${size}/apps/
    rsvg-convert --width=$size --height=$size --output \
        %{buildroot}%{_datadir}/icons/hicolor/${size}x${size}/apps/%{name}.png \
        src/tj-for-sailfish.svg
done

%files
%defattr(-,root,root,-)
%{_datadir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png
