Name: harbour-tj-for-sailfish
Summary: Tänään jäljellä
Version: 1.2.1
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
%autosetup -n %{name}-%{version}

%build
%qmake5

%make_build

%install
%qmake5_install

%files
%defattr(-,root,root,-)
%{_datadir}/%{name}
%{_datadir}/applications/%{name}.desktop
%{_datadir}/icons/hicolor/*/apps/%{name}.png
