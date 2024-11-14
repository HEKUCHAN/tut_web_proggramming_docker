SCRIPT_PATH=./scripts/new_class.sh

new-class:
	bash $(SCRIPT_PATH) --template

new-class-with-no-template:
	bash $(SCRIPT_PATH)

new-class-with-template-no-html:
	bash $(SCRIPT_PATH) --template --with-no-html-folder
