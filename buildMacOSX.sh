# replace external address with internal one.
sed -i.bak 's/https.*8543/http:\/\/192.168.10.77:8111/g' paket.lock


$mono64 ".paket/paket.bootstrapper.exe"
$mono64 ".paket/paket.exe" restore
$mono64 "packages/FAKE/tools/FAKE.exe" buildUnix.fsx Build $1
$mono64 "packages/NUnit.Runners/tools/nunit-console.exe" "-labels" "-nologo" "-xml:TestResult.xml" "release/Tutorial.Cs.exe" "release/Tutorial.Fs.exe"
#$mono64 "packages/NUnit.Runners/tools/nunit-console.exe" "-labels" "-nologo" "-xml:TestResult.xml" "-framework:4.5" "release/Tutorial.Cs.exe"
