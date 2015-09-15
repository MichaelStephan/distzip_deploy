export CUR=`pwd`
cd $1
lein cljsbuild once
lein uberjar callanalyzer.web
cd $CUR
rm -r ./build/lib/*
mv $1/target/*-standalone.jar build/lib/app.jar
zip build.zip ./build/bin/* ./build/lib/*
cf push -f default.yaml
