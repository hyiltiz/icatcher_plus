SHELL := /bin/bash

.ONESHELL:  # not needed if we always chain subcommands with semicolon and \

all: setup install run

setup:
	python3 -m venv .venv --prompt icatchter_plus

install:
	. .venv/bin/activate; \
	pip3 install --upgrade pip;\
	pip3 install -r requirements.txt;\
	pip3 install -e .  # also install local packages

run:
	. .venv/bin/activate;\
	python visualize.py output resource/lookit_annotations/coding_human1 resource/lookit_annotations/coding_icatcherplus just_annotations --human2_codings_folder resource/lookit_annotations/coding_human2

test:
	. .venv/bin/activate;\
	python visualize.py output resource/lookit_annotations/coding_human1 resource/lookit_annotations/coding_icatcherplus just_annotations --human2_codings_folder resource/lookit_annotations/coding_human2

clean:
	find -iname "*.pyc" -delete
	find -type d -name "__pycache__" -delete

purge:
	rm -rf .venv
