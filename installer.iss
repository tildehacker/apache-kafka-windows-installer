#include <idp.iss>

#define MyAppName "Apache Kafka"
#define MyAppVersion "2.5.0"
#define MyAppPublisher "The Apache Software Foundation"
#define MyAppURL "https://kafka.apache.org"

[Setup]
AppId={{D46D6351-6331-4A61-8227-21E2FB669285}
AppName={#MyAppName}
AppVersion={#MyAppVersion}
AppVerName={#MyAppName} {#MyAppVersion}
AppPublisher={#MyAppPublisher}
AppPublisherURL={#MyAppURL}
AppSupportURL={#MyAppURL}
AppUpdatesURL={#MyAppURL}
DefaultDirName={sd}\ApacheKafka
DisableDirPage=yes
DefaultGroupName={#MyAppName}
AllowNoIcons=yes
LicenseFile=LICENSE
OutputBaseFilename=ApacheKafka_{#MyAppVersion}
Compression=lzma
SolidCompression=yes
WizardStyle=modern

[Languages]
Name: "english"; MessagesFile: "compiler:Default.isl"

[Files]
Source: "quickstart\*"; DestDir: "{app}"; Flags: ignoreversion recursesubdirs createallsubdirs
Source: "{tmp}\unzip.exe"; DestDir: "{tmp}"; Flags: external; ExternalSize: 167936
Source: "{tmp}\TarTool.zip"; DestDir: "{tmp}"; Flags: external; ExternalSize: 80603
Source: "{tmp}\openjdk-14.0.1_windows-x64_bin.zip"; DestDir: "{tmp}"; Flags: external; ExternalSize: 198729845
Source: "{tmp}\kafka_2.12-2.5.0.tgz"; DestDir: "{tmp}"; Flags: external; ExternalSize: 61604633

[Code]
procedure InitializeWizard();
begin
    idpAddFileSize('http://stahlworks.com/dev/unzip.exe', ExpandConstant('{tmp}\unzip.exe'), 167936);
    idpAddFileSize('https://github.com/senthilrajasek/tartool/releases/download/1.0.0/TarTool.zip', ExpandConstant('{tmp}\TarTool.zip'), 80603);
    idpAddFileSize('https://download.java.net/java/GA/jdk14.0.1/664493ef4a6946b186ff29eb326336a2/7/GPL/openjdk-14.0.1_windows-x64_bin.zip', ExpandConstant('{tmp}\openjdk-14.0.1_windows-x64_bin.zip'), 198729845);
    idpAddFileSize('https://downloads.apache.org/kafka/2.5.0/kafka_2.12-2.5.0.tgz', ExpandConstant('{tmp}\kafka_2.12-2.5.0.tgz'), 61604633);

    idpDownloadAfter(wpReady);
end;

[Run]
Filename: "{tmp}\unzip.exe"; Parameters: "{tmp}\openjdk-14.0.1_windows-x64_bin.zip -d {app}"
Filename: "{tmp}\unzip.exe"; Parameters: "{tmp}\TarTool.zip -d {tmp}"
Filename: "{tmp}\TarTool.exe"; Parameters: "{tmp}\kafka_2.12-2.5.0.tgz {app}"

[Icons]
Name: "{group}\create-test-topic-quickstart.bat"; Filename: "{app}\create-test-topic-quickstart.bat"
Name: "{group}\kafka-console-consumer-quickstart.bat"; Filename: "{app}\kafka-console-consumer-quickstart.bat"
Name: "{group}\kafka-console-producer-quickstart.bat"; Filename: "{app}\kafka-console-producer-quickstart.bat"
Name: "{group}\kafka-server-start-quickstart.bat"; Filename: "{app}\kafka-server-start-quickstart.bat"
Name: "{group}\list-topics-quickstart.bat"; Filename: "{app}\list-topics-quickstart.bat"
Name: "{group}\zookeeper-server-start-quickstart.bat"; Filename: "{app}\zookeeper-server-start-quickstart.bat"
Name: "{group}\{cm:ProgramOnTheWeb,{#MyAppName}}"; Filename: "{#MyAppURL}"
Name: "{group}\{cm:UninstallProgram,{#MyAppName}}"; Filename: "{uninstallexe}"

[UninstallDelete]
Type: filesandordirs; Name: "{app}\jdk-14.0.1"
Type: filesandordirs; Name: "{app}\kafka_2.12-2.5.0"
