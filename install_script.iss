#define APP_EXE_FILE "qspgui.exe"
#define APP_NAME "QSP Game Kit"
#define APP_ID "QSPGameKit"

[Setup]
AppName={#APP_NAME}
AppVersion={#APP_VERSION}
AppId={{2F0624E6-7464-4D10-B1E9-C3ACEA998DDC}
AppPublisher=QSP Foundation
AppPublisherURL=https://qsp.org/
AppSupportURL=https://qsp.org/
AppUpdatesURL=https://qsp.org/
DefaultDirName=C:\QSP Game Kit
DefaultGroupName={#APP_NAME}
OutputBaseFilename=QSPGameKit-{#APP_VERSION}
ChangesAssociations=yes
ShowLanguageDialog=auto
Compression=lzma
DisableDirPage=auto
DisableProgramGroupPage=auto
AllowNoIcons=yes
SetupIconFile=logo.ico
UninstallDisplayIcon=logo.ico
SourceDir={#SOURCE_DIR}

[Files]
Source: "*.*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs

[Registry]
; setup associations
Root: HKA; Subkey: "Software\{#APP_ID}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\{#APP_ID}\Capabilities"; ValueType: string; ValueName: "ApplicationName"; ValueData: "{#APP_NAME}"
Root: HKA; Subkey: "Software\{#APP_ID}\Capabilities"; ValueType: string; ValueName: "ApplicationIcon"; ValueData: "{app}\{#APP_EXE_FILE},0"
Root: HKA; Subkey: "Software\{#APP_ID}\Capabilities"; ValueType: string; ValueName: "ApplicationDescription"; ValueData: "{#APP_NAME} {#APP_VERSION}"
Root: HKA; Subkey: "Software\RegisteredApplications"; ValueType: string; ValueName: "{#APP_ID}"; ValueData: "Software\{#APP_ID}\Capabilities"; Flags: uninsdeletevalue
; associate file types
Root: HKA; Subkey: "Software\Classes\.qsp\OpenWithProgids"; ValueType: string; ValueName: "{#APP_ID}.qsp"; ValueData: ""; Flags: uninsdeletevalue
Root: HKA; Subkey: "Software\Classes\{#APP_ID}.qsp"; ValueType: string; ValueName: ""; ValueData: "{#APP_ID}"; Flags: uninsdeletekey
Root: HKA; Subkey: "Software\Classes\{#APP_ID}.qsp\DefaultIcon"; ValueType: string; ValueName: ""; ValueData: "{app}\{#APP_EXE_FILE},0"
Root: HKA; Subkey: "Software\Classes\{#APP_ID}.qsp\shell\open\command"; ValueType: string; ValueName: ""; ValueData: """{app}\{#APP_EXE_FILE}"" ""%1"""
Root: HKA; Subkey: "Software\Classes\Applications\{#APP_EXE_FILE}\SupportedTypes"; ValueType: string; ValueName: ".qsp"; ValueData: ""
Root: HKA; Subkey: "Software\{#APP_ID}\Capabilities\FileAssociations"; ValueType: string; ValueName: ".qsp"; ValueData: "{#APP_ID}.qsp"

[Run]
Filename: "{app}\{#APP_EXE_FILE}"; Description: "{cm:LaunchProgram,{#APP_NAME}}"; Flags: postinstall skipifsilent nowait

[Icons]
Name: "{group}\{#APP_NAME}"; Filename: "{app}\{#APP_EXE_FILE}";
Name: "{group}\{cm:ProgramOnTheWeb,{#APP_NAME}}"; Filename: "https://qsp.org/";
Name: "{group}\{cm:UninstallProgram,{#APP_NAME}}"; Filename: "{uninstallexe}";
Name: "{autodesktop}\{#APP_NAME}"; Filename: "{app}\{#APP_EXE_FILE}"; Tasks: desktopicon;

[Tasks]
Name: "desktopicon"; Description: "{cm:CreateDesktopIcon}"; GroupDescription: "{cm:AdditionalIcons}";

[UninstallDelete]
Type: files; Name: "{app}\*.*"
Type: dirifempty; Name: "{app}"

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"
Name: "armenian"; MessagesFile: "compiler:Languages\Armenian.isl"
Name: "brazilianportuguese"; MessagesFile: "compiler:Languages\BrazilianPortuguese.isl"
Name: "catalan"; MessagesFile: "compiler:Languages\Catalan.isl"
Name: "corsican"; MessagesFile: "compiler:Languages\Corsican.isl"
Name: "czech"; MessagesFile: "compiler:Languages\Czech.isl"
Name: "danish"; MessagesFile: "compiler:Languages\Danish.isl"
Name: "dutch"; MessagesFile: "compiler:Languages\Dutch.isl"
Name: "finnish"; MessagesFile: "compiler:Languages\Finnish.isl"
Name: "french"; MessagesFile: "compiler:Languages\French.isl"
Name: "german"; MessagesFile: "compiler:Languages\German.isl"
Name: "greek"; MessagesFile: "compiler:Languages\Greek.isl"
Name: "hebrew"; MessagesFile: "compiler:Languages\Hebrew.isl"
Name: "hungarian"; MessagesFile: "compiler:Languages\Hungarian.isl"
Name: "italian"; MessagesFile: "compiler:Languages\Italian.isl"
Name: "japanese"; MessagesFile: "compiler:Languages\Japanese.isl"
Name: "norwegian"; MessagesFile: "compiler:Languages\Norwegian.isl"
Name: "polish"; MessagesFile: "compiler:Languages\Polish.isl"
Name: "portuguese"; MessagesFile: "compiler:Languages\Portuguese.isl"
Name: "russian"; MessagesFile: "compiler:Languages\Russian.isl"
Name: "serbiancyrillic"; MessagesFile: "compiler:Languages\SerbianCyrillic.isl"
Name: "serbianlatin"; MessagesFile: "compiler:Languages\SerbianLatin.isl"
Name: "slovenian"; MessagesFile: "compiler:Languages\Slovenian.isl"
Name: "spanish"; MessagesFile: "compiler:Languages\Spanish.isl"
Name: "turkish"; MessagesFile: "compiler:Languages\Turkish.isl"
Name: "ukrainian"; MessagesFile: "compiler:Languages\Ukrainian.isl"
