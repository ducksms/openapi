run:
	make bundle
	make ruby
	make go
	make typescript
	make python
	make swift
	make java
	make kotlin
	make php
	make csharp
	@echo Clients library generated, check clients directory.
bundle:
	swagger-cli bundle -t yaml -w 300 DuckSMS-OpenAPI.yaml > tmp/compiled.yaml	
ruby:
	openapi-generator generate -i tmp/compiled.yaml -g ruby -o clients/ruby -t ./openapi-generator/templates/ruby-client -c ./openapi-generator/ruby_lang.yaml
go:
	openapi-generator generate -i tmp/compiled.yaml -g go -o clients/go -t ./openapi-generator/templates/go -c ./openapi-generator/go_lang.yaml
	go install golang.org/x/tools/cmd/goimports@latest
	goimports -w clients/go
	cd clients/go && go mod tidy
typescript:
	openapi-generator generate -i tmp/compiled.yaml -g typescript-fetch -o clients/typescript -t ./openapi-generator/templates/typescript-fetch -c ./openapi-generator/typescript_lang.yaml
python:
	openapi-generator generate -i tmp/compiled.yaml -g python -o clients/python -t ./openapi-generator/templates/python -c ./openapi-generator/python_lang.yaml
swift:
	openapi-generator generate -i tmp/compiled.yaml -g swift5 -o clients/swift -c ./openapi-generator/swift5_lang.yaml
java:
	openapi-generator generate -i tmp/compiled.yaml -g java -o clients/java -t ./openapi-generator/templates/java -c ./openapi-generator/java_lang.yaml
kotlin:
	openapi-generator generate -i tmp/compiled.yaml -g kotlin -o clients/kotlin -t ./openapi-generator/templates/kotlin-client -c ./openapi-generator/kotlin_lang.yaml
php:
	openapi-generator generate -i tmp/compiled.yaml -g php -o clients/php -t ./openapi-generator/templates/php -c ./openapi-generator/php_lang.yaml
csharp:
	openapi-generator generate -i tmp/compiled.yaml -g csharp -o clients/csharp -c ./openapi-generator/csharp_lang.yaml