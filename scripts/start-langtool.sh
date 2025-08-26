cd /home/dimits/.local/bin/LanguageTool-latest-snapshot/LanguageTool-6.7-SNAPSHOT
java -cp languagetool-server.jar org.languagetool.server.HTTPServer --config server.properties --port 8081 --allow-origin
